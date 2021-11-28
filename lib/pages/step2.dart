import 'package:concrete_mixdesign_for_study/pages/tabbar_main.dart';
import 'package:concrete_mixdesign_for_study/widgets/totalwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Step2 extends StatelessWidget {
  Step2();

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
  TextEditingController slump = TextEditingController();
  TextEditingController maxofAdd = TextEditingController();
  TextEditingController amount_water = TextEditingController();
  TextEditingController bubble = TextEditingController();
  List<String> listStep2 = [];

  @override
  void initState() {
    super.initState();
    getListData();
  }

  getListData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedStrList = prefs.getStringList('listStep2')!;
    print("listStep2 = ${listStep2}");
    setState(() {
      if (savedStrList.isNotEmpty) {
        slump.text = savedStrList[0];
        maxofAdd.text = savedStrList[1];
        amount_water.text = savedStrList[2];
        bubble.text = savedStrList[3];
      } else {
        slump.text = "8";
        maxofAdd.text = "20";
        amount_water.text = "200";
        bubble.text = "2";
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
                        "Step 2: ค่าการยุบตัว และ ขนาดมวลรวมหยาบ",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            "ตารางที่ 2 ค่าการยุบตัวของคอนกรีต",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ],
                      ),
                      Image.asset("assets/images/step2.1.jpg"),
                      const Divider(),
                      const Text(
                        "ตารางที่ 3 ปริมาณน้ำและฟองอากาศสำหรับค่าการยุบตัวและขนาดใหญ่สุดของมลรวมหยาบ",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      Image.asset("assets/images/step2.2.jpg"),
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
                                summitbt()
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
          const Expanded(flex: 3, child: Text("ค่าการยุบตัว (Slump)")),
          Expanded(
              flex: 1,
              child: TextFormField(
                controller: slump,
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
                  slump.text = value!;
                },
              )),
          const SizedBox(width: 10.0),
          const Expanded(
              flex: 1,
              child: Text(
                "cm",
                style: TextStyle(fontSize: 17),
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
          const Expanded(flex: 3, child: Text("ขนาดใหญ่สุดของมวลรวม")),
          Expanded(
              flex: 1,
              child: TextFormField(
                controller: maxofAdd,
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
                  maxofAdd.text = value!;
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

  Widget build3() {
    return Card(
      color: Colors.blue[100],
      child: Row(
        children: [
          const SizedBox(width: 10.0),
          const Expanded(flex: 3, child: Text("ปริมาณน้ำ")),
          Expanded(
              flex: 1,
              child: TextFormField(
                controller: amount_water,
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
                  amount_water.text = value!;
                },
              )),
          const SizedBox(width: 10.0),
          Expanded(flex: 1, child: kilogramM3()),
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
          const Expanded(flex: 3, child: Text("ปริมาณฟองอากาศ")),
          Expanded(
              flex: 1,
              child: TextFormField(
                controller: bubble,
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
                  bubble.text = value!;
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

  setValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var result = await prefs.setStringList("listStep2", listStep2);
    if (result) {
      return true;
    } else {
      return false;
    }
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
        onPressed: () async {
          formKey.currentState!.save();
          if (formKey.currentState!.validate()) {
            listStep2.clear();
            listStep2.add(slump.text);
            listStep2.add(maxofAdd.text);
            listStep2.add(amount_water.text);
            listStep2.add(bubble.text);
            print("listStep2 = ${listStep2}");
            var result = await setValue();
            if (result) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => TabbarMain(2)),
                  (Route<dynamic> route) => false);
            }
          }
        },
      ),
    );
  }
}
