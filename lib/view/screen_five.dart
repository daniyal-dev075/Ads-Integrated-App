import 'package:ads_integrated_app/res/components/custom_button.dart';
import 'package:ads_integrated_app/view/home_view.dart';
import 'package:flutter/material.dart';

import '../res/components/banner_ad_widget.dart';

class ScreenFive extends StatefulWidget {
  const ScreenFive({super.key});

  @override
  State<ScreenFive> createState() => _ScreenFiveState();
}

class _ScreenFiveState extends State<ScreenFive> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text('Screen Five'),
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
                        CustomButton(title: 'Back to Home View', onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>HomeView()));
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
