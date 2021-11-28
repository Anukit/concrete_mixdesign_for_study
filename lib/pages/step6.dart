import 'package:concrete_mixdesign_for_study/pages/tabbar_main.dart';
import 'package:concrete_mixdesign_for_study/widgets/totalwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Step6 extends StatelessWidget {
  Step6();

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
  TextEditingController as_value = TextEditingController();
  TextEditingController ag_value = TextEditingController();
  TextEditingController ms_value = TextEditingController();
  TextEditingController mg_value = TextEditingController();
  String r1_waterFine = "";
  String r2_waterCoarse = "";
  String r3_actWater = "";
  String r4_fineTune = "";
  String r41_fineTune = ""; //ปรับแก้น้ำหนักละเอียดตรง 1.06
  String r5_coarseTune = "";
  String r51_coarseTune = ""; //ปรับแก้น้ำหนักหยาบตรง 1.02
  //ข้อมูลตารางอื่น
  String step5_wetSand = "";
  String step4_weight_dry = "";
  String step2_amount_water = "";
  // String step5_wetSand = "";
  // String step4_weight_dry = "";
  List<String> listStep6 = [];

  @override
  void initState() {
    super.initState();
    getListData();
  }

  getListData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedStrList2 = prefs.getStringList('listStep2')!;
    List<String> savedStrList4 = prefs.getStringList('listStep4')!;
    List<String> savedStrList5 = prefs.getStringList('listStep5')!;
    List<String> savedStrList6 = prefs.getStringList('listStep6')!;
    setState(() {
      print("savedStrList6 = ${savedStrList6}");
      step5_wetSand = savedStrList5[9];
      step4_weight_dry = savedStrList4[3];
      step2_amount_water = savedStrList2[2];
      if (savedStrList6.isNotEmpty) {
        as_value.text = savedStrList6[0];
        ag_value.text = savedStrList6[1];
        ms_value.text = savedStrList6[2];
        mg_value.text = savedStrList6[3];
      } else {
        as_value.text = "0.7";
        ag_value.text = "1";
        ms_value.text = "6";
        mg_value.text = "2";
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
                        "Step 6: การปรับส่วนผสมเนื่องจากความชื้น",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
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
                                    nexttab ? summitbt() : Container(),
                                  ],
                                ),
                                const SizedBox(height: 10.0),
                                nexttab ? displayCompute() : Container()
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
                  const Expanded(
                    flex: 2,
                    child: Text("ค่าการดูดซึมของมวลรวมละเอียด"),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(flex: 1, child: step6Var("A", "s"))
                ],
              )),
          Expanded(
              flex: 1,
              child: TextFormField(
                controller: as_value,
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
                  as_value.text = value!;
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

  Widget build2() {
    return Card(
      color: Colors.blue[100],
      child: Row(
        children: [
          const SizedBox(width: 10.0),
          Expanded(
              flex: 3,
              child: Row(
                children: [
                  const Expanded(
                    flex: 2,
                    child: Text("ค่าการดูดซึมของมวลหยาบ"),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(flex: 1, child: step6Var("A", "g"))
                ],
              )),
          Expanded(
              flex: 1,
              child: TextFormField(
                controller: ag_value,
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
                  ag_value.text = value!;
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
      color: Colors.blue[100],
      child: Row(
        children: [
          const SizedBox(width: 10.0),
          Expanded(
              flex: 3,
              child: Row(
                children: [
                  const Expanded(
                    flex: 2,
                    child: Text("ความชื้นในมวลรวมหยาบ"),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(flex: 1, child: step6Var("M", "s"))
                ],
              )),
          Expanded(
              flex: 1,
              child: TextFormField(
                controller: ms_value,
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
                  ms_value.text = value!;
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

  Widget build4() {
    return Card(
      color: Colors.blue[100],
      child: Row(
        children: [
          const SizedBox(width: 10.0),
          Expanded(
              flex: 3,
              child: Row(
                children: [
                  const Expanded(
                    flex: 2,
                    child: Text("ความชื้นในมวลรวมละเอียด"),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(flex: 1, child: step6Var("M", "g"))
                ],
              )),
          Expanded(
              flex: 1,
              child: TextFormField(
                controller: mg_value,
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
                  mg_value.text = value!;
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
            calData();
          }
        },
      ),
    );
  }

  calData() {
    setState(() {
      nexttab = true;
      r1_waterFine = (double.parse(step5_wetSand) *
              (double.parse(ms_value.text) - double.parse(as_value.text)) /
              100)
          .toStringAsFixed(1);
      r2_waterCoarse = (double.parse(step4_weight_dry) *
              (double.parse(mg_value.text) - double.parse(ag_value.text)) /
              100)
          .toStringAsFixed(1);
      r3_actWater = (double.parse(step2_amount_water) -
              double.parse(r1_waterFine) -
              double.parse(r2_waterCoarse))
          .toStringAsFixed(0);
      r41_fineTune =
          (1 + (double.parse(ms_value.text) / 100)).toStringAsFixed(2);
      r4_fineTune = (double.parse(step5_wetSand) * double.parse(r41_fineTune))
          .toStringAsFixed(0);
      r51_coarseTune =
          (1 + (double.parse(mg_value.text) / 100)).toStringAsFixed(2);
      r5_coarseTune =
          (double.parse(step4_weight_dry) * double.parse(r51_coarseTune))
              .toStringAsFixed(0);
    });
    listStep6.clear();
    listStep6.add(as_value.text);
    listStep6.add(ag_value.text);
    listStep6.add(ms_value.text);
    listStep6.add(mg_value.text);
    listStep6.add(r1_waterFine);
    listStep6.add(r2_waterCoarse);
    listStep6.add(r3_actWater);
    listStep6.add(r4_fineTune);
    listStep6.add(r5_coarseTune);
    print("listStep6 = ${listStep6}");
    setValue();
  }

  setValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("listStep6", listStep6);
    // List<String>? savedStrList = prefs.getStringList('listStep3');
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
              MaterialPageRoute(builder: (context) => TabbarMain(6)),
              (Route<dynamic> route) => false);
        },
      ),
    );
  }

  Widget displayCompute() {
    return Container(
        color: Colors.grey.shade200,
        margin: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: const [
                Text("ปรับปริมาณวัสดุเนื่องจากความชื้น:",
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const SizedBox(width: 10.0),
                const Expanded(
                    flex: 12,
                    child: Text(
                        "น้ำที่ผิวมวลรวมละเอียด Ws = น้ำหนักทราย x (Ms - As)/100")),
                const Expanded(flex: 2, child: Text("=")),
                Expanded(flex: 4, child: Text("$r1_waterFine	kg"))
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const SizedBox(width: 10.0),
                const Expanded(
                    flex: 12,
                    child: Text(
                        "น้ำที่ผิวมวลรวมหยาบ Wg = น้ำหนักหิน x (Mg - Ag)/100")),
                const Expanded(flex: 2, child: Text("=")),
                Expanded(flex: 4, child: Text("$r2_waterCoarse	kg"))
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const SizedBox(width: 10.0),
                Expanded(
                    flex: 12,
                    child: Text(
                        "ปริมาณน้ำที่ใช้จริง = $step2_amount_water - $r1_waterFine - $r2_waterCoarse")),
                const Expanded(flex: 2, child: Text("=")),
                Expanded(flex: 4, child: Text("$r3_actWater	kg"))
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                SizedBox(width: 10.0),
                Expanded(
                    flex: 12,
                    child: Text(
                        "ปรับแก้น้ำหนักมวลรวมละเอียด = $step5_wetSand x $r41_fineTune")),
                const Expanded(flex: 2, child: Text("=")),
                Expanded(flex: 4, child: Text("$r4_fineTune	kg"))
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const SizedBox(width: 10.0),
                Expanded(
                    flex: 12,
                    child: Text(
                        "ปรับแก้น้ำหนักมวลรวมหยาบ = $step4_weight_dry x $r51_coarseTune")),
                const Expanded(flex: 2, child: Text("=")),
                Expanded(flex: 4, child: Text("$r5_coarseTune	kg"))
              ],
            ),
            const SizedBox(height: 10.0),
          ],
        ));
  }
}
