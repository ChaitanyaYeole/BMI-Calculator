import 'dart:math';

class CalculateBMI {
  final int height;
  final int weight;

  late double _bmi;
  CalculateBMI(this.height, this.weight) {
    _bmi = weight / pow(height / 100, 2);
  }
  String getBMI() {
    return _bmi.toStringAsFixed(1);
  }

  String getDiscription() {
    return _bmi > 40
        ? 'Obese Class III'
        : (_bmi > 35
            ? 'Obese Class II'
            : (_bmi > 30
                ? 'Obese Class I'
                : (_bmi > 25
                    ? 'Overweight'
                    : (_bmi > 18.5
                        ? 'Normal'
                        : (_bmi > 17
                            ? 'Mild Thinness'
                            : (_bmi > 16
                                ? 'Moderate Thinness'
                                : 'Severe Thinness'))))));
  }

  String getAdvice() {
    return _bmi > 40
        ? 'It means you are overweight. You have to eat lesser junk food, eat healty food and keep exersise. Try to contact doctor or a dietician for better advice'
        : (_bmi > 35
            ? 'It means you are overweight. You have to eat lesser junk food, eat healty food and keep exersise'
            : (_bmi > 30
                ? 'TIt means you are overweight. You have to eat lesser, healther food and keep exersise'
                : (_bmi > 25
                    ? 'You have to eat bit lesser and keep exersise'
                    : (_bmi > 18.5
                        ? 'It means that you have a healthy weight in relation to your height. You have to maintain a healthy level of body fat as you are now, Keep maintain this Fitness.'
                        : (_bmi > 17
                            ? 'It means that you are underweight. You need to put on more weight by eating a bit more.'
                            : (_bmi > 16
                                ? 'It means that you are underweight. You need to put on more weight. You have to eat more healthy food which contain higher calories.'
                                : 'It means that you are underweight. You need to put on more weight. Try to contact with a dietician for professional insight and advice.'))))));
  }
}
