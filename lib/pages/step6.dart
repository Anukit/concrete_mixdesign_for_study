import 'package:concrete_mixdesign_for_study/pages/tabbar_main.dart';
import 'package:concrete_mixdesign_for_study/widgets/totalwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

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
  String step6_index1 = "";
  String step6_index2 = "";
  String step6_index3 = "";
  String step6_index4 = "";
  String step6_index5 = "";

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
      color: Colors.yellow.shade200,
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
                initialValue: "0.7",
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
      color: Colors.yellow.shade200,
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
                initialValue: "1",
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
      color: Colors.yellow.shade200,
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
                initialValue: "6",
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
      color: Colors.yellow.shade200,
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
                initialValue: "2",
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
            setState(() {
              nexttab = true;
            });
          }
        },
      ),
    );
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
              children: const [
                SizedBox(width: 10.0),
                Expanded(
                    flex: 12,
                    child: Text(
                        "น้ำที่ผิวมวลรวมละเอียด Ws = น้ำหนักทราย x (Ms - As)/100")),
                Expanded(flex: 2, child: Text("=")),
                Expanded(flex: 4, child: Text("0.001	kg"))
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: const [
                SizedBox(width: 10.0),
                Expanded(
                    flex: 12,
                    child: Text(
                        "น้ำที่ผิวมวลรวมหยาบ Wg = น้ำหนักหิน x (Mg - Ag)/100")),
                Expanded(flex: 2, child: Text("=")),
                Expanded(flex: 4, child: Text("0.001	kg"))
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: const [
                SizedBox(width: 10.0),
                Expanded(
                    flex: 12,
                    child: Text("ปริมาณน้ำที่ใช้จริง = 1 - 2565.2 - 2.1")),
                Expanded(flex: 2, child: Text("=")),
                Expanded(flex: 4, child: Text("0.001	kg"))
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: const [
                SizedBox(width: 10.0),
                Expanded(
                    flex: 12,
                    child: Text("ปรับแก้น้ำหนักมวลรวมละเอียด = 48400 x 1.06")),
                Expanded(flex: 2, child: Text("=")),
                Expanded(flex: 4, child: Text("0.001	kg"))
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: const [
                SizedBox(width: 10.0),
                Expanded(
                    flex: 12,
                    child: Text("ปรับแก้น้ำหนักมวลรวมหยาบ = 210 x 1.02")),
                Expanded(flex: 2, child: Text("=")),
                Expanded(flex: 4, child: Text("0.001	kg"))
              ],
            ),
            const SizedBox(height: 10.0),
          ],
        ));
  }
}
