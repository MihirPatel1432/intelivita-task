import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:home/chat_detail/controllers/chat_detail_controller.dart';
import 'package:home/chat_detail/views/componets/chat_list.dart';

class ChatDetailView extends GetView<ChatDetailController> {
  const ChatDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: context.theme.primaryColor,
          automaticallyImplyLeading: true,
          leadingWidth: 80.w,
          title: Text(controller.user2Name ?? ''),
        ),
        body: SafeArea(
          child: Obx(
            () => ChatList(
              chatMessages: controller.chatMessages.toList(),
              myUserId: FirebaseAuth.instance.currentUser?.uid ?? '',
              onSendMessage: () {
                controller.sendChat();
              },
              messageController: controller.messageController,
              controller: controller,
            ),
          ),
        ),
      ),
    );
  }
}
