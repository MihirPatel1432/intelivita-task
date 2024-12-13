import 'package:core/core.dart';
import 'package:core/global/global_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:home/dashboard_export.dart';
import 'package:home/models/chat_message.dart';

class ChatDetailController extends GetxController with GlobalController {
  final MainRepository repository;
  final chatMessages = <ChatMessage>[].obs;
  TextEditingController messageController = TextEditingController();
  String? roomId;
  String? user2Name;

  ChatDetailController(this.repository);

  @override
  void onInit() {
    super.onInit();
    var myId = FirebaseAuth.instance.currentUser?.uid ?? '';
    if (Get.arguments != null) {
      var user2Id = Get.arguments['id'];
      user2Name = Get.arguments['name'];
      roomId = getChatRoomId(myId, user2Id);
    }
  }

  @override
  void onReady() {
    super.onReady();
    fetchChatMessages(roomId ?? '');
  }

  Future<void> fetchChatMessages(String chatRoomId) async {
    var messageStream = FirebaseApi.fetchChatMessages(chatRoomId);
    messageStream.listen((snapshot) {
      chatMessages.value = snapshot.docs.map((doc) {
        return ChatMessage.fromDocumentSnapshot(doc);
      }).toList();
    });
  }

  String getChatRoomId(String user1Id, String user2Id) {
    final userIds = [user1Id, user2Id];
    userIds.sort();
    return userIds.join('-'); // More efficient sorting
  }

  void sendChat() {
    try {
      if (roomId == null) {
        Utils.displayFlushBar(StringConstants.errSomethingWentWrongTryAgain);
      }
      FirebaseApi.sendChatMessage(roomId ?? '', messageController.text);
    } catch (e) {
      Utils.displayFlushBar(StringConstants.errSomethingWentWrongTryAgain);
    } finally {
      messageController.clear();
    }
  }
}
