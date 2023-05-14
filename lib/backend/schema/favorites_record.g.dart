// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FavoritesRecord> _$favoritesRecordSerializer =
    new _$FavoritesRecordSerializer();

class _$FavoritesRecordSerializer
    implements StructuredSerializer<FavoritesRecord> {
  @override
  final Iterable<Type> types = const [FavoritesRecord, _$FavoritesRecord];
  @override
  final String wireName = 'FavoritesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, FavoritesRecord object,
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
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.src;
    if (value != null) {
      result
        ..add('src')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.desc;
    if (value != null) {
      result
        ..add('desc')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.numChapters;
    if (value != null) {
      result
        ..add('num_chapters')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  FavoritesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FavoritesRecordBuilder();

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
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'src':
          result.src = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'desc':
          result.desc = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'num_chapters':
          result.numChapters = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$FavoritesRecord extends FavoritesRecord {
  @override
  final DocumentReference<Object?>? user;
  @override
  final String? id;
  @override
  final String? src;
  @override
  final String? title;
  @override
  final String? desc;
  @override
  final int? numChapters;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$FavoritesRecord([void Function(FavoritesRecordBuilder)? updates]) =>
      (new FavoritesRecordBuilder()..update(updates))._build();

  _$FavoritesRecord._(
      {this.user,
      this.id,
      this.src,
      this.title,
      this.desc,
      this.numChapters,
      this.ffRef})
      : super._();

  @override
  FavoritesRecord rebuild(void Function(FavoritesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FavoritesRecordBuilder toBuilder() =>
      new FavoritesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FavoritesRecord &&
        user == other.user &&
        id == other.id &&
        src == other.src &&
        title == other.title &&
        desc == other.desc &&
        numChapters == other.numChapters &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, src.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, desc.hashCode);
    _$hash = $jc(_$hash, numChapters.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FavoritesRecord')
          ..add('user', user)
          ..add('id', id)
          ..add('src', src)
          ..add('title', title)
          ..add('desc', desc)
          ..add('numChapters', numChapters)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class FavoritesRecordBuilder
    implements Builder<FavoritesRecord, FavoritesRecordBuilder> {
  _$FavoritesRecord? _$v;

  DocumentReference<Object?>? _user;
  DocumentReference<Object?>? get user => _$this._user;
  set user(DocumentReference<Object?>? user) => _$this._user = user;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _src;
  String? get src => _$this._src;
  set src(String? src) => _$this._src = src;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _desc;
  String? get desc => _$this._desc;
  set desc(String? desc) => _$this._desc = desc;

  int? _numChapters;
  int? get numChapters => _$this._numChapters;
  set numChapters(int? numChapters) => _$this._numChapters = numChapters;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  FavoritesRecordBuilder() {
    FavoritesRecord._initializeBuilder(this);
  }

  FavoritesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user = $v.user;
      _id = $v.id;
      _src = $v.src;
      _title = $v.title;
      _desc = $v.desc;
      _numChapters = $v.numChapters;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FavoritesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FavoritesRecord;
  }

  @override
  void update(void Function(FavoritesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FavoritesRecord build() => _build();

  _$FavoritesRecord _build() {
    final _$result = _$v ??
        new _$FavoritesRecord._(
            user: user,
            id: id,
            src: src,
            title: title,
            desc: desc,
            numChapters: numChapters,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
