import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechRecognitionService {
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;

  bool get isListening => _isListening;

  Future<void> toggleListening(void Function(String) onResult) async {
    if (_isListening) {
      await _speech.stop();
    } else {
      final available = await _speech.initialize();
      if (available) {
        _isListening = true;
        await _speech.listen(
          onResult: (result) {
            onResult(result.recognizedWords);
          },
        );
      }
    }
    _isListening = !_isListening;
  }
}
