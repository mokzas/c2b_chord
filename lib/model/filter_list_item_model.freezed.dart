// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_list_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FilterListItemModel {
  String get name;
  String get group;
  bool get isSelected;

  /// Create a copy of FilterListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FilterListItemModelCopyWith<FilterListItemModel> get copyWith =>
      _$FilterListItemModelCopyWithImpl<FilterListItemModel>(
          this as FilterListItemModel, _$identity);

  /// Serializes this FilterListItemModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FilterListItemModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, group, isSelected);

  @override
  String toString() {
    return 'FilterListItemModel(name: $name, group: $group, isSelected: $isSelected)';
  }
}

/// @nodoc
abstract mixin class $FilterListItemModelCopyWith<$Res> {
  factory $FilterListItemModelCopyWith(
          FilterListItemModel value, $Res Function(FilterListItemModel) _then) =
      _$FilterListItemModelCopyWithImpl;
  @useResult
  $Res call({String name, String group, bool isSelected});
}

/// @nodoc
class _$FilterListItemModelCopyWithImpl<$Res>
    implements $FilterListItemModelCopyWith<$Res> {
  _$FilterListItemModelCopyWithImpl(this._self, this._then);

  final FilterListItemModel _self;
  final $Res Function(FilterListItemModel) _then;

  /// Create a copy of FilterListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? group = null,
    Object? isSelected = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      group: null == group
          ? _self.group
          : group // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: null == isSelected
          ? _self.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _FilterListItemModel implements FilterListItemModel {
  const _FilterListItemModel(
      {required this.name, required this.group, required this.isSelected});
  factory _FilterListItemModel.fromJson(Map<String, dynamic> json) =>
      _$FilterListItemModelFromJson(json);

  @override
  final String name;
  @override
  final String group;
  @override
  final bool isSelected;

  /// Create a copy of FilterListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FilterListItemModelCopyWith<_FilterListItemModel> get copyWith =>
      __$FilterListItemModelCopyWithImpl<_FilterListItemModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FilterListItemModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FilterListItemModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, group, isSelected);

  @override
  String toString() {
    return 'FilterListItemModel(name: $name, group: $group, isSelected: $isSelected)';
  }
}

/// @nodoc
abstract mixin class _$FilterListItemModelCopyWith<$Res>
    implements $FilterListItemModelCopyWith<$Res> {
  factory _$FilterListItemModelCopyWith(_FilterListItemModel value,
          $Res Function(_FilterListItemModel) _then) =
      __$FilterListItemModelCopyWithImpl;
  @override
  @useResult
  $Res call({String name, String group, bool isSelected});
}

/// @nodoc
class __$FilterListItemModelCopyWithImpl<$Res>
    implements _$FilterListItemModelCopyWith<$Res> {
  __$FilterListItemModelCopyWithImpl(this._self, this._then);

  final _FilterListItemModel _self;
  final $Res Function(_FilterListItemModel) _then;

  /// Create a copy of FilterListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? group = null,
    Object? isSelected = null,
  }) {
    return _then(_FilterListItemModel(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      group: null == group
          ? _self.group
          : group // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: null == isSelected
          ? _self.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
