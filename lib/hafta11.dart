import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/detay.dart';
import 'package:flutter_application_2/human.dart';


class Hafta11 extends StatefulWidget {
  const Hafta11({super.key});

  @override
  State<Hafta11> createState() => _Hafta11State();
}

class _Hafta11State extends State<Hafta11> {
  List<Human>humans=[
    
  ];

  TextEditingController yapilacaklarkontrol=TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Scaffold(
        
        appBar: AppBar(
          
          backgroundColor:Colors.redAccent,
          title: const Text("YAPILACAK LİSTESİ",style:TextStyle(color:Color.fromARGB(255, 246, 242, 242))),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            
            children: [
              Expanded(
                child: Padding(
                  padding:  EdgeInsets.fromLTRB(screenWidth / 4, screenHeight /10, screenWidth / 4, 0),
                  child: ListView.builder(
                    itemCount:humans.length , 
                    itemBuilder: (context,index) 
                    {
                    return ListTile(
                      
                      title: GestureDetector(child: Text(humans[index].yapilacaklar!,style: TextStyle(fontSize: 18, color: Colors.black87),), onTap: () async 
                      { 
                        await Navigator.push(context, MaterialPageRoute(builder: (context) => Detay(humans[index]))); 
                        setState(() {});
                      },) ,
                      
                      trailing: IconButton(
                        onPressed: (){
                          setState(() {
                            humans.removeAt(index);
                          });
                        },
                        icon: const Icon(Icons.clear,color: Color.fromARGB(255, 22, 219, 32),),
                      ),
                    );
                    }
                    ),
                ),
              ),
              
              Padding (
                padding:  EdgeInsets.fromLTRB(screenWidth / 4, 0, screenWidth / 4, 0),
                child: TextFormField(
                  controller: yapilacaklarkontrol,
                  decoration: InputDecoration(
                  hintText: 'Yapılacakları girin',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ), 
                ),
              ),
               
              Padding(
                padding:  EdgeInsets.fromLTRB(screenWidth / 4, 0, screenWidth / 4, 0),
                child: ElevatedButton(onPressed: (){ 
                  Human s=Human();
                  s.yapilacaklar=yapilacaklarkontrol.text;
                  
                 setState(() {
                 humans.add(s);
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent,
                  onPrimary: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  textStyle: TextStyle(fontSize: 16),
                ), // ElevatedButton.styleFrom
                child :const Text("KAYDET"),),
              ),
            ],
          ),
        ), 
      
      ),
    );
  }

}