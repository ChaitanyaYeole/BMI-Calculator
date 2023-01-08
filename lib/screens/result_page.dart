import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../components/common_button.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {super.key,
      required this.discription,
      required this.advice,
      required this.result});

  final String discription;
  final String result;
  final String advice;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xff090C22),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xff090C22),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'BMI Calculator',
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 8.0, left: 10.0),
                child: Text(
                  'Your Result',
                  style: kBigBoldTextStyle,
                  // textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                flex: 9,
                child: ReusableCard(
                  onPress: () {},
                  colour: kActiveCardColor,
                  childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          discription,
                          style: discription == 'Normal'
                              ? kGoodTextStyle
                              : kBadTextStyle,
                        ),
                        Text(
                          result,
                          style: kBigestBoldTextStyle,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            advice,
                            style: kWhiteTextStyle,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ]),
                ),
              ),
              Expanded(
                flex: 1,
                child: CommonButton(
                    text: 'RE-CALCULATE YOUR BMI',
                    onPress: () {
                      Navigator.pop(context);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
