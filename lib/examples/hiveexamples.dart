
// ignore_for_file: avoid_print

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:io';

import 'package:smca/clientes/pega_dados_nuvem.dart';

class BdHive extends StatefulWidget {
  const BdHive({ Key? key }) : super(key: key);

  @override
  State<BdHive> createState() => _BdHiveState();
}

class _BdHiveState extends State<BdHive> { 
  dynamic _displayText;
  final _database =FirebaseDatabase.instance.reference();

  @override
  void initState() {
    _activeListeners();
    //PegaDados.pegaNivelDoReservatorio();
    PegaDados.pegaPressao();
    PegaDados.pegaTemperatura();
    super.initState();
  }

  void _activeListeners() async{
   
    final _descriptionRef = _database.child('Nivel do Reservatorio (cm)').onValue
    .listen((event) {
       dynamic description = event.snapshot.value;

      setState(() {
        _displayText = description;
      });
    });
  }

 

  @override
  
  Widget build(BuildContext context) {
   

   

    return Scaffold(
      body: Column(children: [
        Text('\n\n\n\n A PRESSÃO É : ${_displayText}'),
        ElevatedButton(onPressed: (){

          _database.update({
            'meuValor2':'escreve',
            'nossoValor': 'nosso'});
        }, 
        
        
        
        child: Text('grava')),
      ],),
    );
  }
}








