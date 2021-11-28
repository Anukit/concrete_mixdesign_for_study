import 'package:concrete_mixdesign_for_study/pages/tabbar_main.dart';
import 'package:concrete_mixdesign_for_study/widgets/totalwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Step4 extends StatelessWidget {
  Step4();

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
  TextEditingController large_add = TextEditingController();
  TextEditingController fm_value = TextEditingController();
  TextEditingController ratio_add = TextEditingController();
  TextEditingController stone_value = TextEditingController();
  TextEditingController weight_dry = TextEditingController();
  List<String> listStep4 = [];
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
                        "Step 4: ปริมาณมวลรวมหยาบ",
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
                              "ตารางที่ 5 อัตราส่วนปริมาตรมวลรวมหยาบต่อปริมาตรคอนกรีต",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                          )
                        ],
                      ),
                      Image.asset("assets/images/step4.jpg"),
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
          const Expanded(
            flex: 3,
            child: Text("ขนาดใหญ่สุดของมวลรวมหยาบ"),
          ),
          Expanded(
              flex: 1,
              child: TextFormField(
                readOnly: true,
                initialValue: "20",
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
                  large_add.text = value!;
                },
              )),
          const SizedBox(width: 10.0),
          const Expanded(
              flex: 1,
              child: Text(
                "mm",
                style: TextStyle(fontSize: 17),
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
          const Expanded(
            flex: 3,
            child: Text("โมดูลัสความละเอียดของทราย F.M."),
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
                  fm_value.text = value!;
                },
              )),
          const SizedBox(width: 10.0),
          Expanded(flex: 1, child: Container()),
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
          const Expanded(flex: 3, child: Text("อัตราส่วนปริมาตรมวลรวมหยาบ")),
          Expanded(
              flex: 1,
              child: TextFormField(
                initialValue: "0.63",
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
                  ratio_add.text = value!;
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
      color: Colors.yellow.shade200,
      child: Row(
        children: [
          const SizedBox(width: 10.0),
          const Expanded(
              flex: 3, child: Text("หน่วยน้ำหนักหินแห้งกระทุ้งแน่น")),
          Expanded(
              flex: 1,
              child: TextFormField(
                initialValue: "1600",
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
                  stone_value.text = value!;
                },
              )),
          const SizedBox(width: 10.0),
          Expanded(flex: 1, child: kilogramM3()),
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
          const Expanded(flex: 3, child: Text("น้ำหนักมวลรวมหยาบแห้ง")),
          Expanded(
              flex: 1,
              child: TextFormField(
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
                  weight_dry.text = value!;
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
            });
            listStep4.clear();
            listStep4.add(large_add.text);
            listStep4.add(fm_value.text);
            listStep4.add(ratio_add.text);
            listStep4.add(stone_value.text);
            listStep4.add(weight_dry.text);
            print("listStep4 = ${listStep4}");
            setValue();
          }
        },
      ),
    );
  }

  setValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("listStep4", listStep4);
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
              MaterialPageRoute(builder: (context) => TabbarMain(4)),
              (Route<dynamic> route) => false);
        },
      ),
    );
  }
}
