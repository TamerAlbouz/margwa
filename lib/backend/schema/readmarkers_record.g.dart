// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'readmarkers_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ReadmarkersRecord> _$readmarkersRecordSerializer =
    new _$ReadmarkersRecordSerializer();

class _$ReadmarkersRecordSerializer
    implements StructuredSerializer<ReadmarkersRecord> {
  @override
  final Iterable<Type> types = const [ReadmarkersRecord, _$ReadmarkersRecord];
  @override
  final String wireName = 'ReadmarkersRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ReadmarkersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
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
    value = object.chapterId;
    if (value != null) {
      result
        ..add('chapter_id')
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
  ReadmarkersRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ReadmarkersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
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
        case 'chapter_id':
          result.chapterId = serializers.deserialize(value,
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

class _$ReadmarkersRecord extends ReadmarkersRecord {
  @override
  final DocumentReference<Object?>? user;
  @override
  final String? mangaId;
  @override
  final String? chapterId;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ReadmarkersRecord(
          [void Function(ReadmarkersRecordBuilder)? updates]) =>
      (new ReadmarkersRecordBuilder()..update(updates))._build();

  _$ReadmarkersRecord._({this.user, this.mangaId, this.chapterId, this.ffRef})
      : super._();

  @override
  ReadmarkersRecord rebuild(void Function(ReadmarkersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReadmarkersRecordBuilder toBuilder() =>
      new ReadmarkersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReadmarkersRecord &&
        user == other.user &&
        mangaId == other.mangaId &&
        chapterId == other.chapterId &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, mangaId.hashCode);
    _$hash = $jc(_$hash, chapterId.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReadmarkersRecord')
          ..add('user', user)
          ..add('mangaId', mangaId)
          ..add('chapterId', chapterId)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ReadmarkersRecordBuilder
    implements Builder<ReadmarkersRecord, ReadmarkersRecordBuilder> {
  _$ReadmarkersRecord? _$v;

  DocumentReference<Object?>? _user;
  DocumentReference<Object?>? get user => _$this._user;
  set user(DocumentReference<Object?>? user) => _$this._user = user;

  String? _mangaId;
  String? get mangaId => _$this._mangaId;
  set mangaId(String? mangaId) => _$this._mangaId = mangaId;

  String? _chapterId;
  String? get chapterId => _$this._chapterId;
  set chapterId(String? chapterId) => _$this._chapterId = chapterId;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ReadmarkersRecordBuilder() {
    ReadmarkersRecord._initializeBuilder(this);
  }

  ReadmarkersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user = $v.user;
      _mangaId = $v.mangaId;
      _chapterId = $v.chapterId;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReadmarkersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReadmarkersRecord;
  }

  @override
  void update(void Function(ReadmarkersRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReadmarkersRecord build() => _build();

  _$ReadmarkersRecord _build() {
    final _$result = _$v ??
        new _$ReadmarkersRecord._(
            user: user, mangaId: mangaId, chapterId: chapterId, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
