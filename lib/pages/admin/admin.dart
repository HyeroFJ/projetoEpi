import 'package:epi/widget/botao.dart';
import 'package:flutter/material.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('administrativo'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("Bem-vindo"),
            customButton(
                text: "Cadastrar Epi",
                tap: () {
                  Navigator.pushNamed(context, '/admepi');
                },
                context: context),
            customButton(
                text: "Cadastrar Funcionário",
                tap: () {
                  Navigator.pushNamed(context, '/admfunc');
                },
                context: context),
            customButton(
                text: "Cadastrar Entrega",
                tap: () {
                  Navigator.pushNamed(context, '/admentrega');
                },
                context: context),
          ],
        ),
      ),
    );
  }
}
