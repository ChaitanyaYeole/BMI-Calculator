import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import '../components/reusable_card.dart';
import '../components/child_card_icon.dart';
import '../constants.dart';
import '../components/common_button.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/calculate_bmi.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

enum Gender {
  setDefault,
  male,
  female,
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.setDefault;
  int height = 180, weight = 60, age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'BMI Calculator',
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    childCard: const ChildCardIcon(Icons.male, 'Male'),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    childCard: const ChildCardIcon(Icons.female, 'Female'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: ReusableCard(
              onPress: () {},
              colour: kInactiveCardColor,
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Height',
                    style: kNormalTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kBigBoldTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: kNormalTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 11.0),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 20.0),
                      overlayColor: const Color(0x45EA1556),
                      activeTrackColor: const Color(0xffFFFFFF),
                      inactiveTrackColor: const Color(0xff888994),
                      thumbColor: const Color(0xffEA1556),
                      // thumbColor: const Color(0xffEA1556),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {},
                    colour: kInactiveCardColor,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Weight',
                          style: kNormalTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kBigBoldTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundiconButton(
                              icondata: Icons.remove,
                              onPress: () {
                                weight > 0
                                    ? setState(() {
                                        weight--;
                                      })
                                    : null;
                              },
                            ),
                            RoundiconButton(
                              icondata: Icons.add,
                              onPress: () {
                                weight < 200
                                    ? setState(() {
                                        weight++;
                                      })
                                    : null;
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {},
                    colour: kInactiveCardColor,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Age',
                          style: kNormalTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kBigBoldTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundiconButton(
                              icondata: Icons.remove,
                              onPress: () {
                                age > 0
                                    ? setState(() {
                                        age--;
                                      })
                                    : null;
                              },
                            ),
                            RoundiconButton(
                              icondata: Icons.add,
                              onPress: () {
                                age < 200
                                    ? setState(() {
                                        age++;
                                      })
                                    : null;
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: CommonButton(
              text: 'CALCULATE YOUR BMI',
              onPress: () {
                CalculateBMI calculateBMI = CalculateBMI(height, weight);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ResultPage(
                    discription: calculateBMI.getDiscription(),
                    result: calculateBMI.getBMI(),
                    advice: calculateBMI.getAdvice(),
                  );
                }));
              },
            ),
          )
        ],
      ),
    );
  }
}
