import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:text_tune/domain/text_document.dart';
import 'package:text_tune/presenter/auth/auth_provider.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider({required this.firestore, required this.authProvider});

  final FirebaseFirestore firestore;
  final AuthProvider authProvider;

  Stream<List<TextDocument>> get userDocuments {
    final uid = authProvider.user?.id;
    if (uid == null) return const Stream.empty();

    return firestore
        .collection('documents')
        .where('ownerId', isEqualTo: uid)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => TextDocument.fromFirestore(doc))
              .toList(),
        );
  }

  Future<void> addDocument(String inputText) async {
    final uid = authProvider.user?.id;
    if (uid == null) return;

    final newDoc = TextDocument(
      id: '',
      ownerId: uid,
      inputText: inputText,
      createdAt: DateTime.now(),
    );

    await firestore.collection('documents').add(newDoc.toMap());
  }
}
