import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController numa = TextEditingController();
  TextEditingController numb = TextEditingController();
  TextEditingController numc = TextEditingController();
  double montlypay = 0.0, totalpay = 0.0;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Loan Calculator")
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Loan Amount: ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Flexible(child: TextField(
                  controller: numa,
                  decoration: (const InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25)))
                  )),
                  keyboardType: const TextInputType.numberWithOptions(),
                ))
              ],
            ),
            const SizedBox(height: 10),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Term (Year):   ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Flexible(child: TextField(
                  controller: numb,
                  decoration: (const InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25)))
                  )),
                  keyboardType: const TextInputType.numberWithOptions(),
                ))
              ],
            ),
            const SizedBox(height: 10),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Interest Rate: ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Flexible(child: TextField(
                  controller: numc,
                  decoration: (const InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25)))
                  )),
                  keyboardType: const TextInputType.numberWithOptions(),
                ))
              ],
            ),


            const SizedBox(height: 12,),  

            SizedBox(      
              width: 327,
              height: 50,
              child: ElevatedButton(
                onPressed: onPressed,
                child: const Text("Calculate")),
            ),

            const SizedBox(height: 20,),

            Row(
              mainAxisAlignment:MainAxisAlignment.start,
              children: [
            const Text(
              "Montly payment: ",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              montlypay.toStringAsFixed(2),
              style: const TextStyle(fontSize: 20),
            )
            ]
            ),
            Row(
              mainAxisAlignment:MainAxisAlignment.start,
              children: [
            const Text(
              "Total payment: ",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              totalpay.toStringAsFixed(2),
              style: const TextStyle(fontSize: 20),
            )
            ]
            ),
          ],
          )
        ),
       )
      )
    );
  }

  void onPressed() {
    double lamount = double.parse(numa.text);
    double pinterest = double.parse(numc.text)/1200;
    int ttmonth = int.parse(numb.text)*12;
    montlypay = lamount/(((pow((1+pinterest), ttmonth))-1)/(pinterest*(pow((1+pinterest), ttmonth))));
    setState(() {});
    totalpay = ttmonth*montlypay;
  }
}

