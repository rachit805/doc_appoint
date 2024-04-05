import 'package:get/get.dart';

class WriteReviewController extends GetxController {
  var rating = 0.obs;
  var isYesSelected = false.obs;
  var isNoSelected = false.obs;

  void updateRating(int value) {
    rating.value = value;
  }

  void selectMale() {
    isYesSelected.value = true;
    isNoSelected.value = false;
  }

  void selectFemale() {
    isYesSelected.value = false;
    isNoSelected.value = true;
  }
}
