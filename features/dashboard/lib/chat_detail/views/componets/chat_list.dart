import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:home/chat_detail/controllers/chat_detail_controller.dart';
import 'package:home/models/chat_message.dart';

class ChatList extends StatelessWidget {
  final List<ChatMessage> chatMessages;
  final String myUserId;
  final VoidCallback onSendMessage;
  final TextEditingController messageController;
  final ChatDetailController controller;

  const ChatList({
    super.key,
    required this.chatMessages,
    required this.myUserId,
    required this.onSendMessage,
    required this.messageController,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: chatMessages.length,
            itemBuilder: (context, index) {
              final message = chatMessages[index];
              final isMyMessage = message.senderId == myUserId;

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: isMyMessage
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.all(30.w),
                              decoration: BoxDecoration(
                                color: isMyMessage
                                    ? Colors.blue
                                    : Colors.grey[400],
                                borderRadius: BorderRadius.circular(25.r),
                              ),
                              child: Text(message.message,
                              style: context.textTheme.labelLarge?.copyWith(
                                color: context.theme.colorScheme.surface
                              )),
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            Utils.formatDateTime(message.timestamp),
                            style: context.textTheme.bodySmall?.copyWith(
                              color: context.theme.colorScheme.primaryContainer,
                              fontSize: 30.sp
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
          decoration: BoxDecoration(
            color: Colors.blue[200],
            border: Border(
              top: BorderSide(color: Colors.blue[300]!),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: messageController,
                  decoration: InputDecoration(
                      hintText: StringConstants.typeYourMessage,
                      border: InputBorder.none,
                      hintStyle: context.textTheme.bodySmall?.copyWith(
                          color: context.theme.colorScheme.primaryContainer)),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send, color: context.theme.primaryColor),
                onPressed: () => onSendMessage(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
