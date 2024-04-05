import 'package:Doctor/utils/constant.dart';
import 'package:Doctor/view/others/review_incoming_call.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CallingwithDoctor extends StatelessWidget {
  const CallingwithDoctor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color.fromRGBO(187, 187, 238, 1),
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildIconButton(
                  imagePath: "${iconpath}ic_call2.png",
                  label: "Accept",
                  color: const Color.fromRGBO(37, 37, 255, 0.42),
                ),
                GestureDetector(
                  onTap: () {
                    Get.off(const ReviewIncomingCall());
                  },
                  child: _buildIconButton(
                    imagePath: "${iconpath}ic_call_reject.png",
                    label: "Decline",
                    color: const Color.fromRGBO(242, 29, 82, 1),
                  ),
                ),
                _buildIconButton(
                  imagePath: "${iconpath}ic_chat1.png",
                  label: "Message",
                  color: const Color.fromRGBO(255, 168, 115, 1),
                ),
              ],
            ),
          ),
          SizedBox(
            child: Image.asset(
              "${imagepath}doc11.png",
              fit: BoxFit.fill,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 1.23,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height / 4,
            ),
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      alignment: Alignment.bottomCenter,
                      child: const CText2(
                        color: Color.fromRGBO(91, 104, 137, 1),
                        text: 'Dr.Jobatar Ray',
                        size: 25,
                        weight: FontWeight.w700,
                      )),
                  Container(
                      alignment: Alignment.bottomCenter,
                      child: const CText2(
                        color: Color.fromRGBO(108, 108, 108, 1),
                        text: '15:20',
                        size: 25,
                        weight: FontWeight.w700,
                      )),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 50),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: const Color.fromRGBO(237, 237, 237, 1),
                      width: 1.5),
                ),
                child: const Center(
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton({
    required String imagePath,
    required String label,
    required Color color,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: color,
          ),
          height: 72,
          width: 78,
          child: Center(
            child: Image.asset(
              imagePath,
              height: 40,
              width: 40,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(
            fontFamily: "Rubik",
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class CText2 extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight weight;

  const CText2({
    super.key,
    required this.text,
    required this.color,
    required this.size,
    required this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      // textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: "Rubik",
        fontWeight: weight,
        fontSize: size,
        color: color,
      ),
    );
  }
}
