import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smca/Widgets/boxinformacaowidget.dart';

class Informacoes extends StatelessWidget {
  const Informacoes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informações'),
      ),
      body: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: BoxInformacao(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(23.0, 11.0, 0.0, 0.0),
            child: Container(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Pressão: 101,325', style: TextStyle(fontSize: 24)),
                  Text('Litros: 400L', style: TextStyle(fontSize: 24)),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:18.0),
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
