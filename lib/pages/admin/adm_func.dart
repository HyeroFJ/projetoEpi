import 'package:brasil_fields/brasil_fields.dart';
import 'package:epi/Provider/admin/colaborador.dart';
import 'package:epi/Utils/mensage.dart';
import 'package:epi/widget/botao.dart';
import 'package:epi/widget/field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AdmFunc extends StatefulWidget {
  const AdmFunc({super.key});

  @override
  State<AdmFunc> createState() => _AdmFuncState();
}

class _AdmFuncState extends State<AdmFunc> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _ctps = TextEditingController();
  final TextEditingController _telefone = TextEditingController();
  final TextEditingController _cpf = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _dataAdmissao = TextEditingController();
  @override
  void dispose() {
    _nome.clear();
    _ctps.clear();
    _telefone.clear();
    _cpf.clear();
    _email.clear();
    _dataAdmissao.clear();
    super.dispose();
  }



  Widget build(BuildContext context) {
    return Consumer<ColaboradorProvider>(builder: (context, colabprovider, _) {
      return Scaffold(
      appBar: AppBar(
        title: const Text('Administrativo'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              children: [
                customTextField(
                  label: 'Nome de Funcionário',
                  controller: _nome,
                  hint: 'Digite o nome do funcionário',
                  tipo: TextInputType.text
                ),
                customTextField(
                  label: 'Número CTPS',
                  controller: _ctps,
                  hint: 'Digite o número da ctps do funcionário',
                  tipo: TextInputType.number
                ),
                customTextField(
                  label: 'Número de telefone',
                  controller: _telefone,
                  hint: 'Digite o número de telefone do funcionário',
                  tipo: TextInputType.number
                ),
                customTextField(
                  label: 'CPF',
                  controller: _cpf,
                  hint: 'Digite o cpf do funcionário',
                  tipo: TextInputType.number,
                  formatacao: [
                    FilteringTextInputFormatter.digitsOnly,
                    CpfInputFormatter(),
                  ]
                ),
                customTextField(
                  label: 'Email',
                  controller: _email,
                  hint: 'Digite o email do funcionário',
                  tipo: TextInputType.emailAddress
                ),
                customTextField(
                  label: 'Data de Admissão do funcionário',
                  controller: _dataAdmissao,
                  hint: 'Digite a data de admissão do funcionário',
                  tipo: TextInputType.datetime
                ),
          
                customButton(
                  tap: () {
                    if (_formKey.currentState!.validate()) {
                      colabprovider.cadastrar(
                        context, 
                        _nome.text, 
                        _ctps.text, 
                        _telefone.text, 
                        _cpf.text, 
                        _email.text, 
                        _dataAdmissao.text
                        );
                    } else {
                      showMessage(
                        message: "Todos os campos devem ser preenchidos",
                        context: context
                      );
                    }
                  },
                  text: "Concluir",
                  context: context,
                  status: colabprovider.carregando
                )
              ],),
          ),
        ),
      ),
    );
    });
    
  }
}