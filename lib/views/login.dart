import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smca/Widgets/sociallogin.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sistema de Monitoramento de água'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 16.0),
              child: Image.asset('assets/images/titulo-entrada.png'),
            ),
            Image.asset('assets/images/caixa-da-entrada.png'),
            TextButton(
              onPressed: () {
                Get.toNamed('/');
              },
              child:
                  SocialLoginButton(icone: 'assets/images/google-icon 1.png'),
            ),
            Image.asset('assets/images/barra-colorida-da-entrada.png'),
          ],
        ),
      ),
    );
  }
}
