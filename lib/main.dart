// ignore_for_file: library_private_types_in_public_api

import 'package:credit_card_input_form/constants/constanst.dart';
import 'package:flutter/material.dart';

import 'package:credit_card_input_form/credit_card_input_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // translate and customize captions
  // final Map<String, String> customCaptions = {
  //   'PREV': 'Prev',
  //   'NEXT': 'Next',
  //   'DONE': 'Done',
  //   'CARD_NUMBER': 'Card Number',
  //   'CARDHOLDER_NAME': 'Cardholder Name',
  //   'VALID_THRU': 'Valid Thru',
  //   'SECURITY_CODE_CVC': 'Security Code (CVC)',
  //   'NAME_SURNAME': 'Name Surname',
  //   'MM_YY': 'MM/YY',
  //   'RESET': 'Reset',
  // };

  final buttonStyle = BoxDecoration(
    borderRadius: BorderRadius.circular(30.0),
    gradient: const LinearGradient(
      colors: [
        Color(0XFF41295a),
        Color(0XFF2F0743),
      ],
      begin: FractionalOffset(0.0, 0.0),
      end: FractionalOffset(1.0, 0.0),
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp
    ),
  );

  final cardDecoration = const BoxDecoration(
    boxShadow: <BoxShadow>[
      BoxShadow(color: Colors.black54, blurRadius: 15.0, offset: Offset(0, 8))
    ],
    gradient: LinearGradient(
      colors: [
        Color(0XFF2F0743),
        Color(0XFF41295a),
      ],
      begin: FractionalOffset(0.0, 0.0),
      end: FractionalOffset(1.0, 0.0),
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp
    ),
    borderRadius: BorderRadius.all(Radius.circular(15))
  );

  final buttonTextStyle = const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Credit Card Input Form",style: TextStyle(fontSize: 15),),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SingleChildScrollView(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              child: Center(
                child: Stack(
                  children: [
                    CreditCardInputForm(
                      showResetButton: false,
                      onStateChange: (currentState, cardInfo) 
                      {
                        print(currentState);
                        print(cardInfo);
                      },
                      frontCardDecoration: cardDecoration,
                      backCardDecoration: cardDecoration,
                      nextButtonDecoration: buttonStyle,
                      prevButtonDecoration: buttonStyle,
                      prevButtonTextStyle: buttonTextStyle,
                      nextButtonTextStyle: buttonTextStyle,
                      // resetButtonTextStyle: buttonTextStyle,
                      resetButtonDecoration: buttonStyle,
                    ),
                  ]
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}