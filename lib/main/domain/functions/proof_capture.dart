import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/functions/compressor.dart';

/// A photo/video taken on this device, plus where and when it was taken.
/// Not yet uploaded.
class CapturedProof {
  final File file;
  final ProofMediaType mediaType;
  final double latitude;
  final double longitude;
  final double? accuracy;
  final bool isMocked;
  final DateTime capturedAt;

  const CapturedProof({
    required this.file,
    required this.mediaType,
    required this.latitude,
    required this.longitude,
    required this.accuracy,
    required this.isMocked,
    required this.capturedAt,
  });
}

const _maxVideoDuration = Duration(seconds: 60);

/// Opens the camera (never the gallery, so old media can't be passed off as
/// new) and records the device's GPS location at the moment of capture.
/// Returns `Right(null)` if the user backs out of the camera.
Future<Either<Failure, CapturedProof?>> captureProof(ProofMediaType mediaType) async {
  // Check location first: there's no point taking a photo we can't stamp.
  final locationFailure = await _ensureLocationAccess();
  if (locationFailure != null) return Left(locationFailure);

  final picker = ImagePicker();
  final XFile? media;
  try {
    media = mediaType == ProofMediaType.image
        ? await picker.pickImage(source: ImageSource.camera, imageQuality: 70, maxWidth: 1920)
        : await picker.pickVideo(source: ImageSource.camera, maxDuration: _maxVideoDuration);
  } catch (e) {
    return Left(Failure(300, 'Could not open the camera. Allow camera access in your settings and try again.'));
  }
  if (media == null) return const Right(null);
  final capturedAt = DateTime.now();

  final Position position;
  try {
    // geolocator's own `timeLimit` is passed to the native Android side and
    // isn't a reliable backstop on its own (known to never fire in some
    // plugin versions, especially right after returning from the camera
    // Activity) — wrap it in a Dart-level timeout too, so this can't hang
    // the app indefinitely regardless of what the native call does.
    position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
      timeLimit: const Duration(seconds: 20),
    ).timeout(const Duration(seconds: 22));
  } catch (e) {
    return Left(Failure(300, 'Could not get your GPS location. Move somewhere with a clearer sky view and try again.'));
  }

  if (position.isMocked) {
    return Left(Failure(300, 'A fake GPS location was detected. Turn off any mock location app and try again.'));
  }

  File file = File(media.path);
  if (mediaType == ProofMediaType.video) {
    file = await compressVideo(media.path) ?? file;
  }

  return Right(CapturedProof(
    file: file,
    mediaType: mediaType,
    latitude: position.latitude,
    longitude: position.longitude,
    accuracy: position.accuracy,
    isMocked: position.isMocked,
    capturedAt: capturedAt,
  ));
}

Future<Failure?> _ensureLocationAccess() async {
  if (!await Geolocator.isLocationServiceEnabled()) {
    return Failure(300, 'Turn on location services. Proof must record where it was taken.');
  }

  var permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
  }
  if (permission == LocationPermission.deniedForever) {
    return Failure(300, 'Location access is blocked. Allow it for TrustPay in your phone settings to add proof.');
  }
  if (permission == LocationPermission.denied) {
    return Failure(300, 'Location access is required. Proof must record where it was taken.');
  }
  return null;
}
