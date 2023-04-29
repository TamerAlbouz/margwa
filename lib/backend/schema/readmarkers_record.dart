import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'readmarkers_record.g.dart';

abstract class ReadmarkersRecord
    implements Built<ReadmarkersRecord, ReadmarkersRecordBuilder> {
  static Serializer<ReadmarkersRecord> get serializer =>
      _$readmarkersRecordSerializer;

  DocumentReference? get user;

  @BuiltValueField(wireName: 'manga_id')
  String? get mangaId;

  @BuiltValueField(wireName: 'chapter_id')
  String? get chapterId;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ReadmarkersRecordBuilder builder) => builder
    ..mangaId = ''
    ..chapterId = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('readmarkers');

  static Stream<ReadmarkersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ReadmarkersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ReadmarkersRecord._();
  factory ReadmarkersRecord([void Function(ReadmarkersRecordBuilder) updates]) =
      _$ReadmarkersRecord;

  static ReadmarkersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createReadmarkersRecordData({
  DocumentReference? user,
  String? mangaId,
  String? chapterId,
}) {
  final firestoreData = serializers.toFirestore(
    ReadmarkersRecord.serializer,
    ReadmarkersRecord(
      (r) => r
        ..user = user
        ..mangaId = mangaId
        ..chapterId = chapterId,
    ),
  );

  return firestoreData;
}
