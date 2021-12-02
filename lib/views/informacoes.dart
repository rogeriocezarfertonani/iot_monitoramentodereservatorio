import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:smca/Widgets/barravolumewidget.dart';
import 'package:smca/Widgets/boxinformacaowidget.dart';
import 'package:smca/clientes/pega_dados_nuvem.dart';

class Informacoes extends StatefulWidget {
  const Informacoes({Key? key}) : super(key: key);

  @override
  State<Informacoes> createState() => _InformacoesState();
}

class _InformacoesState extends State<Informacoes> {
    dynamic _pressaoText;
    dynamic _volumeTotaloDaCaixa;
    String? _litrosText;
    String? _porcentagemText;
    dynamic _porcentagem;
    dynamic _alturaText;
    dynamic _alturaBdHiveConfig;
    dynamic _numPorcento;
    late Box configuracaoDeAltura;
    late Box configuracaoDeVolume;
    final database =FirebaseDatabase.instance.reference();
    

      Future<Box?> leConfig () async{
     Directory dir = await getApplicationDocumentsDirectory();
     Hive.init(dir.path);
     await  Hive.openBox('configuracoesAltura');
     configuracaoDeAltura = Hive.box('configuracoesAltura');
      _alturaBdHiveConfig = configuracaoDeAltura.get('altura');
     
     await Hive.openBox('configuracoesVolume');
     configuracaoDeVolume = Hive.box('configuracoesVolume');
     _volumeTotaloDaCaixa = configuracaoDeVolume.get('volume');

     print('Informação $_alturaBdHiveConfig e volume $_volumeTotaloDaCaixa');   
     }

   void _activeListeners() async{
     final pressaFireBase = database.child('Pressao  (Pa)')
     .onValue
     .listen(
       (event) {
         dynamic pressao = event.snapshot.value; 
         setState(() {
           _pressaoText = pressao;
         });});

         final alturaFireBase = database.child('Nivel do Reservatorio (cm)')
     .onValue
     .listen(
       (event) {
         dynamic altura= event.snapshot.value; 
         setState(() {
           _alturaText = (altura * int.parse(_volumeTotaloDaCaixa))/int.parse(_alturaBdHiveConfig); 
           _porcentagem = (altura);

         

         });});
   }
   @override
  void initState() {
   _activeListeners();
   leConfig();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_litrosText== null){
      _litrosText = "Obtendo dados aguarde";
      _porcentagemText ="??";
    }else{
      _litrosText = _alturaText.toStringAsFixed(2);
      _porcentagemText =((_porcentagem /int.parse(_alturaBdHiveConfig))*100 ).toStringAsFixed(0);
      _numPorcento = double.parse(_porcentagemText!);
    }
   
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informações'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [    
          Container(
            alignment: Alignment.topCenter,
            width: 330,
            height: 287,
            child: Stack(children: [
                   Image.asset('assets/images/fundo-de-onda.png'),
            Column(
              children:  [
                 const Text('Volume da caixa', style: TextStyle(fontSize: 36.0),),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25.5,50,0,0),
                        child:
                         BarradeVolume(valorPorcento: _numPorcento,),                                           
                      ),

                        Padding(
                        padding: EdgeInsets.fromLTRB(50,0.0,33.0,0.0),
                        child: Text('$_porcentagemText %',style: TextStyle(fontSize: 55.0),),
                      ) // To do -> recebe a variavel 
                    ],
                  ),
            ],
            
            ),
            ],),
          ),
          
     
        
          Padding(
            padding: const EdgeInsets.fromLTRB(23.0, 11.0, 0.0, 0.0),
            child: Container(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Pressão: $_pressaoText PA', style: TextStyle(fontSize: 24)),
                  Text('Litros: ${_litrosText} ', style: TextStyle(fontSize: 24)),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(250.0, 41),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ), //estilos
                onPressed: () {
                
                  Get.toNamed('/historico');
                },
                child: const Text(
                  'Histórico',
                  style: TextStyle(fontSize: 24.0),
                )),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(250.0, 41),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                Get.toNamed('/configuracoes');
              },
              child: const Text(
                'Configurações',
                style: TextStyle(fontSize: 24.0),
              )),
        ],
      ),
    );
  }
}
