// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapters_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ChaptersRecord> _$chaptersRecordSerializer =
    new _$ChaptersRecordSerializer();

class _$ChaptersRecordSerializer
    implements StructuredSerializer<ChaptersRecord> {
  @override
  final Iterable<Type> types = const [ChaptersRecord, _$ChaptersRecord];
  @override
  final String wireName = 'ChaptersRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ChaptersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.chapterId;
    if (value != null) {
      result
        ..add('chapter_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.mangaId;
    if (value != null) {
      result
        ..add('manga_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  ChaptersRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChaptersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'chapter_id':
          result.chapterId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'manga_id':
          result.mangaId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$ChaptersRecord extends ChaptersRecord {
  @override
  final String? chapterId;
  @override
  final DocumentReference<Object?>? user;
  @override
  final String? mangaId;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ChaptersRecord([void Function(ChaptersRecordBuilder)? updates]) =>
      (new ChaptersRecordBuilder()..update(updates))._build();

  _$ChaptersRecord._({this.chapterId, this.user, this.mangaId, this.ffRef})
      : super._();

  @override
  ChaptersRecord rebuild(void Function(ChaptersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChaptersRecordBuilder toBuilder() =>
      new ChaptersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChaptersRecord &&
        chapterId == other.chapterId &&
        user == other.user &&
        mangaId == other.mangaId &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, chapterId.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, mangaId.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChaptersRecord')
          ..add('chapterId', chapterId)
          ..add('user', user)
          ..add('mangaId', mangaId)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ChaptersRecordBuilder
    implements Builder<ChaptersRecord, ChaptersRecordBuilder> {
  _$ChaptersRecord? _$v;

  String? _chapterId;
  String? get chapterId => _$this._chapterId;
  set chapterId(String? chapterId) => _$this._chapterId = chapterId;

  DocumentReference<Object?>? _user;
  DocumentReference<Object?>? get user => _$this._user;
  set user(DocumentReference<Object?>? user) => _$this._user = user;

  String? _mangaId;
  String? get mangaId => _$this._mangaId;
  set mangaId(String? mangaId) => _$this._mangaId = mangaId;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ChaptersRecordBuilder() {
    ChaptersRecord._initializeBuilder(this);
  }

  ChaptersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _chapterId = $v.chapterId;
      _user = $v.user;
      _mangaId = $v.mangaId;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChaptersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChaptersRecord;
  }

  @override
  void update(void Function(ChaptersRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChaptersRecord build() => _build();

  _$ChaptersRecord _build() {
    final _$result = _$v ??
        new _$ChaptersRecord._(
            chapterId: chapterId, user: user, mangaId: mangaId, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
