import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  String icone ;

   SocialLoginButton({ Key? key, required this.icone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color cor40 = const Color(0Xff404040);
    return Padding(
             padding:  const EdgeInsets.fromLTRB(41,16,29,34),
             child: Container(
               margin: const EdgeInsets.all(0),
               width:295.0 ,
               height: 56.0,
               decoration: BoxDecoration(
                 border: Border.all(
                   color: cor40,
                   width: 0.2,                   
                 ),
                 borderRadius:const BorderRadius.all(Radius.circular(10)) ,
               ),
               child: Row(
                 children: [
                   Padding(
                     padding: const EdgeInsets.all(16.0),
                     child: Image.asset(icone),
                   ),
                   Container(
                     width: 0.2,
                     height: 56,
                     color: cor40,
                   ),
                      
                   const Padding(
                     padding: EdgeInsets.fromLTRB(49.0, 19.0, 40.0,18.0),
                     child: Text('Entrar com o Google'),
                   )
                 ],
               ),
             ),
           );
}

}