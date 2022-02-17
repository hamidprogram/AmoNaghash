import 'package:flutter/cupertino.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'constants.dart';

class ResultScren extends StatelessWidget {
  const ResultScren({Key? key, required this.datasenddata}) : super(key: key);
  final List<String> datasenddata;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 10.0),
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const Icon(Icons.arrow_back,color: kBlackBackgroundColor,),
                    )
                  ),
                const Padding(
                  padding: EdgeInsets.only(left: 150.0),
                  child: Center(
                    child: Text(
                      'عمو نقاش',
                      style: TextStyle(color: Colors.white, fontSize: 50),
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 40.0),
              height: 645,
              width: 350,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
                gradient: LinearGradient(
                  colors: [kDarkPurpleColor, Colors.white],
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Stack(
                children: [
                  Center(
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Container(
                        margin: const EdgeInsets.only(top: 100.0),
                        height: 570,
                        width: 300,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0))),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 160),
                              child: Center(
                                  child: Text('نتایج',
                                      style: TextStyle(
                                          color: kPurpleColor,
                                          fontSize: 80,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'BNazanin'))),
                            ),
                            const Divider(
                              height: 2,
                              color: kPurpleColor,
                              thickness: 5,
                              endIndent: 15,
                              indent: 15,
                            ),
                            //نوشته ها
                            SizedBox(
                              width: 250,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Center(
                                          child: Text(
                                        datasenddata[0],
                                        style: const TextStyle(fontSize: 30),
                                      )),
                                      const Center(
                                          child: Text(
                                        'پول هر متر',
                                        style: TextStyle(fontSize: 30),
                                      )),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Center(
                                          child: Text(
                                        datasenddata[1],
                                        style: const TextStyle(fontSize: 30),
                                      )),
                                      const Center(
                                          child: Text(
                                        'متراژ',
                                        style: TextStyle(fontSize: 30),
                                      )),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Center(
                                          child: Text(
                                        datasenddata[2],
                                        style: const TextStyle(fontSize: 30),
                                      )),
                                      const Center(
                                          child: Text(
                                        'مقدار رنگ',
                                        style: TextStyle(fontSize: 30),
                                      )),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Center(
                                          child: Text(
                                        datasenddata[3],
                                        style: const TextStyle(fontSize: 30),
                                      )),
                                      const Center(
                                          child: Text(
                                        'پول هر لیتر رنگ',
                                        style: TextStyle(fontSize: 30),
                                      )),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Center(
                                          child: Text(
                                        datasenddata[4],
                                        style: const TextStyle(fontSize: 30),
                                      )),
                                      const Center(
                                          child: Text(
                                        'مقادیر اضافه',
                                        style: TextStyle(fontSize: 30),
                                      )),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Center(
                                          child: Text(
                                        datasenddata[5],
                                        style: const TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: kPurpleColor),
                                      )),
                                      const Center(
                                          child: Text(
                                        'قابل پرداخت',
                                        style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: kPurpleColor),
                                      )),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 400.0),
                    child: Center(
                      child: SizedBox(
                          height: 350,
                          width: 350,
                          child: Image.asset('assets/images/result.png')),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
