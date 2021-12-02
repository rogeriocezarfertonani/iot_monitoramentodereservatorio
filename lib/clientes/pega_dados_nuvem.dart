import 'package:firebase_database/firebase_database.dart';
import 'package:get/state_manager.dart';
import 'package:smca/@dto/medicadto.dart';
import 'package:smca/models/medicao.dart';

class PegaDados {
  static initDataBase() {
    return FirebaseDatabase.instance.reference();
  }

  static pegaNivelDoReservatorio() async{
   
    final _dataBase = FirebaseDatabase.instance.reference();
    final  valor = await _dataBase.child('Nivel do Reservatorio (cm)').once().then((nivelSnapshot) {
      print('O VALOR DO NIVEL É ${nivelSnapshot.value}');  
   
       return nivelSnapshot.value;
    });

    return valor;
    
  }

  static pegaPressao() async {
    final _dataBase = FirebaseDatabase.instance.reference();
    await _dataBase.child('Pressao  (Pa)').once().then((pressaoSnapshot) {
      print('A pressão é ${pressaoSnapshot.value}');
    });
  }

  static pegaTemperatura() async {
    final _dataBase = FirebaseDatabase.instance.reference();
    await _dataBase
        .child('Temperatura da agua (ºC)')
        .once()
        .then((pressaoSnapshot) {
      print('A Temperatura é ${pressaoSnapshot.value}');
    });
  }
}
