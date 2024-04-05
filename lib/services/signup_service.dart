// import 'package:Doctor/Helpers/helper.dart';
// import 'package:Doctor/services/api_constants.dart';

// class SignupService {
//   static Future<void> signUp(String username, String password) async {
//     final requestBody = {
//       'username': username,
//       'password': password,
//     };

//     try {
//       final response = await Helper.post(ApiConstants.signupendpoint, requestBody);
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         print('Signup successful');
//       } else if (response.statusCode == 400) {
//         print('User is already registered');
//       } else {
//         print('Signup failed with status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Exception during signup: $e');
//     }
//   }
// }
