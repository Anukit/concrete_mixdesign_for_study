import 'package:concrete_mixdesign_for_study/pages/tabbar_main.dart';
import 'package:concrete_mixdesign_for_study/utility/total_utility.dart';
import 'package:concrete_mixdesign_for_study/widgets/totalwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Step5 extends StatelessWidget {
  Step5();

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
  TextEditingController cement_spec = TextEditingController();
  TextEditingController coarse_agg = TextEditingController();
  TextEditingController spec_gra = TextEditingController();
  List<String> listStep5 = [];
  String r1_volWater = "";
  String r2_volCem = "";
  String r3_bub2per = "";
  String r4_coaAgg = "";
  String r5_mixAll = "";
  String r6_restSand = "";
  String r7_wetSand = "";
  //ข้อมูลตารางอื่น
  String step2_amount_water = "";
  String step3_cement_qua_ = "";
  String step2_bubble = "";
  String step4_weight_dry = "";
  @override
  void initState() {
    super.initState();
    getListData();
  }

  getListData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedStrList2 = prefs.getStringList('listStep2')!;
    List<String> savedStrList3 = prefs.getStringList('listStep3')!;
    List<String> savedStrList4 = prefs.getStringList('listStep4')!;
    List<String> savedStrList5 = prefs.getStringList('listStep5')!;
    setState(() {
      step2_amount_water = savedStrList2[2];
      step3_cement_qua_ = savedStrList3[1];
      step2_bubble = savedStrList2[3];
      step4_weight_dry = savedStrList4[3];
      if (savedStrList5.isNotEmpty) {
        cement_spec.text = savedStrList5[0];
        coarse_agg.text = savedStrList5[1];
        spec_gra.text = savedStrList5[2];
      } else {
        cement_spec.text = "3.15";
        coarse_agg.text = "2.7";
        spec_gra.text = "2.65";
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
                        "Step 5: ปริมาณมวลรวมละเอียด",
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
          const Expanded(
            flex: 3,
            child: Text("ความถ่วงจำเพาะปูนซีเมนต์"),
          ),
          Expanded(
              flex: 1,
              child: TextFormField(
                controller: cement_spec,
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
                  cement_spec.text = value!;
                },
              )),
          const SizedBox(width: 10.0),
          Expanded(flex: 1, child: Container()),
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
          const Expanded(
            flex: 3,
            child: Text("ความถ่วงจำเพาะมวลรวมหยาบ"),
          ),
          Expanded(
              flex: 1,
              child: TextFormField(
                controller: coarse_agg,
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
                  coarse_agg.text = value!;
                },
              )),
          const SizedBox(width: 10.0),
          const Expanded(
              flex: 1,
              child: Text(
                "(อิ่มตัวผิวแห้ง)",
                style: TextStyle(fontSize: 17),
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
          const Expanded(flex: 3, child: Text("ความถ่วงจำเพาะมวลรวมละเอียด")),
          Expanded(
              flex: 1,
              child: TextFormField(
                controller: spec_gra,
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
                  spec_gra.text = value!;
                },
              )),
          const SizedBox(width: 10.0),
          const Expanded(
              flex: 1,
              child: Text(
                "(อิ่มตัวผิวแห้ง)",
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
            calData();
          }
        },
      ),
    );
  }

  calData() {
    setState(() {
      nexttab = true;
      r1_volWater =
          (double.parse(step2_amount_water) / 1000).toStringAsFixed(3);
      r2_volCem = (double.parse(step3_cement_qua_) /
              (double.parse(cement_spec.text) * 1000))
          .toStringAsFixed(3);
      r3_bub2per = (double.parse(step2_bubble) / 100).toString();
      r4_coaAgg = (double.parse(step4_weight_dry) /
              (double.parse(coarse_agg.text) * 1000))
          .toStringAsFixed(3);
      r5_mixAll = (double.parse(r1_volWater) +
              double.parse(r2_volCem) +
              double.parse(r3_bub2per) +
              double.parse(r4_coaAgg))
          .toStringAsFixed(3);
      r6_restSand = (1 - double.parse(r5_mixAll)).toStringAsFixed(3);
      r7_wetSand =
          (double.parse(r6_restSand) * double.parse(spec_gra.text) * 1000)
              .toStringAsFixed(0);
    });
    listStep5.clear();
    listStep5.add(cement_spec.text);
    listStep5.add(coarse_agg.text);
    listStep5.add(spec_gra.text);
    listStep5.add(r1_volWater);
    listStep5.add(r2_volCem);
    listStep5.add(r3_bub2per);
    listStep5.add(r4_coaAgg);
    listStep5.add(r5_mixAll);
    listStep5.add(r6_restSand);
    listStep5.add(r7_wetSand);
    print("listStep5 = ${listStep5}");
    setValue();
  }

  setValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("listStep5", listStep5);
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
              MaterialPageRoute(builder: (context) => TabbarMain(5)),
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
                Text("คำนวณปริมาณทราย:",
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const SizedBox(width: 10.0),
                Expanded(
                    flex: 12,
                    child: Text("ปริมาตรน้ำ = $step2_amount_water/1,000")),
                const Expanded(flex: 2, child: Text("=")),
                Expanded(
                    flex: 4,
                    child: Row(
                      children: [Text(r1_volWater), mmm3("m", "3")],
                    ))
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const SizedBox(width: 10.0),
                Expanded(
                    flex: 12,
                    child: Text(
                        "ปริมาตรปูนซีเมนต์ = $step3_cement_qua_ / (${cement_spec.text} x 1,000)")),
                const Expanded(flex: 2, child: Text("=")),
                Expanded(
                    flex: 4,
                    child: Row(
                      children: [Text(r2_volCem), mmm3("m", "3")],
                    ))
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const SizedBox(width: 10.0),
                Expanded(
                    flex: 12,
                    child: Text(
                        "ฟองอากาศร้อยละ $step2_bubble ในปริมาตรของคอนกรีต")),
                const Expanded(flex: 2, child: Text("=")),
                Expanded(
                    flex: 4,
                    child: Row(
                      children: [Text(r3_bub2per), mmm3("m", "3")],
                    ))
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const SizedBox(width: 10.0),
                Expanded(
                    flex: 12,
                    child: Text(
                        "มวลรวมหยาบ = $step4_weight_dry / (${coarse_agg.text} x 1,000)")),
                const Expanded(flex: 2, child: Text("=")),
                Expanded(
                    flex: 4,
                    child: Row(
                      children: [Text(r4_coaAgg), mmm3("m", "3")],
                    ))
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const SizedBox(width: 10.0),
                const Expanded(
                    flex: 12,
                    child: Text("รวมปริมาตรน้ำ+ซีเมนต์+ฟองอากาศ+มวลรวมหยาบ")),
                const Expanded(flex: 2, child: Text("=")),
                Expanded(
                    flex: 4,
                    child: Row(
                      children: [Text(r5_mixAll), mmm3("m", "3")],
                    ))
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const SizedBox(width: 10.0),
                Expanded(
                    flex: 12,
                    child: Text("ปริมาตรส่วนที่เหลือเป็นทราย = 1-$r5_mixAll")),
                const Expanded(flex: 2, child: Text("=")),
                Expanded(
                    flex: 4,
                    child: Row(
                      children: [Text(r6_restSand), mmm3("m", "3")],
                    ))
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const SizedBox(width: 10.0),
                Expanded(
                    flex: 12,
                    child: Text(
                        "น้ำหนักของทราย = $r6_restSand x ${spec_gra.text} x 1,000")),
                const Expanded(flex: 2, child: Text("=")),
                Expanded(
                    flex: 4,
                    child: Row(
                      children: [Text(r7_wetSand), Text("\tkg")],
                    ))
              ],
            ),
            const SizedBox(height: 10.0),
          ],
        ));
  }
}
