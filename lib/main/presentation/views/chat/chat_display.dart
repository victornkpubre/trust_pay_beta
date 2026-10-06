import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/user_image.dart';
import 'package:trust_pay_beta/components/style/colors.dart';

/// Shared display rules for a conversation map (ConversationResource JSON),
/// used by both the chat page header and the conversations list so they
/// always agree on title and avatar.

List<Map<String, dynamic>> chatParticipants(Map<String, dynamic> conversation) =>
    (conversation['participants'] as List<dynamic>? ?? []).cast<Map<String, dynamic>>();

/// Everyone in the conversation except the current user.
List<Map<String, dynamic>> chatCounterparties(Map<String, dynamic> conversation, int? myUserId) =>
    chatParticipants(conversation).where((p) => p['id'] != myUserId).toList();

String participantName(Map<String, dynamic> participant) {
  final name = '${participant['first_name'] ?? ''} ${participant['last_name'] ?? ''}'.trim();
  return name.isNotEmpty ? name : (participant['business_name'] as String? ?? '');
}

/// Transaction title first, then the conversation's own title, then the
/// counterparties' names — never a generic "Group chat".
String conversationTitle(Map<String, dynamic> conversation, int? myUserId) {
  final transaction = conversation['transaction'] as Map<String, dynamic>?;
  final candidates = [
    transaction?['title'] as String?,
    conversation['title'] as String?,
    chatCounterparties(conversation, myUserId).map(participantName).where((n) => n.isNotEmpty).join(', '),
  ];
  return candidates.firstWhere((t) => t != null && t.trim().isNotEmpty, orElse: () => 'Chat')!;
}

/// The counterparty's profile picture, or their initials when there's no
/// usable image URL.
class ChatAvatar extends StatelessWidget {
  final Map<String, dynamic>? participant;
  final double size;
  const ChatAvatar({super.key, required this.participant, this.size = 40});

  @override
  Widget build(BuildContext context) {
    final image = participant?['profile_image'] as String?;
    if (image != null && image.startsWith('http')) {
      return UserImage(image: image, size: size);
    }
    final name = participant != null ? participantName(participant!) : '';
    return CircleAvatar(
      radius: size / 2,
      backgroundColor: AppColor.secondary,
      child: name.isNotEmpty
          ? Text(name[0].toUpperCase(), style: TextStyle(color: AppColor.white, fontSize: size / 2.4))
          : Icon(Icons.person, color: AppColor.white, size: size / 1.8),
    );
  }
}
