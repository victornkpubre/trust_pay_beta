import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_compress/video_compress.dart';

/// Compresses an image using flutter_image_compress
Future<File?> compressImage(File file) async {
  final dir = await getTemporaryDirectory();
  final targetPath = '${dir.path}/compressed.jpg';

  var result = await FlutterImageCompress.compressAndGetFile(
    file.absolute.path,
    targetPath,
    quality: 50,
  );
  return result != null ? File(result.path) : null;
}

/// Compresses a video using video_compress
Future<File?> compressVideo(String inputPath) async {
  print("Compressing video...");

  final info = await VideoCompress.compressVideo(
    inputPath,
    quality: VideoQuality.MediumQuality,
    deleteOrigin: false,
  );

  if (info != null && info.file != null) {
    print("Compression complete: ${info.file!.path}");
    return info.file;
  } else {
    print("Compression failed.");
    return null;
  }
}
