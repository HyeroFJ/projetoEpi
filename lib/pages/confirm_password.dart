import 'package:epi/Provider/cadastro/valida_login.dart';
import 'package:epi/utils/mensage.dart';
import 'package:epi/widget/botao.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ConfirmPassword extends StatelessWidget {
  final String email;
  final String cpf;

  const ConfirmPassword({super.key, required this.email, required this.cpf});

  @override
  Widget build(BuildContext context) {

    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    return Consumer<ValidarSenha>( builder: (context, validarsenha, _)
      {
        return Scaffold(
      appBar: AppBar(
          title: const Text('Confirme a Senha'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(5.0),
                child: Text('E-mail: $email')),
              Container(
                margin: const EdgeInsets.all(5.0),
                child: Text('CPF: $cpf')),
              Container(
                margin: const EdgeInsets.all(5.0),
                child: TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                      labelText: 'E-mail',
                      prefixIcon: Icon(Icons.password),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 106, 106, 106),
                            width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0))),
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 20),
              customButton(
                tap: () async {
                  if (passwordController.text != confirmPasswordController) {
                    showMessage(
                      message: 'As senhas devem ser iguais',
                      context: context
                    );
                  } else {
                    var cpfint = cpf.replaceAll(RegExp(r'[^0-9]'), '');
                    await validarsenha.createUser(
                      email, passwordController.text, int.parse(cpfint)
                    );
                  }
                },
                text: 'Concluir',
                context: context,
                status: validarsenha.carregando
              //   onPressed: () {
              //   //Validar e processar as informações
              //   //Aqui você pode adcionar lógica para verificar se as senhas coincidem e realizar o cadastro 
              //   var confirmPasswordController;
              //   if (passwordController.text !=
              //       confirmPasswordController.text) {
              //         showMessage(
              //           message: "As senhas devem ser iguais",
              //           context: context
              //         );
              //       } else {
              //         var cpfint = cpf.replaceAll(RegExp(r'[^0-9]'), '');
              //         validarsenha.createUser(
              //           email, passwordController.text, int.parse(cpfint)
              //         );
              //         showMessage(
              //           message: validarsenha.msgErrorApi,
              //           context: context
              //         );
              //       }
              // },
              // child: const Text('Concluir'),
              ),
            ],
          ),
        )
    );
      });
    
  }
}