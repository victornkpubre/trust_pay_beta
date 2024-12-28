import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/buttons.dart';
import 'package:trust_pay_beta/components/data_cards.dart';
import 'package:trust_pay_beta/components/form_inputs.dart';
import 'package:trust_pay_beta/components/indicators.dart';
import 'package:trust_pay_beta/components/list_items.dart';
import 'package:trust_pay_beta/components/pop_ups.dart';
import 'package:trust_pay_beta/components/tiles.dart';

class Catalogue extends StatelessWidget {
  static const String routeName = '/catalogue';
  const Catalogue({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // BackButton(),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Catalogue",
                    style: TextStyle(
                        fontSize: 48, decoration: TextDecoration.underline),
                  ),
                ],
              ),
              FormInputs(),
              Buttons(),
              DataCards(),
              Tiles(),
              Indicators(),
              ListItems(),
              PopUps(),
              // const Illustrations()
            ],
          ),
        ),
      ),
    );
  }
}
