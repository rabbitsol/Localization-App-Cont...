import 'package:get/get.dart';

class TranslationNames extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'languageName': 'English',
        },
        'ar_KW': {
          'languageName': 'العربية',
        },
      };
}