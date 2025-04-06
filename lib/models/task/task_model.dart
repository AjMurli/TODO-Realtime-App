import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../utils/formatters/formatter.dart';

class TaskModel {

  String id;
  String? ownerId;
  String title;
  String description;
  DateTime? createdAt;
  DateTime? updatedAt;
  final List<String> sharedWithEmails;

  TaskModel({
    required this.id,
    required this.title,
    required this.ownerId,
    required this.description,
    this.createdAt,
    this.updatedAt,
    required this.sharedWithEmails,
  });

  String get formattedDate => Formatter.formatDate(createdAt);
  String get formattedUpdatedADate => Formatter.formatDate(updatedAt);

  // Empty Helper Function
  static TaskModel empty() => TaskModel(id: '', title: '', description: '', ownerId: '', sharedWithEmails: []);

  // Convert model to json structure so that you can store data in Firebase
  toJson() {
    return {
      'Title': title,
      'Description': description,
      'OwnerId': ownerId,
      'CreatedAt': createdAt,
      'SharedWithEmails': sharedWithEmails,
      'UpdatedAt': DateTime.now(),
    };
  }

  // Map Json oriented document snapshot from Firebase to UserModel
  factory TaskModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if(document.data() != null) {
      final data = document.data()!;

      return TaskModel(
        id: document.id,
        title: data['Title'] ?? '',
        description: data['Description'] ?? '',
        ownerId: data['OwnerId'] ?? '',
        createdAt: data.containsKey('CreatedAt') ? data['CreatedAt']?.toDate() : null,
        updatedAt: data.containsKey('UpdatedAt') ? data['UpdatedAt']?.toDate() : null,
        sharedWithEmails: List<String>.from(data['SharedWithEmails'] ?? []),
      );
    }else{
      return TaskModel.empty();
    }
  }


}