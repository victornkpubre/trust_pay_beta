import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/buttons/primary_btn.dart';
import 'package:trust_pay_beta/components/popups/flows/proof_capture_popup.dart';
import 'package:trust_pay_beta/components/popups/popup_bar.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/delete_transaction_proof.dart';
import 'package:trust_pay_beta/main/presentation/base/toast.dart';
import 'package:trust_pay_beta/main/presentation/blocs/user/user_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

/// Bottom sheet listing a transaction's photo/video proofs with where and
/// when each was taken. Members can add more, or delete their own, from
/// here. [onUpdated] fires immediately whenever a proof is added or
/// deleted — the sheet can be dismissed by tapping outside it (not just via
/// a button), so the caller can't rely on an awaited return value alone to
/// learn about the change.
void showProofGalleryModal(BuildContext context, Transaction transaction, {void Function(Transaction)? onUpdated}) {
  final currentUserId = context.read<UserBloc>().state.user?.id;
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (_) => ProofGalleryPopup(
      transaction: transaction,
      hostContext: context,
      currentUserId: currentUserId,
      onUpdated: onUpdated,
    ),
  );
}

class ProofGalleryPopup extends StatefulWidget {
  final Transaction transaction;
  // The page's context: it can still read the providers after this sheet
  // opens another one on top.
  final BuildContext hostContext;
  final int? currentUserId;
  final void Function(Transaction)? onUpdated;
  const ProofGalleryPopup({super.key, required this.transaction, required this.hostContext, this.currentUserId, this.onUpdated});

  @override
  State<ProofGalleryPopup> createState() => _ProofGalleryPopupState();
}

class _ProofGalleryPopupState extends State<ProofGalleryPopup> {
  late Transaction transaction = widget.transaction;
  int? confirmingDeleteId;
  bool deleting = false;

  Future<void> addProof() async {
    final updated = await showProofCaptureModal(widget.hostContext, transaction);
    if (updated == null || !mounted) return;
    setState(() => transaction = updated);
    widget.onUpdated?.call(updated);
  }

  Future<void> deleteProof(TransactionProof proof) async {
    setState(() => deleting = true);
    final result = await DeleteTransactionProof(widget.hostContext.read<RemoteDataSource>())
        .execute(transaction, proof);
    if (!mounted) return;
    setState(() {
      deleting = false;
      confirmingDeleteId = null;
    });
    result.fold(
      (failure) => toast(failure.message),
      (updated) {
        setState(() => transaction = updated);
        widget.onUpdated?.call(updated);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final proofs = transaction.proofs.reversed.toList();
    // Proof is always tied to a delivery or attendance obligation.
    final canAddProof = transaction.obligations.any((o) => o.type.isFulfilment);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
      ),
      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: AppSize.s8),
          const PopUpBar(),
          const SizedBox(height: AppSize.s16),
          Text('Proof', textAlign: TextAlign.center, style: appTextBlack24Bold),
          const SizedBox(height: AppSize.s8),
          Text(
            'Photos and videos taken in the app for deliveries and attendance, with the GPS location where each was captured.',
            textAlign: TextAlign.center,
            style: appTextGray14,
          ),
          const SizedBox(height: AppSize.s16),
          Flexible(
            child: proofs.isEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppSize.s32),
                    child: Text('No proof has been added yet', style: appTextGray14),
                  )
                : ListView.separated(
                    shrinkWrap: true,
                    itemCount: proofs.length,
                    separatorBuilder: (_, __) => const Divider(),
                    itemBuilder: (_, i) {
                      final proof = proofs[i];
                      return _ProofTile(
                        proof: proof,
                        transaction: transaction,
                        isOwnProof: widget.currentUserId != null && proof.userId == widget.currentUserId,
                        confirmingDelete: confirmingDeleteId == proof.id,
                        deleting: deleting,
                        onTapDelete: () => setState(() => confirmingDeleteId = proof.id),
                        onCancelDelete: () => setState(() => confirmingDeleteId = null),
                        onConfirmDelete: () => deleteProof(proof),
                      );
                    },
                  ),
          ),
          const SizedBox(height: AppSize.s16),
          if (canAddProof)
            PrimaryButton(title: 'Add Proof', icon: Icons.add_a_photo, onTap: addProof)
          else
            Text('Proof can be added to delivery or attendance obligations. This transaction has none.',
                textAlign: TextAlign.center, style: appTextGray12),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _ProofTile extends StatelessWidget {
  final TransactionProof proof;
  final Transaction transaction;
  final bool isOwnProof;
  final bool confirmingDelete;
  final bool deleting;
  final VoidCallback onTapDelete;
  final VoidCallback onCancelDelete;
  final VoidCallback onConfirmDelete;
  const _ProofTile({
    required this.proof,
    required this.transaction,
    required this.isOwnProof,
    required this.confirmingDelete,
    required this.deleting,
    required this.onTapDelete,
    required this.onCancelDelete,
    required this.onConfirmDelete,
  });

  @override
  Widget build(BuildContext context) {
    final author = transaction.members.where((m) => m.id == proof.userId).firstOrNull;
    final obligationTitles = transaction.obligations
        .where((o) => proof.obligationIds.contains(o.id))
        .map((o) => o.title)
        .join(', ');
    final kind = proof.mediaType == ProofMediaType.image ? 'Photo' : 'Video';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => _open(Uri.parse(proof.url)),
              borderRadius: BorderRadius.circular(AppSize.s8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.s8),
                child: proof.mediaType == ProofMediaType.image
                    ? Image.network(
                        proof.url,
                        width: 72,
                        height: 72,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => _placeholder(Icons.broken_image),
                      )
                    : _placeholder(Icons.play_circle_fill),
              ),
            ),
            const SizedBox(width: AppSize.s16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    author == null ? kind : '$kind by ${author.firstName}',
                    style: appTextBlack16Bold,
                  ),
                  if (obligationTitles.isNotEmpty) Text('For: $obligationTitles', style: appTextGray12),
                  const SizedBox(height: AppSize.s4),
                  InkWell(
                    onTap: () => _open(proof.mapUri),
                    child: ProofLocationText(
                      latitude: proof.latitude,
                      longitude: proof.longitude,
                      accuracy: proof.accuracy,
                      capturedAt: proof.capturedAt,
                      alignment: MainAxisAlignment.start,
                    ),
                  ),
                  Text('Tap the location to view it on a map', style: appTextGray12),
                ],
              ),
            ),
            // Only the member who uploaded a proof can delete it — it may be
            // evidence another member is relying on.
            if (isOwnProof && !confirmingDelete)
              IconButton(
                onPressed: deleting ? null : onTapDelete,
                icon: Icon(Icons.delete_outline, color: AppColor.amber),
              ),
          ],
        ),
        if (isOwnProof && confirmingDelete) ...[
          const SizedBox(height: AppSize.s8),
          Row(
            children: [
              Expanded(
                child: Text('Delete this proof? This cannot be undone.', style: appTextGray14),
              ),
              TextButton(
                onPressed: deleting ? null : onCancelDelete,
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: deleting ? null : onConfirmDelete,
                child: deleting
                    ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                    : Text('Delete', style: TextStyle(color: AppColor.amber)),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _placeholder(IconData icon) => Container(
        width: 72,
        height: 72,
        color: AppColor.lightGray,
        child: Icon(icon, color: AppColor.primary, size: 32),
      );
}

Future<void> _open(Uri uri) async {
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    toast('Could not open link');
  }
}
