import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_2/hafta11.dart';
import 'package:flutter_application_2/human.dart';

class Detay extends StatefulWidget {
  Human h;
  Detay(this.h);

  @override
  State<Detay> createState() => _DetayState(h);
}

class _DetayState extends State<Detay> {

  _DetayState(this.human);

  TextEditingController editCont=TextEditingController();
  Human human;
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    editCont.text = human.yapilacaklar!;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Scaffold(
        
        appBar: AppBar(backgroundColor: Colors.yellowAccent,
          title: Text("DETAY",style: TextStyle(color: Color.fromARGB(221, 237, 9, 9)),)),
        
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child:Padding(
              padding:  EdgeInsets.fromLTRB(screenWidth / 4, screenHeight / 10, screenWidth / 4, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFormField(controller: editCont,),
                  Container(width: 130,height: 130,
                    child: ElevatedButton(
                      onPressed: () {
                              
                        human.yapilacaklar = editCont.text;
                         Navigator.pop(context);
                      },
                      child: const  Text('GÜNCELLE',style: TextStyle(color: Color.fromARGB(176, 246, 48, 48)),),
                          ),
                  ),
                ],
              ),
            ),
              ),
        ),
      ),
    );
  }
}