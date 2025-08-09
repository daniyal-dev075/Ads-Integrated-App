import 'package:ads_integrated_app/res/components/custom_button.dart';
import 'package:ads_integrated_app/view/screen_five.dart';
import 'package:flutter/material.dart';

import '../res/components/banner_ad_widget.dart';

class ScreenFour extends StatefulWidget {
  const ScreenFour({super.key});

  @override
  State<ScreenFour> createState() => _ScreenFourState();
}

class _ScreenFourState extends State<ScreenFour> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text('Screen Four'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(title: 'Next Screen', onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>ScreenFive()));
                        })
                      ],
                    ),
                  ),
                ),
              ),
              BannerAdWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
