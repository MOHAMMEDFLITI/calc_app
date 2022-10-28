import 'package:calculator_app/components/calculator_app.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CalculatorApp extends StatefulWidget {

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {

  int? firstNum;
  int? secondNum;
  String history = '';
  String textDisplay='';
  String? res;
  String? operation;

  void buttonClicked(String buttonVal)
  {
    if (buttonVal =='C')
      {
        firstNum = 0;
        secondNum = 0;
        textDisplay = '';
        res='';
        history='';
      }else if(buttonVal == 'assets/images/2.png')
          {
            res = textDisplay.substring(0,textDisplay.length-1);
          }else if (buttonVal == '+' || buttonVal == '-' || buttonVal == '*' || buttonVal == '/')
        {
          firstNum = int.parse(textDisplay) ;
          res = '';
          operation = buttonVal ;
        }else if (buttonVal == '=')
          {
            secondNum = int.parse(textDisplay);
            if (operation == '+')
              {
                res = (firstNum! + secondNum!).toString();
                history = firstNum.toString() + operation.toString()+secondNum.toString();
              }if (operation == '-')
            {
              res = (firstNum! - secondNum!).toString();
              history = firstNum.toString() + operation.toString()+secondNum.toString();
            }if (operation == '*')
            {
              res = (firstNum! * secondNum!).toString();
              history = firstNum.toString() + operation.toString()+secondNum.toString();
            }if (operation == '/')
            {
              res = (firstNum! / secondNum!).toString();
              history = firstNum.toString() + operation.toString()+secondNum.toString();
            }
          }else
            {
              res = int.parse(textDisplay+buttonVal).toString();
            }
    setState((){
      textDisplay=res!;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF171C22),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: const Color(0xFF171C22),
                alignment: AlignmentDirectional.bottomEnd,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        alignment: AlignmentDirectional.bottomEnd,
                        child: Padding(
                          padding:const EdgeInsetsDirectional.only(
                            end: 15,
                            bottom: 0,
                          ),
                          child: Text(
                            history,
                            style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                  fontSize:24,
                                  color: Colors.grey,
                                )
                            ),
                          ),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Expanded(
                        child: Container(
                          width: double.infinity,
                          alignment: AlignmentDirectional.bottomEnd,
                          child: Padding(
                            padding:const EdgeInsetsDirectional.only(
                              end: 15,
                              bottom: 15,
                              top: 0,
                            ),
                            child: Text(
                              textDisplay,
                              style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                  fontSize:48,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 6,
              width: double.infinity,
              color: const Color(0xFF937CE6),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                  bottom: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:
                  [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:
                      [
                        calculatorButton(text: 'C',value: 0xFF2E3A48,function: buttonClicked),
                        calculatorButton(text: '(',value: 0xFF2E3A48),
                        calculatorButton(text: ')',value: 0xFF2E3A48),
                        specialCalculatorButton(asset:"assets/images/2.png",function: buttonClicked),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:
                      [
                        calculatorButton(text: '7',function: buttonClicked),
                        calculatorButton(text: '8',function: buttonClicked),
                        calculatorButton(text: '9',function: buttonClicked),
                        calculatorButton(text: '/',value: 0xFF6344D4,function: buttonClicked),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:
                      [
                        calculatorButton(text: '4',function: buttonClicked),
                        calculatorButton(text: '5',function: buttonClicked),
                        calculatorButton(text: '6',function: buttonClicked),
                        calculatorButton(text: '*',value: 0xFF6344D4,function: buttonClicked),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:
                      [
                        calculatorButton(text: '1',function: buttonClicked),
                        calculatorButton(text: '2',function: buttonClicked),
                        calculatorButton(text: '3',function: buttonClicked),
                        calculatorButton(text: '-',value: 0xFF6344D4,function: buttonClicked),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:
                      [
                        calculatorButton(text: '0',function: buttonClicked),
                        calculatorButton(text: '.',function: buttonClicked),
                        calculatorButton(text: '=',function: buttonClicked),
                        calculatorButton(text: '+',value: 0xFF6344D4,function: buttonClicked),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
