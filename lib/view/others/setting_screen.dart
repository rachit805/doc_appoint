import 'package:Doctor/Helpers/local_storage_helper.dart';
import 'package:Doctor/utils/constant.dart';
import 'package:Doctor/view/auth/signup_screen.dart';
import 'package:Doctor/widgets/custom_appbar.dart';
import 'package:Doctor/controller/setting_controller.dart';
import 'package:Doctor/view/others/premiums_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

GetStorage box = GetStorage();

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  final SettingController controller = SettingController();
  final String userEmail = GetStorage().read("email") ?? '';
  @override
  Widget build(BuildContext context) {
    double sW = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CAppBar(
            title: 'Setting',
            backgroundColor: Colors.white,
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Card(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Image.asset(
                        "${imagepath}userImage.png",
                        height: 100,
                        width: 100,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Hello",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          userEmail,
                          style: const TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(137, 117, 117, 1)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "Sunamganj Sudor",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(158, 154, 166, 1)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CListTile(
                sW: sW,
                icon: '${iconpath}ic_member.png',
                text: 'Become a pro member',
                onTap: () {
                  Get.to(() => const PremiumScreen());
                },
              ),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(238, 234, 246, 1)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Image.asset("${iconpath}ic_noti.png"),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: sW / 15,
                  ),
                  const Text(
                    "Notification",
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(158, 154, 166, 1)),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  Obx(() => Text(controller.isOn.value ? 'On' : 'Off')),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.isOn.value = !controller.isOn.value;
                    },
                    child: Container(
                      height: 25,
                      width: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(45, 9, 117, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Obx(() {
                        return Stack(
                          children: [
                            AnimatedPositioned(
                              duration: const Duration(milliseconds: 200),
                              left: controller.isOn.value ? 0 : 25,
                              child: Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              CListTile(
                sW: sW,
                icon: '${iconpath}ic_lang.png',
                text: 'Language',
                onTap: () {},
              ),
              CListTile(
                sW: sW,
                icon: '${iconpath}ic_profile2.png',
                text: 'Invite a friend',
                onTap: () {},
              ),
              CListTile(
                sW: sW,
                icon: '${iconpath}ic_fav.png',
                text: 'Favorite doctors',
                onTap: () {},
              ),
              CListTile(
                sW: sW,
                icon: '${iconpath}ic_faq.png',
                text: 'FAQs',
                onTap: () {},
              ),
              CListTile(
                sW: sW + 50,
                icon: '${iconpath}ic_help.png',
                text: 'Help',
                onTap: () {},
              ),
              CListTile(
                sW: sW + 50,
                icon: '${iconpath}ic_logout.png',
                text: 'Logout',
                onTap: () {
                  // Show alert dialog to confirm logout
                  Get.dialog(
                    AlertDialog(
                      title: const Text('Logout'),
                      content: const Text('Are you sure you want to logout?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            LocalStorageHelper.clearStorage();
                            Get.offAll(SignUpScreen());
                          },
                          child: const Text('Logout'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CListTile extends StatelessWidget {
  const CListTile({
    super.key,
    required this.sW,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  final double sW;
  final String icon;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(238, 234, 246, 1)),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Image.asset(icon),
                  ),
                ),
              ),
              SizedBox(
                width: sW / 15,
              ),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(158, 154, 166, 1)),
                ),
              ),
              // SizedBox(
              //   width: sW / 4,
              // ),
              Image.asset(
                "${iconpath}ic_right_arrow.png",
                height: 30,
                width: 30,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
/////
///
// ///
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:Doctor/helpers/local_storage_helper.dart';
// import 'package:Doctor/view/signup_page.dart';

// class SettingScreen extends StatelessWidget {
//   SettingScreen({super.key});

//   final SettingController controller = SettingController();

//   @override
//   Widget build(BuildContext context) {
//     double sW = MediaQuery.of(context).size.width;

//     return Scaffold(
//       appBar: const PreferredSize(
//         preferredSize: Size.fromHeight(50),
//         child: CAppBar(
//           title: 'Setting',
//           backgroundColor: Colors.white,
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             children: [
//               // Your other widgets
//               CListTile(
//                 sW: sW + 50,
//                 icon: '${iconpath}ic_logout.png',
//                 text: 'Logout',
//                 onTap: () {
//                   // Show alert dialog to confirm logout
//                   Get.dialog(
//                     AlertDialog(
//                       title: Text('Logout'),
//                       content: Text('Are you sure you want to logout?'),
//                       actions: [
//                         TextButton(
//                           onPressed: () {
//                             // Close the dialog
//                             Get.back();
//                           },
//                           child: Text('Cancel'),
//                         ),
//                         TextButton(
//                           onPressed: () {
//                             // Erase the storage data
//                             LocalStorageHelper.clearStorage();
//                             // Navigate to the signup page
//                             Get.offAll(SignupPage());
//                           },
//                           child: Text('Logout'),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
