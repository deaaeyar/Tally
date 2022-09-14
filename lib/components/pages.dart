import 'package:flutter/material.dart';
import '../main.dart';

class Pager extends StatefulWidget {
  const Pager({super.key});

  @override
  State<Pager> createState() => _PageState();
}
var valor = "A";
class _PageState extends State<Pager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        RichText(
            text: const TextSpan(
                text: "\tThis is Rich text.",
                style: TextStyle(color: Colors.red, fontSize: 20),
                children: [
              TextSpan(
                  text: "\n\tI don't know why it is used.",
                  style: TextStyle(color: Colors.green, fontSize: 20),
                  children: [
                    TextSpan(
                        text: "\n\tClueless as fuck.\n",
                        style: TextStyle(color: Colors.blue, fontSize: 20))
                  ])
            ])),
        ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Count()));
            },
            style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30)),
            child: const Text(
              "Back",
              style: TextStyle(fontSize: 20),
            )),
        TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: () {},
            child: const Text("This is FlatButtom.",
                style: TextStyle(color: Colors.white, fontSize: 20))),
        ElevatedButton(
            onPressed: () {},
            child: const Text("This is ElevatedButom.",
                style: TextStyle(color: Colors.white, fontSize: 20))),
        DropdownButton(
            value: valor,
            items: ["A","B","C","D"].map((String e){
              return DropdownMenuItem(
                value: e,
                child: Text(e));
            }).toList(),
            onChanged: (value){
              setState(() {
                valor = value.toString();
              });
            })
      ],
    )));
  }
}
