import 'package:get/get.dart';

class AppointmentController extends GetxController {
  var selectedShift = 'Morning'.obs;
  var selectedSlot = ''.obs;
  var slots = <String>[].obs;
  var selectedAppointmentType = ''.obs;

  List<String> morningSlots = [
    '10:00 AM',
    '10:30 AM',
    '11:00 AM',
    '11:30 AM',
  ];

  List<String> eveningSlots = [
    '12:00 PM',
    '12:30 PM',
    '01:00 PM',
    '01:30 PM',
  ];
  @override
  void onInit() {
    updateSlots();
    super.onInit();
  }

  void setSelectedShift(String shift) {
    selectedShift.value = shift;
    updateSlots();
  }

  void setSelectedSlot(String slot) {
    selectedSlot.value = slot;
  }

  void updateSlots() {
    slots.clear();
    if (selectedShift.value == 'Morning') {
      slots.addAll(morningSlots);
    } else {
      slots.addAll(eveningSlots);
    }
  }

  void setSelectedAppointmentType(String appointmentType) {
    selectedAppointmentType.value = appointmentType;
  }
}
