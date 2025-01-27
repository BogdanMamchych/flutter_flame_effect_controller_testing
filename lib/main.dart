import 'package:flame/effects.dart';
import 'package:flame_lottie/flame_lottie.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';

void main() {
  runApp(GameWidget(game: FlameFirstStep()));
}

//Перше знайомство з flame_lottie
class FlameFirstStep extends FlameGame {

  @override
  Future<void> onLoad() async {
    //Завантаження анімації та створення 'будівельного' віджету
    final LottieBuilder lottieBuilder = Lottie.asset('assets/win.json');
    //Компонування анімації, щоб Flame використовував анімації
    final LottieComposition lottieComposition = await loadLottie(lottieBuilder);
    //Створення контролера ефектів. Тут ви також можете погратися та заповнити ще параметри :)
    final EffectController controller = EffectController(duration: 1, infinite: true, alternate: true);
    //Створення самого компоненту анімації, цей комонент вже можна добавляти до світу, який вам взбреде в голову :)
    //Також можна тут погратися з position та size на ваш розсуд
    //Тільки запреЩаю ставити дуже великі значення, бо наш кубок (який зароблено непосильним трудом) полетить в стратосферу :)
    LottieComponent animation = LottieComponent(lottieComposition,
        position: Vector2.all(250), size: Vector2.all(200), controller: controller);
    add(animation);
  }
}
