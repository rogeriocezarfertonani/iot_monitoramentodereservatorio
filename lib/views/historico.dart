import 'package:flutter/material.dart';

class Historico extends StatelessWidget {
  const Historico({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {    

    return Scaffold(
      appBar: AppBar(title: const Text('Histórico'),
      ),
      body: Center(
        child: Column(
          children: [
            Card(child: Container(
              width: 342,
              height: 102,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const[
                Text('Pressão : 95944'),
                Text('Litros: 259.74'),
              ],),
            ),),
            Card(child: Container(
              width: 342,
              height: 102,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const[
                Text('Pressão : 95144'),
                Text('Litros: 359.74'),
              ],),
            ),),
            Card(child: Container(
              width: 342,
              height: 102,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const[
                Text('Pressão : 85944'),
                Text('Litros: 400.74'),
              ],),
            ),),
            Card(child: Container(
              width: 342,
              height: 102,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const[
                Text('Pressão : 75944'),
                Text('Litros: 259.74'),
              ],),
            ),),
            Card(child: Container(
              width: 342,
              height: 102,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const[
                Text('Pressão : 95944'),
                Text('Litros: 559.74'),
              ],),
            ),),
            Card(child: Container(
              width: 342,
              height: 102,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const[
                Text('Pressão : 95944'),
                Text('Litros: 359.74'),
              ],),
            ),),
            
          ],
        ),
      ),
       // menu lateral
      // endDrawer: Drawer(
      //   child: Container(
      //     child: Text('Só um teste'),
      //   ),
      // ),
    );
  }
}