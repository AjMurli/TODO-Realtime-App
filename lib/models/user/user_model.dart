import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../utils/formatters/formatter.dart';
class UserModel {
  final String? id;
  String userName;
  String email;
  String profilePicture;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserModel({
    this.id,
    required this.email,
    this.userName = "",
    this.profilePicture = "",
    this.createdAt,
    this.updatedAt,
  });

  // Helper Methods
  String get formattedDate => Formatter.formatDate(createdAt);
  String get formattedUpdatedAtDate => Formatter.formatDate(updatedAt);

  // static function to create empty user model
  static UserModel empty() => UserModel(email: '');

  // Factory method to create a UserModel from a Firebase document snapshot
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if(document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        userName: data.containsKey('UserName') ? data['UserName'] ?? '' : '',
        email: data.containsKey('Email') ? data['Email'] ?? '' : '',
        profilePicture: data.containsKey('ProfilePicture') ? data['ProfilePicture'] ?? '' : '',
        createdAt: data.containsKey('CreatedAt') && data['CreatedAt'] != null
            ? (data['CreatedAt'] as Timestamp).toDate()
            : DateTime.now(),
        updatedAt: data.containsKey('UpdatedAt') && data['UpdatedAt'] != null
            ? (data['UpdatedAt'] as Timestamp).toDate()
            : DateTime.now(),
      );
    }else{
      return empty();
    }
  }

  // Convert model to json structure for storing data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'UserName': userName,
      'Email': email,
      'ProfilePicture': profilePicture,
      'CreatedAt': createdAt,
      'UpdatedAt': updatedAt = DateTime.now(),
    };
  }
}
