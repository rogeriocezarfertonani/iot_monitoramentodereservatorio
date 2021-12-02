import 'package:flutter/material.dart';

class BarradeVolume extends StatefulWidget {
double valorPorcento;
   BarradeVolume({ Key? key, required double this.valorPorcento}) : super(key: key);
   
  @override
  State<BarradeVolume> createState() => _BarradeVolumeState();
}

class _BarradeVolumeState extends State<BarradeVolume> {
  @override
  Widget build(BuildContext context) {
    

    return Column(
      children:  [
      Container(
        width:57,
        height: 184,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 1.0

          )
        ),
        child: Column(
          children: [
            BlocoDeVolume(cor: const Color(0XFF036BAF), porcento: widget.valorPorcento, valorMin: 75,),
            BlocoDeVolume(cor: const Color(0XFF017CCC), porcento: widget.valorPorcento, valorMin: 50,),
            BlocoDeVolume(cor: const Color(0XFFFEDB24), porcento: widget.valorPorcento, valorMin: 25,),
            BlocoDeVolume(cor: const Color(0XFFFF000F), porcento: widget.valorPorcento, valorMin: 0,)
          ],
        ),
      ),
      ],
    );
  }
}

class BlocoDeVolume extends StatelessWidget {
  Color cor ;
  double porcento;
  int valorMin;

  BlocoDeVolume({ Key? key, 
  required this.cor, 
  required this.porcento,
  required this.valorMin}) : super(key: key);

  @override
  Widget build(BuildContext context) {

       Color exibeCor ( Color cor , double porcento,int valorMin){
      
      if(porcento > valorMin){
        return cor;
      } else{
         return const Color(0XFFFFFFFF);
      }
      
    }

    return Container(
      width: 57,
      height: 45.5,
      color:exibeCor(this.cor, this.porcento,this.valorMin),
      
    );
  }
}