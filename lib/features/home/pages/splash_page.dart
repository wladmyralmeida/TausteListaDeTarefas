import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    //Apos passados 3 segundos, da inicializacao do SplashPage
    Future.delayed(Duration(seconds: 10), () {
      // Quero Navegar para a home, removendo as paginas anteriores;
      Navigator.pushReplacementNamed(context, '/home');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Tauste Supermaket',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 64,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image.asset('assets/images/carrinho_de_compras.jpg'),
        ],
      ),
    );
  }
}
