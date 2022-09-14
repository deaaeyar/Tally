import 'package:flutter/material.dart';
import 'components/components.dart';
import './components/pages.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const Count(),
    // routes: {
    //   '/':(context) => const Count(),
    //   '/second':(context) => Page(),
    // },
    theme: ThemeData(primarySwatch: Colors.indigo),
  ));
}

class Count extends StatefulWidget {
  const Count({super.key});
  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  var result = 0;
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldState,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Current number is",
            style: TextStyle(
                fontSize: 30, color: Colors.black87,fontWeight: FontWeight.bold,
                letterSpacing: 3,wordSpacing: 3,
                shadows: [
                  Shadow(color: Colors.black,offset: Offset(0.0, 20.0),blurRadius: 20)
                ]),
          ),
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.indigo,
                border: Border.all(width: 4, color: Colors.black87),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black,
                      offset: Offset(0.0, 20.0),
                      blurRadius: 20)
                ]),
            child: Text(
              "$result",
              style: const TextStyle(
                fontSize: 40, color: Colors.white),
            ),
          ),
          const SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.red[900],
                    borderRadius: BorderRadius.circular(10)),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (result > 0) {
                        result = result - 1;
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Why count below zero!!")));
                      }
                    });
                  },
                  icon: const Icon(Icons.remove),
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 150,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green[900]),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      result = result + 1;
                    });
                  },
                  icon: const Icon(Icons.add),
                  color: Colors.white,
                ),
              )
            ],
          ),
          const SizedBox(height: 100),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  result = 0;
                });
              },
              child: const Text(
                "Reset",
                style: TextStyle(fontSize: 30),
              )),
          const SizedBox(height: 50,),
          Row(
            children: [
              Components.getContainer("One", screen),
              Components.getContainer("Two", screen,bdr: false),
              Components.getContainer("Three", screen),
            ]
          ),
          const SizedBox(height: 20,),
          ElevatedButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const Pager()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green[900],
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30)
          ),
          child: const Text(
            "Next Page",
            style: TextStyle(
              fontSize: 20,
            ),
          ))
        ]),
      ),
    );
  }
}
