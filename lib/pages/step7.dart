import 'dart:ffi';

import 'package:concrete_mixdesign_for_study/widgets/totalwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class Step7 extends StatelessWidget {
  Step7();

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
  TextEditingController cement_value = TextEditingController();
  TextEditingController water_value = TextEditingController();
  TextEditingController sand_value = TextEditingController();
  TextEditingController rock_value = TextEditingController();
  TextEditingController total_weight = TextEditingController();
  TextEditingController mix_concrete = TextEditingController();
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
                        "Step 7: สรุปส่วนผสมคอนกรีต",
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "ส่วนผสมสำหรับคอนกรีต 1 ลบ.ม.",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ],
                                ),
                                build1(),
                                build2(),
                                build3(),
                                build4(),
                                build5(),
                                const SizedBox(height: 10.0),
                                buildinput(),
                                compute(),
                                const SizedBox(height: 10.0),
                                nexttab
                                    ? Column(
                                        children: [
                                          build1New(),
                                          build2New(),
                                          build3New(),
                                          build4New(),
                                          build5New(),
                                        ],
                                      )
                                    : Container()
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
            child: Text(
              "ปูนซีเมนต์",
              style: TextStyle(fontSize: 15),
            ),
          ),
          Expanded(
              flex: 1,
              child: TextFormField(
                readOnly: true,
                initialValue: "303",
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
                  cement_value.text = value!;
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

  Widget build2() {
    return Card(
      color: Colors.yellow.shade200,
      child: Row(
        children: [
          const SizedBox(width: 10.0),
          const Expanded(
            flex: 3,
            child: Text(
              "น้ำ",
              style: TextStyle(fontSize: 15),
            ),
          ),
          Expanded(
              flex: 1,
              child: TextFormField(
                readOnly: true,
                initialValue: "109",
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
                  water_value.text = value!;
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

  Widget build3() {
    return Card(
      color: Colors.yellow.shade200,
      child: Row(
        children: [
          const SizedBox(width: 10.0),
          const Expanded(
            flex: 3,
            child: Text(
              "ทราย",
              style: TextStyle(fontSize: 15),
            ),
          ),
          Expanded(
              flex: 1,
              child: TextFormField(
                readOnly: true,
                initialValue: "916",
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
                  sand_value.text = value!;
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

  Widget build4() {
    return Card(
      color: Colors.yellow.shade200,
      child: Row(
        children: [
          const SizedBox(width: 10.0),
          const Expanded(
            flex: 3,
            child: Text(
              "หิน",
              style: TextStyle(fontSize: 15),
            ),
          ),
          Expanded(
              flex: 1,
              child: TextFormField(
                readOnly: true,
                initialValue: "1028",
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
                  rock_value.text = value!;
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

  Widget build5() {
    return Card(
      color: Colors.yellow.shade200,
      child: Row(
        children: [
          const SizedBox(width: 10.0),
          const Expanded(
            flex: 3,
            child: Text(
              "รวมน้ำหนักทั้งหมด",
              style: TextStyle(fontSize: 15),
            ),
          ),
          Expanded(
              flex: 1,
              child: TextFormField(
                readOnly: true,
                initialValue: "2376",
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
                  total_weight.text = value!;
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

  Widget build1New() {
    return Card(
      color: Colors.yellow.shade200,
      child: Row(
        children: [
          const SizedBox(width: 10.0),
          const Expanded(
            flex: 3,
            child: Text(
              "ปูนซีเมนต์",
              style: TextStyle(fontSize: 15),
            ),
          ),
          Expanded(
              flex: 1,
              child: TextFormField(
                readOnly: true,
                controller: cement_value,
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
                  // valuetest = value!;
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

  Widget build2New() {
    return Card(
      color: Colors.yellow.shade200,
      child: Row(
        children: [
          const SizedBox(width: 10.0),
          const Expanded(
            flex: 3,
            child: Text(
              "น้ำ",
              style: TextStyle(fontSize: 15),
            ),
          ),
          Expanded(
              flex: 1,
              child: TextFormField(
                readOnly: true,
                controller: water_value,
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
                  //valuetest = value!;
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

  Widget build3New() {
    return Card(
      color: Colors.yellow.shade200,
      child: Row(
        children: [
          const SizedBox(width: 10.0),
          const Expanded(
            flex: 3,
            child: Text(
              "ทราย",
              style: TextStyle(fontSize: 15),
            ),
          ),
          Expanded(
              flex: 1,
              child: TextFormField(
                readOnly: true,
                controller: sand_value,
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
                  //valuetest = value!;
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

  Widget build4New() {
    return Card(
      color: Colors.yellow.shade200,
      child: Row(
        children: [
          const SizedBox(width: 10.0),
          const Expanded(
            flex: 3,
            child: Text(
              "หิน",
              style: TextStyle(fontSize: 15),
            ),
          ),
          Expanded(
              flex: 1,
              child: TextFormField(
                readOnly: true,
                controller: rock_value,
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
                  //valuetest = value!;
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

  Widget build5New() {
    return Card(
      color: Colors.yellow.shade200,
      child: Row(
        children: [
          const SizedBox(width: 10.0),
          const Expanded(
            flex: 3,
            child: Text(
              "รวมน้ำหนักทั้งหมด",
              style: TextStyle(fontSize: 15),
            ),
          ),
          Expanded(
              flex: 1,
              child: TextFormField(
                readOnly: true,
                controller: total_weight,
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
                  //valuetest = value!;
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

  Widget buildinput() {
    return Card(
      color: Colors.grey.shade200,
      child: Row(
        children: [
          const SizedBox(width: 10.0),
          const Expanded(
            flex: 3,
            child: Text(
              "ส่วนผสมสำหรับคอนกรีต",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
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
                  mix_concrete.text = value!;
                },
              )),
          const SizedBox(width: 10.0),
          const Expanded(
              flex: 1,
              child: Text(
                "ลบ.ม.",
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
              double mix = double.parse(mix_concrete.text);
              cement_value.text =
                  (double.parse(cement_value.text) * mix).toStringAsFixed(2);
              water_value.text = (double.parse(water_value.text) * mix).toStringAsFixed(2);
              sand_value.text = (double.parse(sand_value.text) * mix).toStringAsFixed(2);
              rock_value.text = (double.parse(rock_value.text) * mix).toStringAsFixed(2);
              total_weight.text =
                  (double.parse(total_weight.text) * mix).toStringAsFixed(2);
            });
          }
        },
      ),
    );
  }
}
