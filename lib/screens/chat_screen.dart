import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  static const routeName = '/chat-screen';

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Chat screen',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
