import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseApi {
  static FirebaseAuth get auth => FirebaseAuth.instance;

  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static CollectionReference<Map<String, dynamic>> get userCollection =>
      firestore.collection('users');

  static CollectionReference<Map<String, dynamic>> get chatCollection =>
      firestore.collection('chats');

  static User get currentUser => auth.currentUser!;

  static Future<void> storeUserDataToFirestore(User? user) async {
    final userDoc = firestore.collection('users').doc(user?.uid);
    await userDoc.set({
      'displayName': user?.displayName,
      'email': user?.email,
      'photoUrl': user?.photoURL,
      'phoneNumber': user?.phoneNumber
    });
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> fetchChatMessages(
      String chatRoomId) {
    final chatRoomRef = chatCollection.doc(chatRoomId);
    return chatRoomRef
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> fetchUser() {
    final userRef = userCollection.snapshots();
    return userRef;
  }

  static Future<void> sendChatMessage(String roomId, String message) async {
    chatCollection.doc(roomId).collection('messages').add({
      'senderId': currentUser.uid,
      'message': message,
      'timestamp': DateTime.timestamp(),
    });
  }

  static Future<DocumentSnapshot<Object?>> fetchMyDetail() async {
    DocumentSnapshot snapshot = await userCollection.doc(currentUser.uid).get();
    return snapshot;
  }

  static Future<void> updateUserData(String newName, String number) async {
    final userDoc = userCollection.doc(currentUser.uid);
    await userDoc.update({
      'displayName': newName,
      'phoneNumber': number,
    });
  }
}
