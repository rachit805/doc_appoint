import 'package:Doctor/utils/constant.dart';
import 'package:Doctor/view/others/calling_with_doctor.dart';
import 'package:Doctor/widgets/dailog_box.dart';
import 'package:flutter/material.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({
    super.key,
  });

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const SuccessDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double sH = MediaQuery.of(context).size.height;
    double sW = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              // width: 300,
              child: PageView.builder(
                controller: PageController(initialPage: 1),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: sH * 0.3),
                        child: Center(
                          child: Container(
                            alignment: Alignment.center,
                            width: sW / 1.4,
                            height: sH / 1.4,
                            child: const Card(
                              color: Color.fromRGBO(227, 237, 255, 1),
                              child: Padding(
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  children: [
                                    CText2(
                                      text: '5 Months plan',
                                      color: Color.fromRGBO(104, 104, 104, 1),
                                      size: 22,
                                      weight: FontWeight.w800,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    PremiumPoints(
                                      text: 'Covers 2 adult',
                                    ),
                                    PremiumPoints(
                                      text:
                                          'Connect with a doktor under 1 minutes',
                                    ),
                                    PremiumPoints(
                                      text:
                                          'Doctor available to chat voice & video call',
                                    ),
                                    PremiumPoints(
                                      text: 'Unlimited consultant',
                                    ),
                                    PremiumPoints(
                                      text:
                                          'Doctor available to chat voice & video call',
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        CText2(
                                          text: '\$388',
                                          color:
                                              Color.fromRGBO(104, 104, 104, 1),
                                          size: 22,
                                          weight: FontWeight.w800,
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        CText2(
                                          text: "User/month",
                                          color:
                                              Color.fromRGBO(148, 168, 172, 1),
                                          size: 15,
                                          weight: FontWeight.w500,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: sH / 1.75,
                          left: sW * 0.3,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            showSuccessDialog(context);
                          },
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            height: 60,
                            width: 150,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(218, 232, 235, 1),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Center(
                              child: CText2(
                                text: "Get Started",
                                color: Color.fromRGBO(125, 125, 125, 1),
                                size: 18,
                                weight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: sH / 1.5, left: 20, right: 20),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CText2(
                  text: 'My talt about you',
                  color: Color.fromRGBO(104, 104, 104, 1),
                  size: 20,
                  weight: FontWeight.w600,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(top: sH / 1.4, right: 20),
            child: ListView.builder(
                itemCount: 3,
                itemBuilder: (_, context) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Image.asset(
                        "${iconpath}ic_user.png",
                      ),
                      title: const CText2(
                        text:
                            'Used  it for 1 month only. then it is desplayed and the way information is very good.',
                        color: Color.fromRGBO(148, 163, 172, 1),
                        size: 13,
                        weight: FontWeight.w500,
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class PremiumPoints extends StatelessWidget {
  const PremiumPoints({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "${iconpath}ic_point.png",
              height: 25,
              width: 25,
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: CText2(
                text: text,
                color: const Color.fromRGBO(148, 168, 172, 1),
                size: 15,
                weight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 25,
        )
      ],
    );
  }
}
