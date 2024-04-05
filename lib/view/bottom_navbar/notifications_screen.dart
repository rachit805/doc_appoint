import 'package:Doctor/utils/colors.dart';
import 'package:Doctor/data/notification_data.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Notifications",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: AppColors.appbartextcolor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _buildNotificationItems(),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildNotificationItems() {
    List<Widget> items = [];

    for (var notification in notifications) {
      items.add(_buildNotificationItem(
        notification["title"]!,
        notification["message"]!,
        notification["iconPath"]!,
        notification["date"]!,
      ));
    }

    return items;
  }

  Widget _buildNotificationItem(
    String title,
    String message,
    String iconPath,
    String date,
  ) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              date,
              style: const TextStyle(
                color: Color.fromRGBO(168, 167, 167, 1),
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontFamily: "Rubik",
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: AppColors.boxcolor,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    iconPath,
                    height: 20,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: AppColors.titlecolor,
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          fontFamily: "Rubik",
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        message,
                        maxLines: 4,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColors.titlecolor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Rubik",
                        ),
                      ),
                      const Divider(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.boxcolor,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    iconPath,
                    height: 20,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: AppColors.titlecolor,
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          fontFamily: "Rubik",
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        message,
                        maxLines: 4,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColors.titlecolor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Rubik",
                        ),
                      ),
                      const Divider(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
