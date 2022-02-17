import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:url_launcher/url_launcher.dart';


Widget menuDrawer() {
  return BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
    child: SafeArea(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 25),
            child: Center(
              child: Text(
                'درباره ی ما',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            height: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kLightPurpleColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: const [
                    Center(
                      child: Text('Instagram:',style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold,),),
                    ),
                    Center(
                      child: Text('hamid_programer_pro',style: TextStyle(color: Colors.white,fontSize: 25,fontStyle: FontStyle.italic,),),
                    ),
                  ],
                ),
                Column(
                  children: const [
                    Center(
                      child: Text('TelPhone:',style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold,),),
                    ),
                    Center(
                      child: Text('09138742015',style: TextStyle(color: Colors.white,fontSize: 25,fontStyle: FontStyle.italic,),),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 150,right: 230),
            height: 65,
            width: 180,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(22),bottomRight: Radius.circular(22)),
              color: kPurpleColor,
            ),
            child: Material(
              borderRadius: const BorderRadius.only(topRight: Radius.circular(22),bottomRight: Radius.circular(22)),
              color: kPurpleColor,
              child: InkWell(
                borderRadius: const BorderRadius.only(topRight: Radius.circular(22),bottomRight: Radius.circular(22)),
                onTap: (){
                  launch('https://www.instagram.com/hamid_programer_pro/');
                },
                child: const Center(
                  child: Text('ارسال بازخورد',style: TextStyle(color: Colors.white,fontSize: 26),),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
