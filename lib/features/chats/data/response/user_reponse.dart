import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/model/user_model.dart';

class UserChatsResponse extends UserChatModel {
  UserChatsResponse(
      {String? userId,
      String? nameAr,
      String? nameEn,
      bool? isRead,
      Timestamp? created,
      Timestamp? modified,
      String? lastMessage,
      String? image,
      String? time})
      : super(
            userId: userId,
            nameAr: nameAr,
            lastMessage: lastMessage,
            created: created,
            image: image,
            modified: modified,
            nameEn: nameEn,
            isRead: isRead,
            time: time);

  /* factory */ UserChatsResponse.fromSnapshot(DocumentSnapshot documentSnapshot) {
    /*  return UserChatsResponse( */
    userId = documentSnapshot.get('userId');
    nameAr = documentSnapshot.get('nameAr');
    nameEn = documentSnapshot.get('nameEn');
    modified = documentSnapshot.get('modified');
    image = documentSnapshot.get('image');
    lastMessage = documentSnapshot.get('lastMessage');
    isRead = documentSnapshot.get('isRead') ?? true;
    created = documentSnapshot.get('created'); /* ); */
/*   } */
  }
  Map<String, dynamic> toDocument() {
    return {
      "userId": userId,
      "nameAr": nameAr,
      "nameEn": nameEn,
      "image": image,
      "created": created,
      "modified": modified,
      "lastMessage": lastMessage,
      "isRead": isRead
    };
  }
}
