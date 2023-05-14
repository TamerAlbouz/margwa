import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'favorites_record.g.dart';

abstract class FavoritesRecord
    implements Built<FavoritesRecord, FavoritesRecordBuilder> {
  static Serializer<FavoritesRecord> get serializer =>
      _$favoritesRecordSerializer;

  DocumentReference? get user;

  String? get id;

  String? get src;

  String? get title;

  String? get desc;

  @BuiltValueField(wireName: 'num_chapters')
  int? get numChapters;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(FavoritesRecordBuilder builder) => builder
    ..id = ''
    ..src = ''
    ..title = ''
    ..desc = ''
    ..numChapters = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('favorites');

  static Stream<FavoritesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<FavoritesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  FavoritesRecord._();
  factory FavoritesRecord([void Function(FavoritesRecordBuilder) updates]) =
      _$FavoritesRecord;

  static FavoritesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createFavoritesRecordData({
  DocumentReference? user,
  String? id,
  String? src,
  String? title,
  String? desc,
  int? numChapters,
}) {
  final firestoreData = serializers.toFirestore(
    FavoritesRecord.serializer,
    FavoritesRecord(
      (f) => f
        ..user = user
        ..id = id
        ..src = src
        ..title = title
        ..desc = desc
        ..numChapters = numChapters,
    ),
  );

  return firestoreData;
}
