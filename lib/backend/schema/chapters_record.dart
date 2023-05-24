import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChaptersRecord extends FirestoreRecord {
  ChaptersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "chapter_id" field.
  String? _chapterId;
  String get chapterId => _chapterId ?? '';
  bool hasChapterId() => _chapterId != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "manga_id" field.
  String? _mangaId;
  String get mangaId => _mangaId ?? '';
  bool hasMangaId() => _mangaId != null;

  void _initializeFields() {
    _chapterId = snapshotData['chapter_id'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
    _mangaId = snapshotData['manga_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chapters');

  static Stream<ChaptersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChaptersRecord.fromSnapshot(s));

  static Future<ChaptersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChaptersRecord.fromSnapshot(s));

  static ChaptersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChaptersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChaptersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChaptersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChaptersRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createChaptersRecordData({
  String? chapterId,
  DocumentReference? user,
  String? mangaId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'chapter_id': chapterId,
      'user': user,
      'manga_id': mangaId,
    }.withoutNulls,
  );

  return firestoreData;
}
