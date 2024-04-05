import 'package:Doctor/controller/appointment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Doctor/widgets/custom_appbar.dart';
import 'package:Doctor/view/others/fill_patient_details_screen.dart';
import 'package:Doctor/utils/constant.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({
    Key? key,
    required this.day,
    required this.date,
    required this.month,
  }) : super(key: key);

  final String day;
  final String date;
  final String month;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppointmentController());

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CAppBar(
          title: 'Appointment',
          backgroundColor: Colors.white,
        ),
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "$date $month, $day",
                style: const TextStyle(
                  color: Color.fromRGBO(120, 123, 152, 1),
                  fontFamily: "Rubik",
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 20),
              Obx(() => Row(
                    children: [
                      buildShiftBtn(
                          controller, 'Morning', "${iconpath}ic_morning.png"),
                      const SizedBox(width: 20),
                      buildShiftBtn(
                          controller, 'Evening', "${iconpath}ic_evening.png"),
                    ],
                  )),
              const SizedBox(height: 20),
              Obx(() => Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: controller.slots.map((slot) {
                      bool isSelected = controller.selectedSlot.value == slot;
                      return GestureDetector(
                        onTap: () {
                          controller.setSelectedSlot(slot);
                        },
                        child: Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color.fromRGBO(236, 238, 249, 1)
                                : const Color.fromRGBO(250, 250, 250, 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              slot,
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.black
                                    : const Color.fromRGBO(120, 123, 152, 1),
                                fontFamily: "Rubik",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  )),
              const SizedBox(height: 20),
              const Text(
                "Fees information",
                style: TextStyle(
                  color: Color.fromRGBO(120, 123, 152, 1),
                  fontFamily: "Rubik",
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 20),
              AppoitmentTypes(
                icon: "${iconpath}ic_call.png",
                name: 'Voice Call',
                description: 'Can make a voice call with doctor.',
                price: '7',
              ),
              AppoitmentTypes(
                icon: "${iconpath}ic_video.png",
                name: 'Video Call',
                description: 'Can make a voice call with doctor.',
                price: '9',
              ),
              AppoitmentTypes(
                icon: "${iconpath}ic_chat.png",
                name: 'Message',
                description: 'Can make a voice call with doctor.',
                price: '4',
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => const FillPatientDetails());
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromRGBO(236, 238, 249, 1),
                      ),
                      child: const Center(
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            color: Color.fromRGBO(91, 104, 137, 1),
                            fontWeight: FontWeight.w800,
                            fontFamily: "Rubik",
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //// Shift Button Widget

  Widget buildShiftBtn(
      AppointmentController controller, String shift, String icon) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          controller.setSelectedShift(shift);
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: controller.selectedShift.value == shift
                ? const Color.fromRGBO(236, 238, 249, 1)
                : const Color.fromRGBO(250, 250, 250, 1),
          ),
          child: Center(
            child: Row(
              children: [
                const SizedBox(width: 20),
                Image.asset(
                  icon,
                  width: 30,
                  height: 30,
                ),
                const SizedBox(width: 22),
                Text(
                  shift,
                  style: const TextStyle(
                    color: Color.fromRGBO(120, 123, 152, 1),
                    fontFamily: "Rubik",
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppoitmentTypes extends StatelessWidget {
  AppoitmentTypes({
    Key? key,
    required this.icon,
    required this.name,
    required this.description,
    required this.price,
  }) : super(key: key);

  final String icon;
  final String name;
  final String description;
  final String price;
  final AppointmentController controller = Get.put(AppointmentController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 60,
              width: 50,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromRGBO(236, 238, 249, 1),
              ),
              child: Image.asset(icon),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromRGBO(236, 238, 249, 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              color: Color.fromRGBO(91, 104, 137, 1),
                              fontWeight: FontWeight.w800,
                              fontFamily: "Rubik",
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            description,
                            style: const TextStyle(
                              color: Color.fromRGBO(171, 171, 171, 1),
                              fontWeight: FontWeight.w400,
                              fontFamily: "Rubik",
                              fontSize: 10,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      const Expanded(child: SizedBox()),
                      const Padding(
                        padding: EdgeInsets.only(
                            top: 8, bottom: 8, left: 10, right: 5),
                        child: SizedBox(
                          child: VerticalDivider(),
                        ),
                      ),
                      Text(
                        "\$$price",
                        style: const TextStyle(
                          color: Color.fromRGBO(120, 123, 152, 1),
                          fontFamily: "Rubik",
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
