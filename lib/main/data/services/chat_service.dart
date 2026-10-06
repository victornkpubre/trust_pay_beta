import 'package:dio/dio.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:trust_pay_beta/main/data/network/error_handler.dart';
import 'package:trust_pay_beta/main/app/constants.dart';
import 'package:trust_pay_beta/main/data/data_source/local_database/preferences.dart';

/// Plain Dio calls to trust_pay_api's conversation endpoints (Stage 5) —
/// not routed through the Retrofit-generated DataBaseApiClient, to avoid
/// needing a build_runner codegen pass for this one feature. Mirrors the
/// same pattern AiChatBloc already uses for trust_pay_ai.
class ChatService {
  final AppPreferences appPreferences;
  // Generous timeouts: a Render free-tier instance can take ~30-60s to wake
  // from sleep, and the first request after that shouldn't look like a failure.
  final Dio _dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
  ));

  ChatService(this.appPreferences);

  Future<Map<String, String>> _authHeaders() async {
    final token = await appPreferences.getAccessToken();
    return {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
  }

  /// Retries once after a short pause when the request never reached the
  /// server (flaky mobile data, DNS hiccup, instance still waking up).
  Future<Response<dynamic>> _withRetry(Future<Response<dynamic>> Function() request) async {
    try {
      return await request();
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError || e.type == DioExceptionType.connectionTimeout) {
        await Future.delayed(const Duration(seconds: 2));
        return await request();
      }
      rethrow;
    }
  }

  Future<List<dynamic>> listConversations() async {
    final headers = await _authHeaders();
    final response = await _withRetry(() => _dio.get(
          '${AppConstants.baseUrl}/api/conversations',
          options: Options(headers: headers),
        ));
    return response.data['data'] as List<dynamic>;
  }

  Future<Map<String, dynamic>> getConversation(int conversationId) async {
    final headers = await _authHeaders();
    final response = await _withRetry(() => _dio.get(
          '${AppConstants.baseUrl}/api/conversations/$conversationId',
          options: Options(headers: headers),
        ));
    return response.data['data'] as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> createConversation({
    required List<int> participantIds,
    int? transactionId,
    String? title,
  }) async {
    final headers = await _authHeaders();
    final response = await _withRetry(() => _dio.post(
          '${AppConstants.baseUrl}/api/conversations',
          data: {
            'participant_ids': participantIds,
            if (transactionId != null) 'transaction_id': transactionId,
            if (title != null) 'title': title,
          },
          options: Options(headers: headers),
        ));
    return response.data['data'] as Map<String, dynamic>;
  }

  Future<List<dynamic>> fetchMessages(int conversationId) async {
    final headers = await _authHeaders();
    final response = await _withRetry(() => _dio.get(
          '${AppConstants.baseUrl}/api/conversations/$conversationId/messages',
          options: Options(headers: headers),
        ));
    return response.data['data'] as List<dynamic>;
  }
}

/// A message safe to show the user for a chat request/socket failure —
/// the shared friendly message, plus chat-specific cases.
String chatErrorMessage(Object error) {
  if (error is DioException && error.response?.statusCode == 403) {
    return "You're not part of this conversation.";
  }
  // The live socket only fails this way when it can't reach the server.
  if (error is WebSocketChannelException) return ErrorMessages.noConnection;
  return friendlyErrorMessage(error);
}
