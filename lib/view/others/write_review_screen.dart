import 'package:Doctor/utils/constant.dart';
import 'package:Doctor/widgets/custom_appbar.dart';
import 'package:Doctor/controller/write_review_controller.dart';
import 'package:Doctor/widgets/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WriteReview extends StatelessWidget {
  WriteReview({
    super.key,
  });

  final WriteReviewController controller = Get.put(WriteReviewController());

  // final CustomRatingBarController ratingcontroller =
  //     Get.put(CustomRatingBarController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: CAppBar(
              title: 'Write a review',
              backgroundColor: Colors.white,
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: ClipRRect(
                      child: Image.asset(
                        "${imagepath}doc7.png",
                        width: 150,
                        height: 150,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Rubik",
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                      children: [
                        TextSpan(
                          text: "How was your experience \nwith ",
                        ),
                        TextSpan(
                          text: "Dr.jobatar Ray ?",
                          style: TextStyle(
                            color: Color.fromARGB(255, 160, 42, 34),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: CustomRatingBar(
                    starCount: 5,
                    onRatingChanged: (rating) {},
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Write a comment",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(91, 104, 137, 1),
                          fontWeight: FontWeight.w800,
                          fontFamily: "Rubik"),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Max 234 words",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(91, 104, 137, 1),
                          fontWeight: FontWeight.w800,
                          fontFamily: "Rubik"),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color.fromRGBO(
                        224,
                        215,
                        215,
                        0.63,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: const InputDecoration(
                        hintText:
                            "A good experience with Dr. Jobatar ray. \nHe always this to understant my speech carefully. I appreciate his process.",
                        hintStyle: TextStyle(
                          color: Color.fromRGBO(120, 123, 152, 1),
                          fontFamily: "Rubik",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
                        color: Color.fromRGBO(120, 123, 152, 1),
                        fontFamily: "Rubik",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Would you recommend Dr. Jobatar to you freiends?",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(91, 104, 137, 1),
                      fontWeight: FontWeight.w600,
                      fontFamily: "Rubik"),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: controller.selectMale,
                      child: Obx(
                        () => Container(
                          alignment: Alignment.topLeft,
                          height: 38,
                          width: 100,
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 18,
                                backgroundColor: controller.isYesSelected.value
                                    ? const Color.fromRGBO(187, 206, 2551, 1)
                                    : const Color.fromRGBO(236, 238, 249, 1),
                                child: Icon(
                                  Icons.check,
                                  color: controller.isYesSelected.value
                                      ? Colors.white
                                      : Colors.transparent,
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Center(
                                child: Text(
                                  "Yes",
                                  style: TextStyle(
                                      fontFamily: "Rubik",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    GestureDetector(
                      onTap: controller.selectFemale,
                      child: Obx(
                        () => Container(
                          alignment: Alignment.topLeft,
                          height: 38,
                          width: 100,
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 18,
                                backgroundColor: controller.isNoSelected.value
                                    ? const Color.fromRGBO(187, 206, 2551, 1)
                                    : const Color.fromRGBO(236, 238, 249, 1),
                                child: Icon(
                                  Icons.check,
                                  color: controller.isNoSelected.value
                                      ? Colors.white
                                      : Colors.transparent,
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Center(
                                child: Text(
                                  "No",
                                  style: TextStyle(
                                      fontFamily: "Rubik",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.09,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Get.snackbar(
                                "Success",
                                "Review submitted successfully!",
                                duration: const Duration(seconds: 2),
                              );
                              Future.delayed(const Duration(seconds: 1), () {
                                Navigator.pop(context);
                              });
                            },
                            child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: const Color.fromRGBO(236, 238, 249, 1),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Submit review",
                                    style: TextStyle(
                                        color: Color.fromRGBO(91, 104, 137, 1),
                                        fontWeight: FontWeight.w800,
                                        fontFamily: "Rubik"),
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
