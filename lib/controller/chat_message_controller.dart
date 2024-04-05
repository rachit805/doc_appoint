import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatMessage {
  final String message;
  final DateTime timestamp;
  final bool isUserMessage;

  ChatMessage({
    required this.message,
    required this.timestamp,
    required this.isUserMessage,
  });
}

class ChatController extends GetxController {
  /// Dummy Data
  final List<ChatMessage> _messages = <ChatMessage>[
    ChatMessage(
      message: "Hello! How can I help you?",
      timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
      isUserMessage: false,
    ),
    ChatMessage(
      message: "Hi there! I'm looking for some medical advice.",
      timestamp: DateTime.now().subtract(const Duration(minutes: 4)),
      isUserMessage: true,
    ),
    ChatMessage(
      message: "Sure, I'd be happy to assist you.",
      timestamp: DateTime.now().subtract(const Duration(minutes: 3)),
      isUserMessage: false,
    ),
    ChatMessage(
      message: "Hi Doctor!",
      timestamp: DateTime.now().subtract(const Duration(minutes: 2)),
      isUserMessage: true,
    ),
  ].obs;
  final TextEditingController messageController = TextEditingController();

  List<ChatMessage> get messages => _messages;

  void sendMessage() {
    final messageText = messageController.text.trim();
    if (messageText.isNotEmpty) {
      final newMessage = ChatMessage(
        message: messageText,
        timestamp: DateTime.now(),
        isUserMessage: true,
      );
      _messages.insert(0, newMessage);
      messageController.clear();
    }
  }
}
