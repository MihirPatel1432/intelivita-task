import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';
import 'package:core/global/global_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:home/dashboard_export.dart';

class ChatListController extends GetxController with GlobalController {
  final MainRepository repository;
  final scrollController = ScrollController();

  ChatListController(this.repository);

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchUser() {
    return FirebaseApi.fetchUser();
  }

  void navigateToChatDetail(String id, String name) {
    Get.toNamed(AllRoutes.chatDetail, arguments: {'id': id, 'name': name});
  }
}
