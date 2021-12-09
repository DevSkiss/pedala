// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomeStateTearOff {
  const _$HomeStateTearOff();

  _HomeState call(
      {dynamic isLoading = false,
      dynamic hasError = false,
      dynamic isFinished = false,
      dynamic orderSuccess = false,
      List<FoodCategoryDto>? foodCategory,
      List<FoodDto>? foodDto}) {
    return _HomeState(
      isLoading: isLoading,
      hasError: hasError,
      isFinished: isFinished,
      orderSuccess: orderSuccess,
      foodCategory: foodCategory,
      foodDto: foodDto,
    );
  }
}

/// @nodoc
const $HomeState = _$HomeStateTearOff();

/// @nodoc
mixin _$HomeState {
  dynamic get isLoading => throw _privateConstructorUsedError;
  dynamic get hasError => throw _privateConstructorUsedError;
  dynamic get isFinished => throw _privateConstructorUsedError;
  dynamic get orderSuccess => throw _privateConstructorUsedError;
  List<FoodCategoryDto>? get foodCategory => throw _privateConstructorUsedError;
  List<FoodDto>? get foodDto => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res>;
  $Res call(
      {dynamic isLoading,
      dynamic hasError,
      dynamic isFinished,
      dynamic orderSuccess,
      List<FoodCategoryDto>? foodCategory,
      List<FoodDto>? foodDto});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  final HomeState _value;
  // ignore: unused_field
  final $Res Function(HomeState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? hasError = freezed,
    Object? isFinished = freezed,
    Object? orderSuccess = freezed,
    Object? foodCategory = freezed,
    Object? foodDto = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as dynamic,
      hasError: hasError == freezed
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isFinished: isFinished == freezed
          ? _value.isFinished
          : isFinished // ignore: cast_nullable_to_non_nullable
              as dynamic,
      orderSuccess: orderSuccess == freezed
          ? _value.orderSuccess
          : orderSuccess // ignore: cast_nullable_to_non_nullable
              as dynamic,
      foodCategory: foodCategory == freezed
          ? _value.foodCategory
          : foodCategory // ignore: cast_nullable_to_non_nullable
              as List<FoodCategoryDto>?,
      foodDto: foodDto == freezed
          ? _value.foodDto
          : foodDto // ignore: cast_nullable_to_non_nullable
              as List<FoodDto>?,
    ));
  }
}

/// @nodoc
abstract class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(
          _HomeState value, $Res Function(_HomeState) then) =
      __$HomeStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {dynamic isLoading,
      dynamic hasError,
      dynamic isFinished,
      dynamic orderSuccess,
      List<FoodCategoryDto>? foodCategory,
      List<FoodDto>? foodDto});
}

/// @nodoc
class __$HomeStateCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(_HomeState _value, $Res Function(_HomeState) _then)
      : super(_value, (v) => _then(v as _HomeState));

  @override
  _HomeState get _value => super._value as _HomeState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? hasError = freezed,
    Object? isFinished = freezed,
    Object? orderSuccess = freezed,
    Object? foodCategory = freezed,
    Object? foodDto = freezed,
  }) {
    return _then(_HomeState(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading,
      hasError: hasError == freezed ? _value.hasError : hasError,
      isFinished: isFinished == freezed ? _value.isFinished : isFinished,
      orderSuccess:
          orderSuccess == freezed ? _value.orderSuccess : orderSuccess,
      foodCategory: foodCategory == freezed
          ? _value.foodCategory
          : foodCategory // ignore: cast_nullable_to_non_nullable
              as List<FoodCategoryDto>?,
      foodDto: foodDto == freezed
          ? _value.foodDto
          : foodDto // ignore: cast_nullable_to_non_nullable
              as List<FoodDto>?,
    ));
  }
}

/// @nodoc

class _$_HomeState implements _HomeState {
  _$_HomeState(
      {this.isLoading = false,
      this.hasError = false,
      this.isFinished = false,
      this.orderSuccess = false,
      this.foodCategory,
      this.foodDto});

  @JsonKey(defaultValue: false)
  @override
  final dynamic isLoading;
  @JsonKey(defaultValue: false)
  @override
  final dynamic hasError;
  @JsonKey(defaultValue: false)
  @override
  final dynamic isFinished;
  @JsonKey(defaultValue: false)
  @override
  final dynamic orderSuccess;
  @override
  final List<FoodCategoryDto>? foodCategory;
  @override
  final List<FoodDto>? foodDto;

  @override
  String toString() {
    return 'HomeState(isLoading: $isLoading, hasError: $hasError, isFinished: $isFinished, orderSuccess: $orderSuccess, foodCategory: $foodCategory, foodDto: $foodDto)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.hasError, hasError) &&
            const DeepCollectionEquality()
                .equals(other.isFinished, isFinished) &&
            const DeepCollectionEquality()
                .equals(other.orderSuccess, orderSuccess) &&
            const DeepCollectionEquality()
                .equals(other.foodCategory, foodCategory) &&
            const DeepCollectionEquality().equals(other.foodDto, foodDto));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(hasError),
      const DeepCollectionEquality().hash(isFinished),
      const DeepCollectionEquality().hash(orderSuccess),
      const DeepCollectionEquality().hash(foodCategory),
      const DeepCollectionEquality().hash(foodDto));

  @JsonKey(ignore: true)
  @override
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  factory _HomeState(
      {dynamic isLoading,
      dynamic hasError,
      dynamic isFinished,
      dynamic orderSuccess,
      List<FoodCategoryDto>? foodCategory,
      List<FoodDto>? foodDto}) = _$_HomeState;

  @override
  dynamic get isLoading;
  @override
  dynamic get hasError;
  @override
  dynamic get isFinished;
  @override
  dynamic get orderSuccess;
  @override
  List<FoodCategoryDto>? get foodCategory;
  @override
  List<FoodDto>? get foodDto;
  @override
  @JsonKey(ignore: true)
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
