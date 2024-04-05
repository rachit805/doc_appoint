import 'package:get_storage/get_storage.dart';

class LocalStorageHelper {
  static final box = GetStorage();
  static void clearStorage() {
    box.erase();
  }

  static Future<void> saveEmail(String email) async {
    await box.write('email', email);
  }

  static String? getEmail() {
    return box.read<String>('email');
  }

  static Future<void> saveLoginStatus(bool isLoggedIn) async {
    await box.write('isLoggedIn', isLoggedIn);
  }

  static bool isLoggedIn() {
    return box.read<bool>('isLoggedIn') ?? false;
  }
}
