import 'package:cloud_firestore/cloud_firestore.dart';

class TextDocument {
  TextDocument({
    required this.id,
    required this.ownerId,
    required this.inputText,
    this.processedText,
    required this.createdAt,
  });

  factory TextDocument.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data()!;
    return TextDocument(
      id: doc.id,
      ownerId: data['ownerId'] as String,
      inputText: data['inputText'] as String,
      processedText: data['processedText'] as String?,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }
  final String id;
  final String ownerId;
  final String inputText;
  final String? processedText;
  final DateTime createdAt;

  Map<String, dynamic> toMap() => {
        'ownerId': ownerId,
        'inputText': inputText,
        'processedText': processedText,
        'createdAt': Timestamp.fromDate(createdAt),
      };
}
