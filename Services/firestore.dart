import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes');

  Future<void> addNote(
      String note, String imageUrl, double price, int quantity) {
    return notes.add({
      'note': note,
      'image_url': imageUrl,
      'price': price,
      'quantity': quantity,
      'timestamp': Timestamp.now(),
    });
  }

  Stream<QuerySnapshot> getNotesStream() {
    final notesStream =
        notes.orderBy('timestamp', descending: true).snapshots();

    return notesStream;
  }

  Future<void> updateNote(String docID, String newNote, String newImageUrl,
      double newPrice, int newQuantity) {
    return notes.doc(docID).update({
      'note': newNote,
      'image_url': newImageUrl,
      'price': newPrice,
      'quantity': newQuantity,
      'timestamp': Timestamp.now(),
    });
  }

  Future<void> deleteNote(String docID) {
    return notes.doc(docID).delete();
  }
}
