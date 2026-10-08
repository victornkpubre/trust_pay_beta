import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/buttons/primary_btn.dart';
import 'package:trust_pay_beta/components/buttons/secondary_btn.dart';
import 'package:trust_pay_beta/components/popups/popup_bar.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/functions/proof_capture.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/add_transaction_proof.dart';
import 'package:trust_pay_beta/main/presentation/base/toast.dart';

/// Bottom sheet: take a photo or video in-app, stamp it with the GPS
/// location, and upload it as proof for delivery/attendance obligations of
/// [transaction]. If [obligationIds] is empty the user picks them. Pops with the updated transaction on success,
/// or null if the user closes it.
Future<Transaction?> showProofCaptureModal(BuildContext context, Transaction transaction, {List<int> obligationIds = const [], String? subtitle}) {
  return showModalBottomSheet<Transaction>(
    context: context,
    isScrollControlled: true,
    builder: (_) => ProofCapturePopup(
      remoteDataSource: context.read<RemoteDataSource>(),
      transaction: transaction,
      obligationIds: obligationIds,
      subtitle: subtitle,
    ),
  );
}

class ProofCapturePopup extends StatefulWidget {
  final RemoteDataSource remoteDataSource;
  final Transaction transaction;
  final List<int> obligationIds;
  final String? subtitle;

  const ProofCapturePopup({
    super.key,
    required this.remoteDataSource,
    required this.transaction,
    this.obligationIds = const [],
    this.subtitle,
  });

  @override
  State<ProofCapturePopup> createState() => _ProofCapturePopupState();
}

class _ProofCapturePopupState extends State<ProofCapturePopup> {
  CapturedProof? captured;
  late final Set<int> selected = widget.obligationIds.toSet();
  bool busy = false;
  String busyMessage = '';

  Future<void> capture(ProofMediaType type) async {
    setState(() {
      busy = true;
      busyMessage = 'Getting your location...';
    });
    final result = await captureProof(type);
    if (!mounted) return;
    setState(() => busy = false);
    result.fold(
      (failure) => toast(failure.message),
      (proof) {
        if (proof != null) setState(() => captured = proof);
      },
    );
  }

  Future<void> upload() async {
    final proof = captured;
    if (proof == null) return;
    if (selected.isEmpty) {
      toast('Choose which obligation this proof is for');
      return;
    }
    setState(() {
      busy = true;
      busyMessage = 'Uploading proof...';
    });
    final result = await AddTransactionProof(widget.remoteDataSource)
        .execute(widget.transaction, proof, obligationIds: selected.toList());
    if (!mounted) return;
    setState(() => busy = false);
    result.fold(
      (failure) => toast(failure.message),
      (transaction) {
        toast('Proof uploaded');
        Navigator.of(context).pop(transaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
      ),
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: AppSize.s8),
          const PopUpBar(),
          const SizedBox(height: AppSize.s16),
          Text('Add Proof', textAlign: TextAlign.center, style: appTextBlack24Bold),
          const SizedBox(height: AppSize.s8),
          Text(
            widget.subtitle ?? 'Take a photo or video of the product/service. Your GPS location is recorded with it so the other party can trust it.',
            textAlign: TextAlign.center,
            style: appTextGray14,
          ),
          const SizedBox(height: AppSize.s16),
          if (widget.obligationIds.isEmpty && !busy) ...[
            Text('This proof is for:', style: appTextGray14Bold),
            const SizedBox(height: AppSize.s8),
            Wrap(
              spacing: AppSize.s8,
              runSpacing: AppSize.s8,
              alignment: WrapAlignment.center,
              children: widget.transaction.obligations.where((o) => o.type.isFulfilment && o.id != null).map((o) {
                return FilterChip(
                  label: Text('${o.title} (${o.type.label})'),
                  selected: selected.contains(o.id),
                  selectedColor: AppColor.primary.withValues(alpha: 0.2),
                  onSelected: (on) => setState(() => on ? selected.add(o.id!) : selected.remove(o.id)),
                );
              }).toList(),
            ),
            const SizedBox(height: AppSize.s16),
          ],
          if (busy)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSize.s32),
              child: Column(
                children: [
                  CircularProgressIndicator(color: AppColor.primary),
                  const SizedBox(height: AppSize.s16),
                  Text(busyMessage, style: appTextGray14),
                ],
              ),
            )
          else if (captured == null) ...[
            PrimaryButton(title: 'Take Photo', icon: Icons.photo_camera, onTap: () => capture(ProofMediaType.image)),
            const SizedBox(height: AppSize.s16),
            SecondaryButton(title: 'Record Video', onTap: () => capture(ProofMediaType.video)),
          ] else ...[
            _CapturedPreview(proof: captured!, width: width),
            const SizedBox(height: AppSize.s16),
            PrimaryButton(title: 'Upload Proof', onTap: upload),
            const SizedBox(height: AppSize.s16),
            SecondaryButton(title: 'Retake', onTap: () => setState(() => captured = null)),
          ],
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _CapturedPreview extends StatelessWidget {
  final CapturedProof proof;
  final double width;
  const _CapturedPreview({required this.proof, required this.width});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(AppSize.s8),
          child: proof.mediaType == ProofMediaType.image
              ? Image.file(proof.file, height: 200, width: width, fit: BoxFit.cover)
              : Container(
                  height: 120,
                  width: width,
                  color: AppColor.lightGray,
                  child: Icon(Icons.videocam, size: 48, color: AppColor.primary),
                ),
        ),
        const SizedBox(height: AppSize.s8),
        ProofLocationText(
          latitude: proof.latitude,
          longitude: proof.longitude,
          accuracy: proof.accuracy,
          capturedAt: proof.capturedAt,
        ),
      ],
    );
  }
}

/// "📍 6.52441, 3.37920 (±8 m) · 8 Oct 2026, 14:03"
class ProofLocationText extends StatelessWidget {
  final double latitude;
  final double longitude;
  final double? accuracy;
  final DateTime capturedAt;
  final MainAxisAlignment alignment;
  const ProofLocationText({super.key, required this.latitude, required this.longitude, this.accuracy, required this.capturedAt, this.alignment = MainAxisAlignment.center});

  @override
  Widget build(BuildContext context) {
    final accuracyText = accuracy == null ? '' : ' (±${accuracy!.round()} m)';
    return Row(
      mainAxisAlignment: alignment,
      children: [
        Icon(Icons.location_on, size: 16, color: AppColor.primary),
        const SizedBox(width: AppSize.s4),
        Flexible(
          child: Text(
            '${latitude.toStringAsFixed(5)}, ${longitude.toStringAsFixed(5)}$accuracyText · '
            '${DateFormat('d MMM yyyy, HH:mm').format(capturedAt.toLocal())}',
            style: appTextGray12,
          ),
        ),
      ],
    );
  }
}
