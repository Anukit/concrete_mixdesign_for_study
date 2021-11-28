import 'dart:ui';

import 'package:concrete_mixdesign_for_study/pages/tabbar_main.dart';
import 'package:concrete_mixdesign_for_study/widgets/totalwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Step1 extends StatelessWidget {
  Step1();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _MyPage(),
    );
  }
}

class _MyPage extends StatefulWidget {
  const _MyPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _MyPageState();
  }
}

class _MyPageState extends State<_MyPage> with AutomaticKeepAliveClientMixin {
  // ใส่เพื่อเมื่อสลับหน้า(Tab) ให้ใช้ข้อมูลเดิมที่เคยโหลดแล้ว ไม่ต้องโหลดใหม่
  @override
  bool get wantKeepAlive => true;
  String valuetest = "240";
  bool nexttab = false;
  final formKey = GlobalKey<FormState>();
  TextEditingController fc = TextEditingController();
  TextEditingController percent_comp = TextEditingController();
  TextEditingController s = TextEditingController();
  TextEditingController k = TextEditingController();
  TextEditingController fcr_value = TextEditingController();
  List<String> listStep1 = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Container(
                  margin: const EdgeInsets.all(8.0),
                  //color: Colors.amber,
                  child: Column(
                    children: [
                      const SizedBox(height: 10.0),
                      const Text(
                        "Step 1: กำลังอัดเป้าหมาย",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(height: 10.0),
                      const Text(
                        "\t\t\t\t\t\tในการออกแบบส่วนผสมคอนกรีต จะกำหนดกำลังอัดเป้าหมายให้มีค่าสูงกว่ากำลังอัดที่ต้องการ เป็นไปตามสมการ",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      fcrfull(),
                      const Divider(),
                      Row(
                        children: [
                          const Text(
                            "เมื่อ\t",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                          fcr(),
                          const Text(
                            " = กำลังอัดเป้าหมาย (Target Strength)",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        children: [
                          SizedBox(width: 28.0),
                          fshapc(),
                          const Text(
                            " = กำลังอัดที่ต้องการ (Required Strength)",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        children: const [
                          SizedBox(width: 28.0),
                          Expanded(
                            child: Text(
                              "s = ค่าเบี่ยงเบนมาตรฐานจากผลการทดสอบกำลังคอนกรีต",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                          )
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            "ตารางที่ 1 แฟกเตอร์ความน่าจะเป็น k",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ],
                      ),
                      Image.asset("assets/images/step1.jpg"),
                      Form(
                          key: formKey,
                          child: Container(
                            margin: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                build1(),
                                build2(),
                                build3(),
                                build4(),
                                build5(),
                                const SizedBox(height: 10.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    compute(),
                                    nexttab ? summitbt() : Container()
                                  ],
                                )
                              ],
                            ),
                          ))
                    ],
                  )))),
    );
  }

  Widget build1() {
    return Card(
      color: Colors.yellow.shade200,
      child: Row(
        children: [
          const SizedBox(width: 10.0),
          const Expanded(flex: 3, child: Text("ค่ากำลังอัดที่ต้องการ f'c")),
          Expanded(
              flex: 1,
              child: TextFormField(
                initialValue: "240",
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  //labelText: 'ชื่อ',
                  labelStyle:
                      TextStyle(fontSize: 18, color: Colors.grey.shade600),
                  errorStyle: const TextStyle(color: Colors.red, fontSize: 14),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(context, errorText: "กรอกค่า"),
                ]),
                onSaved: (value) {
                  fc.text = value!;
                },
              )),
          const SizedBox(width: 10.0),
          Expanded(flex: 1, child: kilogramCM2()),
        ],
      ),
    );
  }

  Widget build2() {
    return Card(
      color: Colors.yellow.shade200,
      child: Row(
        children: [
          const SizedBox(width: 10.0),
          const Expanded(flex: 3, child: Text("ร้อยละของกำลังอัดที่ต่ำกว่า")),
          Expanded(
              flex: 1,
              child: TextFormField(
                initialValue: "5",
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  //labelText: 'ชื่อ',
                  labelStyle:
                      TextStyle(fontSize: 18, color: Colors.grey.shade600),
                  errorStyle: const TextStyle(color: Colors.red, fontSize: 14),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(context, errorText: "กรอกค่า"),
                ]),
                onSaved: (value) {
                  percent_comp.text = value!;
                },
              )),
          const SizedBox(width: 10.0),
          const Expanded(
              flex: 1,
              child: Text(
                "%",
                style: TextStyle(fontSize: 20),
              )),
        ],
      ),
    );
  }

  Widget build3() {
    return Card(
      color: Colors.yellow.shade200,
      child: Row(
        children: [
          const SizedBox(width: 10.0),
          const Expanded(flex: 3, child: Text("ค่าเบี่ยงเบนมาตรฐาน s")),
          Expanded(
              flex: 1,
              child: TextFormField(
                initialValue: "10",
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  //labelText: 'ชื่อ',
                  labelStyle:
                      TextStyle(fontSize: 18, color: Colors.grey.shade600),
                  errorStyle: const TextStyle(color: Colors.red, fontSize: 14),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(context, errorText: "กรอกค่า"),
                ]),
                onSaved: (value) {
                  s.text = value!;
                },
              )),
          const SizedBox(width: 10.0),
          Expanded(flex: 1, child: kilogramCM2()),
        ],
      ),
    );
  }

  Widget build4() {
    return Card(
      color: Colors.yellow.shade200,
      child: Row(
        children: [
          const SizedBox(width: 10.0),
          const Expanded(flex: 3, child: Text("ค่าแฟกเตอร์ความน่าจะเป็น k")),
          Expanded(
              flex: 1,
              child: TextFormField(
                initialValue: "1.645",
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  //labelText: 'ชื่อ',
                  labelStyle:
                      TextStyle(fontSize: 18, color: Colors.grey.shade600),
                  errorStyle: const TextStyle(color: Colors.red, fontSize: 14),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(context, errorText: "กรอกค่า"),
                ]),
                onSaved: (value) {
                  k.text = value!;
                },
              )),
          const SizedBox(width: 10.0),
          Expanded(flex: 1, child: Container()),
        ],
      ),
    );
  }

  Widget build5() {
    return Card(
      color: Colors.yellow.shade200,
      child: Row(
        children: [
          const SizedBox(width: 10.0),
          Expanded(
              flex: 3,
              child: Row(
                children: [
                  const Text("กำลังอัดเป้าหมาย"),
                  const SizedBox(width: 10.0),
                  fcr()
                ],
              )),
          Expanded(
              flex: 1,
              child: TextFormField(
                controller: fcr_value,
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  //labelText: 'ชื่อ',
                  labelStyle:
                      TextStyle(fontSize: 18, color: Colors.grey.shade600),
                  errorStyle: const TextStyle(color: Colors.red, fontSize: 14),
                ),
                // validator: FormBuilderValidators.compose([
                //   FormBuilderValidators.required(context, errorText: "กรอกค่า"),
                // ]),
                onSaved: (value) {
                  valuetest = value!;
                },
              )),
          const SizedBox(width: 10.0),
          Expanded(flex: 1, child: kilogramCM2()),
        ],
      ),
    );
  }

  Widget compute() {
    return Container(
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade400,
        // border: Border.all(color: Colors.amber),
      ),
      child: MaterialButton(
        // padding: const EdgeInsets.all(5.0),
        child: Text(
          'Compute',
          style: TextStyle(
              fontSize: 17,
              color: Colors.grey.shade800,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        onPressed: () {
          formKey.currentState!.save();
          if (formKey.currentState!.validate()) {
            double fc_value = double.parse(fc.text);
            double s_value = double.parse(s.text);
            double k_value = double.parse(k.text);
            setState(() {
              fcr_value.text = (fc_value + (s_value * k_value)).toString();
              nexttab = true;
            });
            listStep1.clear();
            listStep1.add(fc.text);
            listStep1.add(percent_comp.text);
            listStep1.add(s.text);
            listStep1.add(k.text);
            listStep1.add(fcr_value.text);
            print("listStep1 = ${listStep1}");
            setValue();
          }
        },
      ),
    );
  }

  setValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("listStep1", listStep1);
    // List<String>? savedStrList = prefs.getStringList('listStep1');
    // print("savedStrList = ${savedStrList}");
  }

  Widget summitbt() {
    return Container(
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade400,
        // border: Border.all(color: Colors.amber),
      ),
      child: MaterialButton(
        // padding: const EdgeInsets.all(5.0),
        child: Text(
          'Submit',
          style: TextStyle(
              fontSize: 17,
              color: Colors.grey.shade800,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => TabbarMain(1)),
              (Route<dynamic> route) => false);
        },
      ),
    );
  }
}
