import 'dart:developer';

import 'package:flutter/material.dart';

class Calculation extends StatefulWidget {
  const Calculation({super.key});

  @override
  State<Calculation> createState() => _CalculationState();
}

class _CalculationState extends State<Calculation> {
  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();

  List<String> resultList = [];
  int num = 0;

  function(){
    setState(() {});
    try{
      num = int.parse(firstController.text);
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
      appBar: AppBar(title: Text("Mutiplication Show"),
      centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 150,
                      child: TextField(
                        controller: firstController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                          )
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    SizedBox(
                      height: 50,
                      width: 150,
                      child: TextField(
                        controller: secondController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                          )
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    fixedSize: Size(250, 40)
                  ),
                    onPressed: (){
                  function();
                  log(resultList.length.toString());
                }, child: Text("Mutiplication Show")),
                SizedBox(height: 30,),
                Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: resultList.length,
                          itemBuilder: (context,index){
                          return Text("${resultList[index]}");
                          }),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: resultList.length,
                          itemBuilder: (context,index){
                          return Text("${resultList[index]}");
                          }),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
