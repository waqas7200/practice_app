import 'package:flutter/material.dart';
class Corvedscreens2 extends StatefulWidget {
  const Corvedscreens2({super.key});

  @override
  State<Corvedscreens2> createState() => _Corvedscreens2State();
}

class _Corvedscreens2State extends State<Corvedscreens2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: SizedBox(
                      //height: 300,
                        child: Expanded(flex:30,child:Container(
                           height: 300,
                          color: Colors.white,), )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: SizedBox(
                       height: 400,
                        child: Expanded(flex:70,child: Container(color: Colors.blue.shade900,), )),
                  ),
                ],
              ),
            ),
            Container(height: 130,
              width: 500,
              decoration: BoxDecoration(
                  color: Colors.blue.shade900,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(70))
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                height: 130,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.blue.shade900,
                  //borderRadius: BorderRadius.only(bottomRight: Radius.circular(70))
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 130),
              child: Container(height: 330,
                width: 500,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        bottomRight: Radius.circular(70)
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 460),
              child: Container(height: 80,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                       // topLeft: Radius.circular(50),
                        //bottomRight: Radius.circular(70)
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 460),
              child: Container(height: 80,
                width: 500,
                decoration: BoxDecoration(
                    color: Colors.blue.shade900,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        //bottomRight: Radius.circular(70)
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:400),
              child: Center(child: Text('CROWDFOUNG',style: TextStyle(color: Colors.white),),)
            ),

          ],
        )
    );
  }
}
