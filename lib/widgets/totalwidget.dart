import 'package:flutter/material.dart';

Widget fcrfull() {
  return RichText(
    text: TextSpan(
      style: TextStyle(color: Colors.black, fontSize: 20),
      children: [
        const TextSpan(
          text: "f",
        ),
        WidgetSpan(
          child: Transform.translate(
            offset: const Offset(0.0, 4.0),
            child: const Text(
              'cr',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ),
        const TextSpan(
          text: "\t=",
        ),
        const TextSpan(
          text: "\tf'",
        ),
        WidgetSpan(
          child: Transform.translate(
            offset: const Offset(0.0, 4.0),
            child: const Text(
              'c',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ),
        const TextSpan(
          text: "\t\t+\t\t",
        ),
        const TextSpan(
          text: "k\t\ts",
        ),
      ],
    ),
  );
}

Widget fcr() {
  return RichText(
    text: TextSpan(
      style: TextStyle(color: Colors.black, fontSize: 16),
      children: [
        const TextSpan(
          text: "f",
        ),
        WidgetSpan(
          child: Transform.translate(
            offset: const Offset(0.0, 4.0),
            child: const Text(
              'cr',
              style: TextStyle(fontSize: 11),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget fc() {
  return RichText(
    text: TextSpan(
      style: TextStyle(color: Colors.black, fontSize: 16),
      children: [
        const TextSpan(
          text: "kg/cm",
        ),
        WidgetSpan(
          child: Transform.translate(
            offset: const Offset(0.0, -10.0),
            child: const Text(
              '2',
              style: TextStyle(fontSize: 11),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget fshapc() {
  return RichText(
    text: TextSpan(
      style: TextStyle(color: Colors.black, fontSize: 16),
      children: [
        const TextSpan(
          text: "f'",
        ),
        WidgetSpan(
          child: Transform.translate(
            offset: const Offset(0.0, 4.0),
            child: const Text(
              'c',
              style: TextStyle(fontSize: 11),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget step6Var(String minuend, String subscript) {
  return RichText(
    text: TextSpan(
      style: TextStyle(color: Colors.black, fontSize: 16),
      children: [
        TextSpan(
          text: minuend,
        ),
        WidgetSpan(
          child: Transform.translate(
            offset: const Offset(0.0, 4.0),
            child: Text(
              subscript,
              style: const TextStyle(fontSize: 11),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget mmm3(String minuend, String subscript) {
  return RichText(
    text: TextSpan(
      style: TextStyle(color: Colors.black, fontSize: 16),
      children: [
        TextSpan(
          text: "\t"+minuend,
        ),
        WidgetSpan(
          child: Transform.translate(
            offset: const Offset(0.0, -10.0),
            child: Text(
              subscript,
              style: const TextStyle(fontSize: 11),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget kilogramCM2() {
  return RichText(
    text: TextSpan(
      style: TextStyle(color: Colors.black, fontSize: 16),
      children: [
        const TextSpan(
          text: "kg/cm",
        ),
        WidgetSpan(
          child: Transform.translate(
            offset: const Offset(0.0, -10.0),
            child: const Text(
              '2',
              style: TextStyle(fontSize: 11),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget kilogramM3() {
  return RichText(
    text: TextSpan(
      style: TextStyle(color: Colors.black, fontSize: 16),
      children: [
        const TextSpan(
          text: "kg/m",
        ),
        WidgetSpan(
          child: Transform.translate(
            offset: const Offset(0.0, -10.0),
            child: const Text(
              '3',
              style: TextStyle(fontSize: 11),
            ),
          ),
        ),
      ],
    ),
  );
}
