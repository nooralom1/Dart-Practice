import 'dart:developer';

import 'package:flutter/material.dart';

class Calculation extends StatefulWidget {
  const Calculation({super.key});

  @override
  State<Calculation> createState() => _CalculationState();
}

class _CalculationState extends State<Calculation> {
  TextEditingController controller = TextEditingController();

  List<String> resultList = [];
  int num = 0;

  function(){
    setState(() {});
    try{
      num = int.parse(controller.text);
      for(int i=1; i<=10; i++){
        resultList.add("($num x $i) = ${num*i}");
      }
    }catch(e){
      log("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculation"),
      centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              function();
              log(resultList.length.toString());
            }, child: Text("Calculate")),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: resultList.length,
                      itemBuilder: (context,index){
                      return Text("${resultList[index]}");
                      }),
                ))
          ],
        ),
      ),
    );
  }
}
