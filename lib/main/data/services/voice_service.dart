import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:trust_pay_beta/main/app/constants.dart';
import 'package:trust_pay_beta/main/data/data_source/local_database/preferences.dart';

/// Talks to trust_pay_ai's voice endpoints: speech to text for what the user
/// says (POST /transcribe) and text to speech for the assistant's replies
/// (POST /speech). The transcribed text then goes through the normal /chat
/// flow, exactly as if it had been typed.
class VoiceService {
  final AppPreferences appPreferences;
  final Dio _dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 60),
  ));

  VoiceService(this.appPreferences);

  Future<Map<String, String>> _authHeaders() async {
    final token = await appPreferences.getAccessToken();
    return {'Authorization': 'Bearer $token', 'Accept': 'application/json'};
  }

  /// Uploads a recording and returns what was said ('' if nothing was heard).
  Future<String> transcribe(String audioFilePath) async {
    final response = await _dio.post(
      '${AppConstants.aiBaseUrl}/transcribe',
      data: FormData.fromMap({
        'audio': await MultipartFile.fromFile(
          audioFilePath,
          filename: 'speech.m4a',
          contentType: DioMediaType('audio', 'mp4'),
        ),
      }),
      options: Options(headers: await _authHeaders()),
    );
    return (response.data['text'] as String? ?? '').trim();
  }

  /// Returns the reply read aloud, as MP3 bytes.
  Future<Uint8List> speak(String text) async {
    final response = await _dio.post<List<int>>(
      '${AppConstants.aiBaseUrl}/speech',
      data: {'text': text},
      options: Options(headers: await _authHeaders(), responseType: ResponseType.bytes),
    );
    return Uint8List.fromList(response.data ?? const []);
  }
}
