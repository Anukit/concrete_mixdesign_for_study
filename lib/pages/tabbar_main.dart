import 'package:concrete_mixdesign_for_study/pages/step1.dart';
import 'package:concrete_mixdesign_for_study/pages/step2.dart';
import 'package:concrete_mixdesign_for_study/pages/step3.dart';
import 'package:concrete_mixdesign_for_study/pages/step4.dart';
import 'package:concrete_mixdesign_for_study/pages/step5.dart';
import 'package:concrete_mixdesign_for_study/pages/step6.dart';
import 'package:concrete_mixdesign_for_study/pages/step7.dart';
import 'package:concrete_mixdesign_for_study/widgets/splash.dart';
import 'package:flutter/material.dart';

class TabbarMain extends StatefulWidget {
  int index;
  TabbarMain(this.index, {Key? key}) : super(key: key);

  @override
  _TabbarMainState createState() => _TabbarMainState();
}

class _TabbarMainState extends State<TabbarMain>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  int checkIndex = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 7, vsync: this);
    controller.index = widget.index;
    checkIndex = widget.index;
    print("controller.index = ${controller.index}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        title: Column(
          children: [
            const SizedBox(height: 30.0),
            Text(
              'Concrete mixdesign for study',
              style: TextStyle(
                color: Colors.green[100],
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5.0),
            Text(
              '*หมายเหตุ เริ่มที่ Step 1 จนถึง 7 ไม่สามารถข้าม Step ได้',
              style: TextStyle(color: Colors.grey.shade400, fontSize: 13),
            ),
            // const SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Step',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => SplashPage()),
                          (Route<dynamic> route) => false);
                    },
                    child: const Text(
                      "Reset",
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ))
              ],
            )
          ],
        ),
        bottom: TabBar(
          onTap: (index) {
            if (index > checkIndex) {
              controller.index = checkIndex;
            }
          },
          labelColor: const Color(0xffffffff),
          unselectedLabelColor: const Color(0x55ffffff),
          tabs: const <Tab>[
            Tab(text: '1'),
            Tab(text: '2'),
            Tab(text: '3'),
            Tab(text: '4'),
            Tab(text: '5'),
            Tab(text: '6'),
            Tab(text: '7'),
          ],
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          controller: controller,
        ),
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Step1(),
          Step2(),
          Step3(),
          Step4(),
          Step5(),
          Step6(),
          Step7(),
        ],
        controller: controller,
      ),
    );
  }
}
