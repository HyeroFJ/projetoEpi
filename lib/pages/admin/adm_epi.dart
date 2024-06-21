import 'package:epi/Provider/admin/cadepi.dart';
import 'package:epi/Utils/mensage.dart';
import 'package:epi/widget/botao.dart';
import 'package:epi/widget/field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminEpi extends StatefulWidget {
  const AdminEpi({super.key});

  @override
  State<AdminEpi> createState() => _AdminEpiState();
}

class _AdminEpiState extends State<AdminEpi> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _instrucoes = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<CadEpiProvider>(builder: (context, epiprovider, _){
      return Form(
        key: _formKey ,
        child: Scaffold(
        appBar: AppBar(
          title: const Text('Administrativo'),
        ),
        body: Center(
          child: Column(
            children: [
              customTextField(
                label: 'Nome do epi',
                controller: _nome,
                hint: 'Digite o nome do Epi',
                tipo: TextInputType.text
              ),
              customButton(
                tap: () {
                  if (_formKey.currentState!.validate()){
                    epiprovider.cadastrar(
                      context,
                      _nome.text,
                      _instrucoes.text
                    );
                  } else {
                    showMessage(
                      message: 
                      "todos os campos devem ser preenchidos",
                      context: context
                    );
                  }
                },
                text: "Concluir",
                context: context,
                status: epiprovider.carregando
              )
            ],
          ),)
            ),
      );
    });
    
  }
}