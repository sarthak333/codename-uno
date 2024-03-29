// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GameState _$GameStateFromJson(Map<String, dynamic> json) {
  return _GameState.fromJson(json);
}

/// @nodoc
mixin _$GameState {
  GalaxyData get galaxy => throw _privateConstructorUsedError;
  bool get isReady => throw _privateConstructorUsedError;
  SolarSystemData? get currentSolarSystem => throw _privateConstructorUsedError;
  PlanetData? get currentPlanet => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameStateCopyWith<GameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) then) =
      _$GameStateCopyWithImpl<$Res, GameState>;
  @useResult
  $Res call(
      {GalaxyData galaxy,
      bool isReady,
      SolarSystemData? currentSolarSystem,
      PlanetData? currentPlanet});

  $GalaxyDataCopyWith<$Res> get galaxy;
  $SolarSystemDataCopyWith<$Res>? get currentSolarSystem;
  $PlanetDataCopyWith<$Res>? get currentPlanet;
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res, $Val extends GameState>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? galaxy = null,
    Object? isReady = null,
    Object? currentSolarSystem = freezed,
    Object? currentPlanet = freezed,
  }) {
    return _then(_value.copyWith(
      galaxy: null == galaxy
          ? _value.galaxy
          : galaxy // ignore: cast_nullable_to_non_nullable
              as GalaxyData,
      isReady: null == isReady
          ? _value.isReady
          : isReady // ignore: cast_nullable_to_non_nullable
              as bool,
      currentSolarSystem: freezed == currentSolarSystem
          ? _value.currentSolarSystem
          : currentSolarSystem // ignore: cast_nullable_to_non_nullable
              as SolarSystemData?,
      currentPlanet: freezed == currentPlanet
          ? _value.currentPlanet
          : currentPlanet // ignore: cast_nullable_to_non_nullable
              as PlanetData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GalaxyDataCopyWith<$Res> get galaxy {
    return $GalaxyDataCopyWith<$Res>(_value.galaxy, (value) {
      return _then(_value.copyWith(galaxy: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SolarSystemDataCopyWith<$Res>? get currentSolarSystem {
    if (_value.currentSolarSystem == null) {
      return null;
    }

    return $SolarSystemDataCopyWith<$Res>(_value.currentSolarSystem!, (value) {
      return _then(_value.copyWith(currentSolarSystem: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PlanetDataCopyWith<$Res>? get currentPlanet {
    if (_value.currentPlanet == null) {
      return null;
    }

    return $PlanetDataCopyWith<$Res>(_value.currentPlanet!, (value) {
      return _then(_value.copyWith(currentPlanet: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_GameStateCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory _$$_GameStateCopyWith(
          _$_GameState value, $Res Function(_$_GameState) then) =
      __$$_GameStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GalaxyData galaxy,
      bool isReady,
      SolarSystemData? currentSolarSystem,
      PlanetData? currentPlanet});

  @override
  $GalaxyDataCopyWith<$Res> get galaxy;
  @override
  $SolarSystemDataCopyWith<$Res>? get currentSolarSystem;
  @override
  $PlanetDataCopyWith<$Res>? get currentPlanet;
}

/// @nodoc
class __$$_GameStateCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$_GameState>
    implements _$$_GameStateCopyWith<$Res> {
  __$$_GameStateCopyWithImpl(
      _$_GameState _value, $Res Function(_$_GameState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? galaxy = null,
    Object? isReady = null,
    Object? currentSolarSystem = freezed,
    Object? currentPlanet = freezed,
  }) {
    return _then(_$_GameState(
      galaxy: null == galaxy
          ? _value.galaxy
          : galaxy // ignore: cast_nullable_to_non_nullable
              as GalaxyData,
      isReady: null == isReady
          ? _value.isReady
          : isReady // ignore: cast_nullable_to_non_nullable
              as bool,
      currentSolarSystem: freezed == currentSolarSystem
          ? _value.currentSolarSystem
          : currentSolarSystem // ignore: cast_nullable_to_non_nullable
              as SolarSystemData?,
      currentPlanet: freezed == currentPlanet
          ? _value.currentPlanet
          : currentPlanet // ignore: cast_nullable_to_non_nullable
              as PlanetData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GameState implements _GameState {
  const _$_GameState(
      {required this.galaxy,
      this.isReady = true,
      this.currentSolarSystem,
      this.currentPlanet});

  factory _$_GameState.fromJson(Map<String, dynamic> json) =>
      _$$_GameStateFromJson(json);

  @override
  final GalaxyData galaxy;
  @override
  @JsonKey()
  final bool isReady;
  @override
  final SolarSystemData? currentSolarSystem;
  @override
  final PlanetData? currentPlanet;

  @override
  String toString() {
    return 'GameState(galaxy: $galaxy, isReady: $isReady, currentSolarSystem: $currentSolarSystem, currentPlanet: $currentPlanet)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameState &&
            (identical(other.galaxy, galaxy) || other.galaxy == galaxy) &&
            (identical(other.isReady, isReady) || other.isReady == isReady) &&
            (identical(other.currentSolarSystem, currentSolarSystem) ||
                other.currentSolarSystem == currentSolarSystem) &&
            (identical(other.currentPlanet, currentPlanet) ||
                other.currentPlanet == currentPlanet));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, galaxy, isReady, currentSolarSystem, currentPlanet);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GameStateCopyWith<_$_GameState> get copyWith =>
      __$$_GameStateCopyWithImpl<_$_GameState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GameStateToJson(
      this,
    );
  }
}

abstract class _GameState implements GameState {
  const factory _GameState(
      {required final GalaxyData galaxy,
      final bool isReady,
      final SolarSystemData? currentSolarSystem,
      final PlanetData? currentPlanet}) = _$_GameState;

  factory _GameState.fromJson(Map<String, dynamic> json) =
      _$_GameState.fromJson;

  @override
  GalaxyData get galaxy;
  @override
  bool get isReady;
  @override
  SolarSystemData? get currentSolarSystem;
  @override
  PlanetData? get currentPlanet;
  @override
  @JsonKey(ignore: true)
  _$$_GameStateCopyWith<_$_GameState> get copyWith =>
      throw _privateConstructorUsedError;
}
