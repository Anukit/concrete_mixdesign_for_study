import 'package:concrete_mixdesign_for_study/pages/tabbar_main.dart';
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
  String step5_index1 = "";
  String step5_index2 = "";
  String step5_index3 = "";
  String step5_index4 = "";
  String step5_index5 = "";
  String step5_index6 = "";
  String step5_index7 = "";
  @override
  void initState() {
    super.initState();
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
      color: Colors.yellow.shade200,
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
                initialValue: "3.15",
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
      color: Colors.yellow.shade200,
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
                initialValue: "2.7",
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
      color: Colors.yellow.shade200,
      child: Row(
        children: [
          const SizedBox(width: 10.0),
          const Expanded(flex: 3, child: Text("ความถ่วงจำเพาะมวลรวมละเอียด")),
          Expanded(
              flex: 1,
              child: TextFormField(
                initialValue: "2.65",
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
            setState(() {
              nexttab = true;
            });
            listStep5.clear();
            listStep5.add(cement_spec.text);
            listStep5.add(coarse_agg.text);
            listStep5.add(spec_gra.text);
            print("listStep5 = ${listStep5}");
            setValue();
          }
        },
      ),
    );
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
                const Expanded(flex: 12, child: Text("ปริมาตรน้ำ = 1/1,000")),
                const Expanded(flex: 2, child: Text("=")),
                Expanded(
                    flex: 4,
                    child: Row(
                      children: [const Text("0.001"), mmm3("m", "3")],
                    ))
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const SizedBox(width: 10.0),
                const Expanded(
                    flex: 12, child: Text("ปริมาตรปูนซีเมนต์ = 1/1,000")),
                const Expanded(flex: 2, child: Text("=")),
                Expanded(
                    flex: 4,
                    child: Row(
                      children: [const Text("0.001"), mmm3("m", "3")],
                    ))
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const SizedBox(width: 10.0),
                const Expanded(
                    flex: 12,
                    child: Text("ฟองอากาศร้อยละ 2 ในปริมาตรของคอนกรีต")),
                const Expanded(flex: 2, child: Text("=")),
                Expanded(
                    flex: 4,
                    child: Row(
                      children: [const Text("0.001"), mmm3("m", "3")],
                    ))
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const SizedBox(width: 10.0),
                const Expanded(flex: 12, child: Text("มวลรวมหยาบ = 1/1,000")),
                const Expanded(flex: 2, child: Text("=")),
                Expanded(
                    flex: 4,
                    child: Row(
                      children: [const Text("0.001"), mmm3("m", "3")],
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
                      children: [const Text("0.001"), mmm3("m", "3")],
                    ))
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const SizedBox(width: 10.0),
                const Expanded(
                    flex: 12,
                    child: Text("ปริมาตรส่วนที่เหลือเป็นทราย = 1/1,000")),
                const Expanded(flex: 2, child: Text("=")),
                Expanded(
                    flex: 4,
                    child: Row(
                      children: [const Text("0.001"), mmm3("m", "3")],
                    ))
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const SizedBox(width: 10.0),
                const Expanded(
                    flex: 12, child: Text("น้ำหนักของทราย = 1/1,000")),
                const Expanded(flex: 2, child: Text("=")),
                Expanded(
                    flex: 4,
                    child: Row(
                      children: const [Text("0.001"), Text("\tkg")],
                    ))
              ],
            ),
            const SizedBox(height: 10.0),
          ],
        ));
  }
}
