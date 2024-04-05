import 'package:Doctor/utils/constant.dart';
import 'package:flutter/material.dart';

class ChatMessageWidget extends StatelessWidget {
  final String message;
  final String timestamp;
  final bool isUserMessage;
  final double sW;

  const ChatMessageWidget({
    super.key,
    required this.message,
    required this.timestamp,
    required this.isUserMessage,
    required this.sW,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment:
          isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isUserMessage) ...[
          ClipOval(
            child: Image.asset(
              "${imagepath}doc7.png",
              height: 30,
            ),
          ),
          const SizedBox(width: 10),
        ],
        Column(
          mainAxisAlignment:
              isUserMessage ? MainAxisAlignment.start : MainAxisAlignment.end,
          crossAxisAlignment:
              isUserMessage ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            Text(
              timestamp,
              style: const TextStyle(
                  color: Color.fromRGBO(121, 149, 160, 1),
                  fontSize: 10,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 5),
            Container(
              decoration: BoxDecoration(
                color: isUserMessage
                    ? const Color.fromRGBO(247, 247, 247, 1)
                    : const Color.fromRGBO(129, 187, 255, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(isUserMessage ? 20 : 0),
                  topRight: Radius.circular(isUserMessage ? 0 : 20),
                  bottomLeft: const Radius.circular(20),
                  bottomRight: const Radius.circular(20),
                ),
              ),
              width: sW / 1.5,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  message,
                  style: TextStyle(
                    color: isUserMessage
                        ? const Color.fromRGBO(121, 149, 160, 1)
                        : Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
        if (isUserMessage) ...[
          const SizedBox(width: 10),
          Image.asset(
            "${imagepath}user_icon.png",
            height: 30,
          ),
        ],
      ],
    );
  }
}
