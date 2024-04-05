
// class CustomRatingBar extends StatelessWidget {
//   const CustomRatingBar({
//     Key? key,
//     required this.rating,
//     required this.starCount,
//     this.size = 35.0,
//     this.color = Colors.amber,
//     required this.onRatingChanged,
//   }) : super(key: key);

//   final int rating;
//   final int starCount;
//   final double size;
//   final Color color;
//   final ValueChanged<int> onRatingChanged;

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(CustomRatingBarController());

//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: List.generate(starCount, (index) {
//         return GestureDetector(
//           onTap: () {
//             controller.updateRating(index + 1);
//             onRatingChanged(index + 1);
//           },
//           child: Obx(() => Icon(
//                 Icons.star,
//                 size: size,
//                 color: index < controller.currentRating.value
//                     ? color
//                     : Colors.grey,
//               )),
//         );
//       }),
//     );
//   }
// }