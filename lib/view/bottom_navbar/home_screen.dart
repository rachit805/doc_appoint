import 'package:Doctor/view/others/all_doctors.dart';
import 'package:Doctor/widgets/homepage_widgets/homepage_appbar.dart';
import 'package:Doctor/widgets/homepage_widgets/categorieslist_widget.dart';
import 'package:Doctor/widgets/homepage_widgets/issuescard_widget.dart';
import 'package:Doctor/widgets/homepage_widgets/topdoctorslist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  Future<void> _refreshData() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight + 50),
          child: HomepageAppbar(),
        ),
        body: RefreshIndicator(
          onRefresh: _refreshData,
          child: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      child: SectionHeading(
                        text: 'Specialist',
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: CategorieslistWidget(),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: IssuesCardWidget(),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SectionHeading(
                        text: 'Top doctors',
                      ),
                      ViewAllBtn(
                        onTap: () {
                          Get.to(const AllDoctors());
                        },
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TopDoctorsList(),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 24,
          color: Color.fromRGBO(103, 100, 137, 1)),
    );
  }
}

class ViewAllBtn extends StatelessWidget {
  const ViewAllBtn({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const Text(
        "View All",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color.fromRGBO(171, 172, 187, 1),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
