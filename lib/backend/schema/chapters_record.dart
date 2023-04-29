import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'chapters_record.g.dart';

abstract class ChaptersRecord
    implements Built<ChaptersRecord, ChaptersRecordBuilder> {
  static Serializer<ChaptersRecord> get serializer =>
      _$chaptersRecordSerializer;

  @BuiltValueField(wireName: 'chapter_id')
  String? get chapterId;

  DocumentReference? get user;

  @BuiltValueField(wireName: 'manga_id')
  String? get mangaId;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ChaptersRecordBuilder builder) => builder
    ..chapterId = ''
    ..mangaId = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chapters');

  static Stream<ChaptersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ChaptersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ChaptersRecord._();
  factory ChaptersRecord([void Function(ChaptersRecordBuilder) updates]) =
      _$ChaptersRecord;

  static ChaptersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createChaptersRecordData({
  String? chapterId,
  DocumentReference? user,
  String? mangaId,
}) {
  final firestoreData = serializers.toFirestore(
    ChaptersRecord.serializer,
    ChaptersRecord(
      (c) => c
        ..chapterId = chapterId
        ..user = user
        ..mangaId = mangaId,
    ),
  );

  return firestoreData;
}
