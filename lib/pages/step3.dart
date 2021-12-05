import 'package:concrete_mixdesign_for_study/pages/tabbar_main.dart';
import 'package:concrete_mixdesign_for_study/widgets/totalwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Step3 extends StatelessWidget {
  Step3();

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
  TextEditingController fcr_value = TextEditingController();
  TextEditingController ratio_waterCem = TextEditingController();
  TextEditingController cement_qua = TextEditingController();
  List<String> listStep3 = [];
  String amount_water_Step2 = "";
  @override
  void initState() {
    super.initState();
    getListData();
  }

  getListData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedStrList1 = prefs.getStringList('listStep1')!;
    List<String> savedStrList2 = prefs.getStringList('listStep2')!;
    List<String> savedStrList3 = prefs.getStringList('listStep3')!;
    setState(() {
      fcr_value.text = savedStrList1[4];
      amount_water_Step2 = savedStrList2[2];
      if (savedStrList3.isNotEmpty) {
        ratio_waterCem.text = savedStrList3[0];
        cement_qua.text = savedStrList3[1];
      } else {
        ratio_waterCem.text = "0.56";
        cement_qua.text = "";
      }
    });
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
                        "Step 3: ปริมาณปูนซีเมนต์",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Expanded(
                            child: Text(
                              "ตารางที่ 4 ความสัมพันธ์ระหว่างอัตราส่วนน้ำต่อซีเมนต์และกำลังอัดคอนกรีต",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                          )
                        ],
                      ),
                      Image.asset("assets/images/step3.jpg"),
                      const Divider(),
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
      color: Colors.blue[100],
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
                readOnly: true,
                controller: fcr_value,
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
                // onSaved: (value) {
                //   fcr_value.text = value!;
                // },
              )),
          const SizedBox(width: 10.0),
          Expanded(flex: 1, child: kilogramCM2()),
        ],
      ),
    );
  }

  Widget build2() {
    return Card(
      color: Colors.blue[100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          SizedBox(width: 10.0),
          Expanded(
            child: Text("ไม่มีสารกระจายกักฟองอากาศ	"),
          )
        ],
      ),
    );
  }

  Widget build3() {
    return Card(
      color: Colors.blue[100],
      child: Row(
        children: [
          const SizedBox(width: 10.0),
          const Expanded(flex: 3, child: Text("เลือกอัตราส่วนน้ำต่อซีเมนต์")),
          Expanded(
              flex: 1,
              child: TextFormField(
                controller: ratio_waterCem,
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
                  ratio_waterCem.text = value!;
                },
              )),
          const SizedBox(width: 10.0),
          Expanded(flex: 1, child: Container()),
        ],
      ),
    );
  }

  Widget build4() {
    return Card(
      color: Colors.blue[100],
      child: Row(
        children: [
          const SizedBox(width: 10.0),
          const Expanded(flex: 3, child: Text("ปริมาณซีเมนต์")),
          Expanded(
              flex: 1,
              child: TextFormField(
                controller: cement_qua,
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
                  cement_qua.text = value!;
                },
              )),
          const SizedBox(width: 10.0),
          const Expanded(
              flex: 1,
              child: Text(
                "kg",
                style: TextStyle(fontSize: 17),
              )),
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
            setState(() {
              nexttab = true;
              cement_qua.text = (double.parse(amount_water_Step2) /
                      double.parse(ratio_waterCem.text))
                  .toStringAsFixed(0);
            });
            listStep3.clear();
            listStep3.add(ratio_waterCem.text);
            listStep3.add(cement_qua.text);
            print("listStep3 = ${listStep3}");
            setValue();
          }
        },
      ),
    );
  }

  setValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("listStep3", listStep3);
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
              MaterialPageRoute(builder: (context) => TabbarMain(3)),
              (Route<dynamic> route) => false);
        },
      ),
    );
  }
}
