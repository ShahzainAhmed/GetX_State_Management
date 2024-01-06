import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'message': 'What is your name?',
          'name': "Shahzain Ahmed",
        },
        'ur_PK': {
          'message': 'آپ کا نام کیا ہے؟',
          'name': 'شاہ زین احمد',
        }
      };
}