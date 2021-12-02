// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:smca/Widgets/boxinformacaowidget.dart';
// import 'package:smca/clientes/pega_dados_nuvem.dart';

// // Exemplo de um Future Builder 


// class InformacoesExamples extends StatefulWidget {

  
//    InformacoesExamples({Key? key}) : super(key: key);

//   @override
//   State<InformacoesExamples> createState() => _InformacoesStateExamples();
// }

// class _InformacoesStateExamples extends State<InformacoesExamples> {
//    List? listaPressao;
//   @override
//   void initState() {
     
//     super.initState();
//   }
 
//   @override
//   Widget build(BuildContext context)  {
  
   
     
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Informações'),
//       ),
//       body: Column(
//         mainAxisAlignment:MainAxisAlignment.center,
//         children: [
//            Padding(
//             padding: EdgeInsets.only(top: 8.0),
//             child: BoxInformacao(alturatxt: 10, volumeTotalDaCaixa: 10,),
//           ),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(23.0, 11.0, 0.0, 0.0),
//             child: Container(
//               alignment: Alignment.topLeft,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children:  [ 
                  
//                   FutureBuilder(future: PegaDados.pegaNivelDoReservatorio(), 
//                 builder: (BuildContext context, AsyncSnapshot snapshot){
//                      if(snapshot.hasData){
//                        dynamic nivel = snapshot.data;
  
//                          return Text('Pressão: ${nivel.toString()}', style: TextStyle(fontSize: 24));
//                      }else{
//                        return const SizedBox(
                    
//                        );
//                      }

//                 }, )

      
//                   //Text('Pressão: ${nivel.toString()}', style: TextStyle(fontSize: 24)),
//                   //Text('Litros: 400L', style: TextStyle(fontSize: 24)),
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top:18.0),
//             child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   fixedSize: const Size(250.0, 41),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                 ), //estilos
//                 onPressed: () {
//                 setState(() {
                  
//                 });
//                    //Get.toNamed('/historico');
//                 },
//                 child: const Text(
//                   'Histórico',
//                   style: TextStyle(fontSize: 24.0),
//                 )),
//           ),
//           ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 fixedSize: const Size(250.0, 41),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//               ),
//               onPressed: () {
//                  Get.toNamed('/configuracoes');
//               },
//               child: const Text(
//                 'Configurações',
//                 style: TextStyle(fontSize: 24.0),
//               )),
//         ],
//       ),
//     );
//   }
// }
