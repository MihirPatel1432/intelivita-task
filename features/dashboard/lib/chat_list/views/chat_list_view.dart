import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:home/chat_list/controllers/chat_list_controller.dart';

class ChatListView extends GetView<ChatListController> {
  const ChatListView({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseApi.fetchUser(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.separated(
            scrollDirection: Axis.vertical,
            controller: controller.scrollController,
            separatorBuilder: (_, __) => SizedBox(height: 20.h),
            itemCount: snapshot.data?.docs.length ?? 0,
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
            itemBuilder: (context, index) {
              var data = snapshot.data!.docs[index];
              if (data.id == FirebaseAuth.instance.currentUser?.uid) {
                return Offstage();
              }
              return GestureDetector(
                onTap: () {
                  controller.navigateToChatDetail(data.id, data['displayName']);
                },
                child: ListTile(
                  tileColor: Colors.blue[50],
                  title: Text(
                    data['displayName'],
                    style: context.textTheme.labelLarge?.copyWith(
                      fontSize: 30.sp,
                      color: context.theme.colorScheme.primaryContainer,
                    ),
                  ),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(50.w),
                    child: CachedNetworkImage(
                      imageUrl: data['photoUrl'],
                      height: 100.w,
                      width: 100.w,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                                  value: downloadProgress.progress),
                      errorWidget: (context, url, error) => Icon(
                          Icons.account_circle_rounded,
                          color: context.theme.colorScheme.primaryContainer),
                    ),
                  ),
                ),
              );
            });
      },
    );
  }
}
