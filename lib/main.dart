import 'package:flutter/material.dart';
import 'package:smca/views/configuracoes.dart';
import 'package:smca/views/historico.dart';
import 'package:smca/views/informacoes.dart';
import 'package:smca/views/login.dart';
import 'package:get/get.dart';

import 'examples/hiveexamples.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(  App());
}


class App extends StatelessWidget {
 App({ Key? key }) : super(key: key);



  @override
  Widget build(BuildContext context) {
  
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sistema de Monitoramento de Agua',



      initialRoute: '/configuracoes',

      getPages: [
        GetPage(name: '/teste', page: ()=> const BdHive()),
        GetPage(name: '/', page: ()=> const Informacoes()),
        GetPage(name: '/login', page: ()=>const Login()),
        GetPage(name: '/historico', page: ()=>const Historico()),
        GetPage(name: '/configuracoes', page: ()=>const Configuracoes()),
      ],
    );
  }
}