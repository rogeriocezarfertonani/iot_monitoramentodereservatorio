import 'package:flutter/material.dart';

import 'barravolumewidget.dart';

class BoxInformacao extends StatelessWidget {
 double porcentagem;

  BoxInformacao({Key? key, required this.porcentagem }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     
    return Container(
      alignment: Alignment.topCenter, // ---->>> todo alinhamento
      width: 330,
      height: 287,
      child: Stack(
        children: [
          Image.asset('assets/images/fundo-de-onda.png'),
          Column(
            children:  [
               const Text('Volume da caixa', style: TextStyle(fontSize: 36.0),),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25.5,50,0,0),
                      child:
                       BarradeVolume(valorPorcento: porcentagem,),                                           
                    ),

                     Padding(
                      padding: const EdgeInsets.fromLTRB(50,0.0,33.0,0.0),
                      child: Text('${porcentagem.toStringAsFixed(0)}',style: TextStyle(fontSize: 80.0),),
                    ) // To do -> recebe a variavel 
                  ],
                ),
          ],
          
          ),

          
        ],
      ),
    );
  }
}