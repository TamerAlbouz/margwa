import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FavoritesRecord extends FirestoreRecord {
  FavoritesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "src" field.
  String? _src;
  String get src => _src ?? '';
  bool hasSrc() => _src != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "desc" field.
  String? _desc;
  String get desc => _desc ?? '';
  bool hasDesc() => _desc != null;

  // "num_chapters" field.
  int? _numChapters;
  int get numChapters => _numChapters ?? 0;
  bool hasNumChapters() => _numChapters != null;

  // "notification_sent" field.
  bool? _notificationSent;
  bool get notificationSent => _notificationSent ?? false;
  bool hasNotificationSent() => _notificationSent != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _id = snapshotData['id'] as String?;
    _src = snapshotData['src'] as String?;
    _title = snapshotData['title'] as String?;
    _desc = snapshotData['desc'] as String?;
    _numChapters = snapshotData['num_chapters'] as int?;
    _notificationSent = snapshotData['notification_sent'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('favorites');

  static Stream<FavoritesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FavoritesRecord.fromSnapshot(s));

  static Future<FavoritesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FavoritesRecord.fromSnapshot(s));

  static FavoritesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FavoritesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FavoritesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FavoritesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FavoritesRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createFavoritesRecordData({
  DocumentReference? user,
  String? id,
  String? src,
  String? title,
  String? desc,
  int? numChapters,
  bool? notificationSent,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'id': id,
      'src': src,
      'title': title,
      'desc': desc,
      'num_chapters': numChapters,
      'notification_sent': notificationSent,
    }.withoutNulls,
  );

  return firestoreData;
}
