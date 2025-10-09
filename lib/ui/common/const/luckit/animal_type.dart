import '../assets.dart';

enum AnimalType {
  mouse(
    name: 'mouse',
    movingLottiePath: Assets.mouseMove,
    stopLottiePath: Assets.mouseStop,
  ),
  cow(
    name: 'cow',
    movingLottiePath: Assets.cowMove,
    stopLottiePath: Assets.cowStop,
  ),
  tiger(
    name: 'tiger',
    movingLottiePath: Assets.tigerMove,
    stopLottiePath: Assets.tigerStop,
  ),
  rabbit(
    name: 'rabbit',
    movingLottiePath: Assets.rabbitMove,
    stopLottiePath: Assets.rabbitStop,
  ),
  dragon(
    name: 'dragon',
    movingLottiePath: Assets.dragonMove,
    stopLottiePath: Assets.dragonStop,
  ),
  snake(
    name: 'snake',
    movingLottiePath: Assets.snakeMove,
    stopLottiePath: Assets.snakeStop,
  ),
  horse(
    name: 'horse',
    movingLottiePath: Assets.horseMove,
    stopLottiePath: Assets.horseStop,
  ),
  sheep(
    name: 'sheep',
    movingLottiePath: Assets.sheepMove,
    stopLottiePath: Assets.sheepStop,
  ),
  monkey(
    name: 'monkey',
    movingLottiePath: Assets.monkeyMove,
    stopLottiePath: Assets.monkeyStop,
  ),
  chicken(
    name: 'chicken',
    movingLottiePath: Assets.chickenMove,
    stopLottiePath: Assets.chickenStop,
  ),
  dog(
    name: 'dog',
    movingLottiePath: Assets.dogMove,
    stopLottiePath: Assets.dogStop,
  ),
  pig(
    name: 'pig',
    movingLottiePath: Assets.pigMove,
    stopLottiePath: Assets.pigStop,
  );

  const AnimalType({
    required this.name,
    required this.movingLottiePath,
    required this.stopLottiePath,
  });

  final String name;
  final String movingLottiePath;
  final String stopLottiePath;

  static AnimalType fromString(String name) => switch (name.toLowerCase()) {
        'dog' => AnimalType.dog,
        'rabbit' => AnimalType.rabbit,
        'chicken' => AnimalType.chicken,
        'pig' => AnimalType.pig,
        'sheep' => AnimalType.sheep,
        'tiger' => AnimalType.tiger,
        'dragon' => AnimalType.dragon,
        'snake' => AnimalType.snake,
        'mouse' => AnimalType.mouse,
        'cow' => AnimalType.cow,
        'monkey' => AnimalType.monkey,
        'horse' => AnimalType.horse,
        _ => throw ArgumentError('Unknown animal type: $name'),
      };
}
