import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:smca/data/modelodecaixas.dart';
import 'package:enhanced_drop_down/enhanced_drop_down.dart';


class Configuracoes extends StatefulWidget {
  
  const Configuracoes({Key? key}) : super(key: key);

  @override
  State<Configuracoes> createState() => _ConfiguracoesState();
}

class _ConfiguracoesState extends State<Configuracoes> {
    var caixa = ModeloDeCaixasDeAgua().caixa; 
     String selectedMarca = "";
     String selectedLitragem = "";
     dynamic altura = "";
     late Box configuracaoDaAltura;
     late Box configuracaoDoVolume;

     Future<Box?> guardaConfig ({required String altura, required String volume}) async{
     Directory dir = await getApplicationDocumentsDirectory();
     Hive.init(dir.path);
     await  Hive.openBox('configuracoesAltura');
     configuracaoDaAltura = Hive.box('configuracoesAltura');    
     configuracaoDaAltura.put('altura', altura); 

     await Hive.openBox('configuracoesVolume');
     configuracaoDoVolume = Hive.box('configuracoesVolume');
     configuracaoDoVolume.put('volume',volume);
     
     var alt = configuracaoDaAltura.get('altura');
     var vol = configuracaoDoVolume.get('volume');
     print('Essa altura esta salva $alt e o volume é $vol');   
     }
     

  @override
  Widget build(BuildContext context) {
    print (caixa['Tigre']);
    
    //String hint = caixaSelecionada ;
    return Scaffold(
      appBar: AppBar(
        title: const  Text('Configuracoes'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      
        children:  [
           Center(
                child: EnhancedDropDown.withData(
                  dropdownLabelTitle: "Marca da Caixa",
                  defaultOptionText: "Selecione",
                  dataSource:  ['Tigre','FortLev','AquaLimp'],
                  valueReturned: (chosen) {
                    selectedMarca = chosen;
                    print('$selectedMarca');
                  },
                ),
              ),

               Center(
                child: EnhancedDropDown.withData(
                  dropdownLabelTitle: "Volume da Caixa",
                  defaultOptionText: "Selecione",
                  dataSource:['310','500','1000','1500','2000','3000'],
                  valueReturned: (chosen) {
                    selectedLitragem = chosen;
                     print('$selectedLitragem');
                  },
                ),
              ),

              //Center(child: Image.asset('/assets/images/caixa-da-entrada.png',scale: 1.0,)),

              TextButton(onPressed: ()async {
                 altura = caixa[selectedMarca][selectedLitragem];   
                  print('$selectedMarca e $selectedLitragem'); 
                  print('$altura');  
                  await guardaConfig(altura: altura, volume: selectedLitragem).then((_) {
                     Get.toNamed('/');
                  });          
              }, child: const Text('Salvar')),





            
          
        ],
      ),
    );
  }
}
