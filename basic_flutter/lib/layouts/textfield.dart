// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class TextFieldExample extends StatelessWidget {
  const TextFieldExample({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView(
      children: [
        SizedBox(
          height: 60,
        ),
        TextField(),
        SizedBox(
          height: 32,
        ),
        TextField(),
        SizedBox(
          height: 32,
        ),
        TextField(
          decoration: InputDecoration(hintText: "Introduce tu email"),
        ),
        SizedBox(
          height: 32,
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
                hintText: "Introduce tu email", border: OutlineInputBorder()),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
                hintText: "Introduce tu email",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder()),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
                hintText: "Introduce tu contraseña",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder()),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            maxLines: 1,
            maxLength: 10,
            decoration: InputDecoration(
                hintText: "Introduce tu comentario",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder()),
          ),
        ),
        SizedBox(
          height: 32,
        )
      ],
    );
  }
}
