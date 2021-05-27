import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_content.dart';
import 'constants.dart';
import 'result_page.dart';
import 'bottom_button.dart';
import 'round.dart';
import 'calculator.dart';

enum Gender{
  male,
  female,
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedgender;
  int height=180;
  int weight=60;
  int age=18;
  /*Color malecolour=inactivecolour;
  Color femalecolour=inactivecolour;
  void updatecolour(Gender selectedgender){
    if(selectedgender==Gender.male){
      if(malecolour==inactivecolour)
        {
          malecolour=activecolour;
          femalecolour=inactivecolour;
        }
      else
        malecolour=inactivecolour;
    }
    if(selectedgender==Gender.female){
      if(femalecolour==inactivecolour){
        femalecolour=activecolour;
        malecolour=inactivecolour;
      }
      else
        femalecolour=inactivecolour;
    }
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(child: Row(
            children: [
              Expanded(child: ReusableCode(
                onpress: (){
                  setState(() {
                    selectedgender=Gender.male;
                  });
                },
                colour:selectedgender==Gender.male?kActivecolour:kInactivecolour,
              Cardchild: IconContent(
                icon: FontAwesomeIcons.mars,
                label: 'MALE',
              ),),),
              Expanded(child: ReusableCode(
                onpress: (){
                  setState(() {
                    selectedgender=Gender.female;
                  });
                },
                colour: selectedgender==Gender.female?kActivecolour:kInactivecolour,
              Cardchild: IconContent(
                icon: FontAwesomeIcons.venus,
                label: 'FEMALE',
              ),),),
            ],
          )),
          Expanded(child: ReusableCode(colour: kActivecolour,
            Cardchild: Column(
              children: [
                Text(
                  'HEIGHT',style: kLabeltextstyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kNumberstyle,),
                    Text(
                      'cm',
                      style: kLabeltextstyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                    thumbShape:
                      RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape:
                      RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newvalue){
                      setState(() {
                        height=newvalue.round();
                      });
                    },
                  ),
                ),
              ],
            ),

          ),),
          Expanded(child: Row(
            children: [
              Expanded(child: ReusableCode(
                  colour: kActivecolour,
              Cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'WEIGHT',
                    style: kLabeltextstyle,
                  ),
                  Text(
                    weight.toString(),
                    style: kNumberstyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundIconButton(
                        icon: FontAwesomeIcons.minus,
                        onpressed: (){
                          setState(() {
                            weight--;
                          });
                        },
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      RoundIconButton(
                        icon: FontAwesomeIcons.plus,
                        onpressed: (){
                          setState(() {
                            weight++;
                          });
                        },
                      ),
                    ],
                  ),

                ],
              ),),),
              Expanded(child: ReusableCode(colour: kActivecolour,
                Cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'AGE',
                      style: kLabeltextstyle,
                    ),
                    Text(
                      age.toString(),
                      style: kNumberstyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onpressed: (){
                            setState(() {
                              age--;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onpressed: (){
                            setState(() {
                              age++;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),),
            ],
          )),
          BottomButton(
            buttontitle: 'CALCULATE',
            onTap: () {
              CalculatorBrain calc =
              CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Resultpage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },

          ),
        ],
      ),
    );
  }
}





