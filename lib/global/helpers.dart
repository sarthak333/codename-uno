import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:fast_noise/fast_noise.dart';
import 'package:flutter/material.dart';
import 'package:game_test_bonfire/global/characters/player/player_controller.dart';
import 'package:game_test_bonfire/global/levels/map_gen_test.dart';
import 'package:game_test_bonfire/global/objects/decor/outdoor/bush.dart';
import 'package:game_test_bonfire/global/objects/decor/outdoor/flower.dart';
import 'package:game_test_bonfire/global/objects/decor/outdoor/grass.dart';
import 'package:game_test_bonfire/global/objects/decor/outdoor/tree.dart';
import 'package:game_test_bonfire/global/objects/map_boundary_tile.dart';

class Alfred {
  static Random random = Random();
  static int mapSize = 30;
  static int tileSize = 256;

  static pushNewLevel({
    required BuildContext context,
    required dynamic destination,
  }) {
    Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => destination,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return Container(
            color: Colors.black,
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
      ),
      (Route<dynamic> route) => false,
    );
  }

  static Vector2 getMapCenter() {
    return Vector2(
      (mapSize / 2 * tileSize),
      (mapSize / 2 * tileSize),
    );
  }

  static Vector2 getMapTileClosestToCenter(
      List<List<double>> map, String tileType) {
    int centerTile = mapSize ~/ 2;
    List<int>? centerLanding = findClosestElement(
      map,
      centerTile,
      centerTile,
      (value) => matrixMappingToMap[value] == tileType,
    );
    if (centerLanding != null) {
      return Vector2(
        (centerLanding[1] * Alfred.tileSize).toDouble(),
        (centerLanding[0] * Alfred.tileSize).toDouble(),
      );
    } else {
      return Vector2(
        (mapSize / 2 * tileSize),
        (mapSize / 2 * tileSize),
      );
    }
  }

  static List<GameDecoration> getMapBoundaries() {
    List<GameDecoration> mapBoundary = [];
    for (double i = 0; i < mapSize; i++) {
      mapBoundary.add(MapBoundaryTile(
        Vector2(0, i * Alfred.tileSize),
        side: MapBoundarySide.left,
      ));
      mapBoundary.add(MapBoundaryTile(
        Vector2(i * Alfred.tileSize, 0),
        side: MapBoundarySide.top,
      ));
      mapBoundary.add(MapBoundaryTile(
        Vector2(i * Alfred.tileSize,
            ((Alfred.mapSize - 1) * Alfred.tileSize).toDouble()),
        side: MapBoundarySide.bottom,
      ));
      mapBoundary.add(MapBoundaryTile(
        Vector2(((Alfred.mapSize - 1) * Alfred.tileSize).toDouble(),
            i * Alfred.tileSize),
        side: MapBoundarySide.right,
      ));
    }
    return mapBoundary;
  }

  static int getRandomNumber({int? min, int? max}) {
    if (min != null && max != null) {
      ++max;
      return min + random.nextInt(max - min);
    } else {
      return random.nextInt(max ?? 9999);
    }
  }

  static String getRandomStringFromList(List<String> list) {
    return list[getRandomNumber(max: list.length - 1, min: 0).toInt()];
  }

  static T getRandomValueFromList<T>(List<T> list) {
    return list[getRandomNumber(max: list.length - 1, min: 0).toInt()];
  }

  static List<List<double>> generateNoiseMap({
    required int size,
    required double frequency,
    int? seed,
    double? gain,
    NoiseType? noiseType,
    CellularDistanceFunction? df,
  }) {
    return noise2(
      size,
      size,
      seed: seed ?? random.nextInt(9999),
      frequency: frequency,
      gain: gain ?? 0.5,
      noiseType: noiseType ?? NoiseType.PerlinFractal,
      cellularDistanceFunction: df ?? CellularDistanceFunction.Natural,
    );
  }

  static List<GameDecoration> getForestDecorations() {
    List<GameDecoration> list = [...getMapBoundaries()];
    List<List<double>> noiseMap = generateNoiseMap(
      size: Alfred.mapSize,
      frequency: 0.5,
      gain: 0.5,
      df: CellularDistanceFunction.Euclidean,
    );

    double noiseMax =
        noiseMap.reduce((value, element) => [...value, ...element]).reduce(max);
    double noiseMin =
        noiseMap.reduce((value, element) => [...value, ...element]).reduce(min);
    final int randomInt = Alfred.random.nextInt(100);
    for (List<double> i in noiseMap) {
      for (double j in i) {
        final double normalizedValue = (j - noiseMin) / (noiseMax - noiseMin);
        if (normalizedValue > 0.7 && randomInt < 50) {
          list.add(
            TreeDecoration(
              Vector2(
                (noiseMap.indexOf(i) * Alfred.tileSize).toDouble(),
                (Alfred.tileSize * i.indexOf(j)).toDouble(),
              ),
            ),
          );
        } else if (normalizedValue > 0.6 && randomInt < 70) {
          list.add(
            BushDecoration(
              Vector2(
                (noiseMap.indexOf(i) * Alfred.tileSize).toDouble(),
                (Alfred.tileSize * i.indexOf(j)).toDouble(),
              ),
            ),
          );
        } else if (normalizedValue > 0.5 && randomInt < 90) {
          list.add(
            FlowerDecoration(
              Vector2(
                (noiseMap.indexOf(i) * Alfred.tileSize).toDouble(),
                (Alfred.tileSize * i.indexOf(j)).toDouble(),
              ),
            ),
          );
        } else if (normalizedValue > 0.4 && randomInt < 100) {
          list.add(
            GrassDecoration(
              Vector2(
                (noiseMap.indexOf(i) * Alfred.tileSize).toDouble(),
                (Alfred.tileSize * i.indexOf(j)).toDouble(),
              ),
            ),
          );
        }
      }
    }
    return list;
  }

  static List<GameDecoration> getForestDecorationAsPerMap(
      List<List<double>> map) {
    List<GameDecoration> list = [...getMapBoundaries()];
    for (int i = 0; i < map.length; i++) {
      for (int j = 0; j < map.length; j++) {
        if (map[j][i] == 3 || map[j][i] == 4) {
          random.nextBool()
              ? list.add(
                  TreeDecoration(
                    Vector2(
                      (i * Alfred.tileSize).toDouble(),
                      (Alfred.tileSize * j).toDouble() - (Alfred.tileSize / 2),
                    ),
                  ),
                )
              : list.add(GrassDecoration(
                  Vector2(
                    (i * Alfred.tileSize).toDouble(),
                    (Alfred.tileSize * j).toDouble() - (Alfred.tileSize / 2),
                  ),
                ));
        } else if (map[j][i] == 2) {
          list.add(
            WaterTile(
              Vector2(
                (i * Alfred.tileSize).toDouble(),
                (Alfred.tileSize * j).toDouble(),
              ),
            ),
          );
        }
      }
    }
    return list;
  }

  static List<GameDecoration> getBushDecorationList({required int mapSize}) {
    List<GameDecoration> list = [];
    List<List<double>> noiseMap = generateNoiseMap(
      size: mapSize,
      frequency: 0.5,
    );
    for (List<double> i in noiseMap) {
      for (double j in i) {
        if (j < 0) {
          noiseMap[noiseMap.indexOf(i)][i.indexOf(j)] = 1;
          list.add(
            BushDecoration(
              Vector2(
                noiseMap.indexOf(i) * 64,
                (64 * i.indexOf(j)).toDouble(),
              ),
            ),
          );
        }
      }
    }
    return list;
  }
}
