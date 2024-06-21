import 'package:brasil_fields/brasil_fields.dart';
import 'package:epi/Provider/admin/entrega.dart';
import 'package:epi/widget/botao.dart';
import 'package:epi/widget/field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../Utils/mensage.dart';

class EntregaScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _dataValidade = TextEditingController();
  final _dataEntrega = TextEditingController();

  EntregaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Entrega')),
      body: Consumer<EntregaProvider>(
        builder: (context, dataProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      customTextField(
                          label: 'Data de Validade',
                          controller: _dataValidade,
                          hint: 'Digite a Data',
                          tipo: TextInputType.datetime,
                          formatacao: [
                            FilteringTextInputFormatter.digitsOnly,
                            DataInputFormatter(),
                          ]),
                      customTextField(
                          label: 'Data de Entrega',
                          controller: _dataEntrega,
                          hint: 'Digite a Data de Entrega',
                          tipo: TextInputType.datetime,
                          formatacao: [
                            FilteringTextInputFormatter.digitsOnly,
                            DataInputFormatter(),
                          ]),
                    ],
                  ),
                ),
                customButton(
                    text: "Cadastrar",
                    tap: () async {
                      if (_formKey.currentState!.validate()) {
                        dataProvider.setDataValidade(_dataValidade.text);
                        dataProvider.setDataEntrega(_dataEntrega.text);
                        await dataProvider.criarEntrega();

                        if(dataProvider.sucesso == true){
                          showMessage(
                            message: 'Entrega criada com sucesso',
                            context: context
                          );
                        } else {
                          showMessage(
                            message: "Erro ao cadastrar Entrega",
                            context: context
                          );
                        }
                        showMessage(
                            message: "Entrega criada com sucesso",
                            // ignore: use_build_context_synchronously
                            context: context);
                      }
                    },
                    context: context)
              ],
            ),
          );
        },
      ),
    );
  }
}