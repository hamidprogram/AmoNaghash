import 'dart:ui';
import 'package:amo_naghash/menu_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:lottie/lottie.dart';
import 'result.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
          duration: 3000,
          splash: Padding(
            padding: const EdgeInsets.only(left: 100),
            child: Row(
              children: [
                Image.asset('assets/images/splash.png'),
                const Text('عمو نقاش',style: TextStyle(color: kBlackBackgroundColor,fontSize: 20,fontWeight: FontWeight.bold),)
              ],
            ),
          ),
          nextScreen: const MyHomePage(),
          splashTransition: SplashTransition.slideTransition,
          backgroundColor: Colors.white
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

GlobalKey<ScaffoldState> _scaffolKEy = GlobalKey<ScaffoldState>();

class _MyHomePageState extends State<MyHomePage> {
  final txtLitrControl = TextEditingController();
  final txtMonyLitrControl = TextEditingController();
  final txtMetrControl = TextEditingController();
  final txtMonyMetrControl = TextEditingController();
  final txtAddMony = TextEditingController();
  int result = 0;
  int addEgane = 0;


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    txtLitrControl.dispose();
    txtMonyLitrControl.dispose();
    txtMetrControl.dispose();
    txtMonyMetrControl.dispose();
    txtAddMony.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffolKEy,
      backgroundColor: kBlackBackgroundColor,
      resizeToAvoidBottomInset : false,
      drawer: menuDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            //اپ بار
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    _scaffolKEy.currentState?.openDrawer();
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      // color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.menu_outlined,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 150.0),
                  child: Text(
                    'عمو نقاش',
                    style: TextStyle(color: Colors.white, fontSize: 50),
                  ),
                ),
              ],
            ),
            //دکمه ی اضافه کردن تکست باک
            InkWell(
              onTap: () {
                showDialogAlert();
              },
              child: Container(
                margin: const EdgeInsets.only(left: 300, top: 10, bottom: 10),
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: kPurpleColor,
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  textFiledAdd(),
                  //دکمه برای محاسبه
                  Container(
                   height: 60,
                   margin: const EdgeInsets.symmetric(
                       horizontal: 100.0, vertical: 10),
                   child: Material(
                     color: kLightPurpleColor,
                     borderRadius: BorderRadius.circular(30),
                     child: InkWell(
                       onTap: () {
                         myNavigator();
                       },
                       borderRadius: BorderRadius.circular(30),
                       child: Container(
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(30),
                         ),
                         child: Stack(
                           children: [
                             Center(
                               child: Container(
                                   child: Lottie.asset(
                                 'assets/mylottiefile.json',
                                 height: 200,
                                 width: 200,
                                 fit: BoxFit.cover,
                               )),
                             ),
                             const Center(
                               child: Text(
                                 'محاسبه',
                                 style: TextStyle(
                                     color: Colors.white, fontSize: 40),
                               ),
                             ),
                           ],
                         ),
                       ),
                     ),
                   ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  myNavigator() {
    List<String> lst = dataSendData();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ResultScren(datasenddata: lst)));
    txtLitrControl.clear();
    txtMonyLitrControl.clear();
    txtMetrControl.clear();
    txtMonyMetrControl.clear();
    txtAddMony.clear();
    result = 0;
    addEgane = 0;
  }

  Widget textFiledAdd() {
    return Column(
      children: [
        //تکست باک پول هر متر
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          margin:
              const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(35),
          ),
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: txtMonyMetrControl,
            textAlign: TextAlign.right,
            style:
                const TextStyle(color: kBlackBackgroundColor, fontSize: 30),
            cursorColor: kBlackBackgroundColor,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'پول هر متر',
              hintStyle:
                  TextStyle(color: kBlackBackgroundColor, fontSize: 30),
            ),
          ),
        ),
        //تکست باکس متراژ
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          margin:
              const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(35),
          ),
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: txtMetrControl,
            textAlign: TextAlign.right,
            style:
                const TextStyle(color: kBlackBackgroundColor, fontSize: 30),
            cursorColor: kBlackBackgroundColor,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'متراژ',
              hintStyle:
                  TextStyle(color: kBlackBackgroundColor, fontSize: 30),
            ),
          ),
        ),
        //تکست باکس مقدار رنگ
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          margin:
              const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(35),
          ),
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: txtLitrControl,
            textAlign: TextAlign.right,
            style:
                const TextStyle(color: kBlackBackgroundColor, fontSize: 30),
            cursorColor: kBlackBackgroundColor,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'مقدار رنگ',
              hintStyle:
                  TextStyle(color: kBlackBackgroundColor, fontSize: 30),
            ),
          ),
        ),
        //تکست باکس پول هر لیتر رمگ
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          margin:
              const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(35),
          ),
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: txtMonyLitrControl,
            textAlign: TextAlign.right,
            style:
                const TextStyle(color: kBlackBackgroundColor, fontSize: 30),
            cursorColor: kBlackBackgroundColor,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'پول هر لیتر رنگ',
              hintStyle:
                  TextStyle(color: kBlackBackgroundColor, fontSize: 30),
            ),
          ),
        ),
      ],
    );
  }

  List<String> dataSendData() {
    String monyMeter = txtMonyMetrControl.text;
    String meter = txtMetrControl.text;
    String litr = txtLitrControl.text;
    String MonyLitr = txtMonyLitrControl.text;
    result += addEgane;
    result += int.parse(monyMeter) * int.parse(meter);
    result += int.parse(litr) * int.parse(MonyLitr);
    return [monyMeter, meter, litr, MonyLitr,addEgane.toString(), result.toString()];
  }

  showDialogAlert() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text(
            'مقادیر اضافه',
            style: TextStyle(color: kBlackBackgroundColor),
            textAlign: TextAlign.right,
          ),
          content: Center(
            child: TextFormField(
              controller: txtAddMony,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          actions: [
            Center(
              child: SizedBox(
                height: 50,
                width: 150,
                child: FlatButton(
                  onPressed: () {
                    addEgane += int.parse(txtAddMony.text);
                    txtAddMony.clear();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: kLightPurpleColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        'ثبت',
                        style: TextStyle(color: Colors.white,fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
