import 'package:Doctor/utils/constant.dart';
import 'package:Doctor/view/others/update_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomepageAppbar extends StatelessWidget {
  const HomepageAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: Colors.white,
      backgroundColor: Colors.white,
      toolbarHeight: kToolbarHeight + 50,
      automaticallyImplyLeading: false,
      leading: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: InkWell(
            onTap: () {
              Get.to(() => UpdateProfileScreen());
            },
            child: Image.asset(
              "${imagepath}user_icon.png",
              height: 50,
            ),
          )),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20, top: 20),
          child: IconButton(
              onPressed: () {},
              icon: Image.asset(
                "assets/icons/ic_cal.png",
                width: 30,
                height: 50,
              )),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(35),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(249, 249, 255, 1),
              borderRadius: BorderRadius.circular(38),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Container(
                    margin: const EdgeInsets.all(5),
                    child: Image.asset(
                      "assets/icons/ic_search.png",
                      height: 15,
                    ),
                  ),
                  hintText: "Search doctor, categories, topic...",
                  hintStyle: const TextStyle(
                    fontSize: 13,
                    color: Color.fromRGBO(179, 179, 179, 1),
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
