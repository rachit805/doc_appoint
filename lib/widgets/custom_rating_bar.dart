// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class CustomRatingBar extends StatefulWidget {
  final int starCount;
  final Function(int) onRatingChanged;

  const CustomRatingBar({
    Key? key,
    required this.starCount,
    required this.onRatingChanged,
  }) : super(key: key);

  @override
  _CustomRatingBarState createState() => _CustomRatingBarState();
}

class _CustomRatingBarState extends State<CustomRatingBar> {
  int rating = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.starCount, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              rating = index + 1;
            });
            widget.onRatingChanged(index + 1);
          },
          onHorizontalDragUpdate: (details) {
            double position = details.localPosition.dx;
            double starWidth =
                MediaQuery.of(context).size.width / widget.starCount;
            int newRating = (position / starWidth).ceil();
            setState(() {
              rating = newRating.clamp(1, widget.starCount);
            });
            widget.onRatingChanged(newRating);
          },
          child: Icon(
            index < rating ? Icons.star : Icons.star_border,
            size: 35,
            color: index < rating ? Colors.amber : Colors.grey,
          ),
        );
      }),
    );
  }
}
