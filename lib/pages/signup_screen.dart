import 'package:epi/Provider/cadastro/verifica_usuario.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:epi/Utils/mensage.dart';
import 'package:epi/widget/botao.dart';
import 'package:epi/widget/field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'confirm_password.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar-se'),
      ),
      body: const SignupForm(),
    );
  }
}

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();

  @override
  void dispose() {
    _cpfController.clear();
    _emailController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UsuarioCadastro>(builder: (conetext, usuario, _) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(5.0),
              child: customTextField(
                  controller: _emailController,
                  // decoration: const InputDecoration(
                  //     labelText: 'E-mail',
                  //     prefixIcon: Icon(Icons.password),
                  //     enabledBorder: OutlineInputBorder(
                  //       borderSide: BorderSide(
                  //           color: Color.fromARGB(255, 106, 106, 106),
                  //           width: 2.0),
                  //       borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  //     ),
                  //     focusedBorder: OutlineInputBorder(
                  //         borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  //         borderSide:
                  //             BorderSide(color: Colors.blue, width: 2.0))),
                  hint: 'Digite seu e-mail',
                  tipo: TextInputType.emailAddress),
            ),
            Container(
              margin: EdgeInsets.all(5.0),
              child: customTextField(
                  controller: _cpfController,
                  // decoration: const InputDecoration(
                  //     labelText: 'CPF',
                  //     prefixIcon: Icon(Icons.password),
                  //     enabledBorder: OutlineInputBorder(
                  //       borderSide: BorderSide(
                  //           color: Color.fromARGB(255, 106, 106, 106),
                  //           width: 2.0),
                  //       borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  //     ),
                  //     focusedBorder: OutlineInputBorder(
                  //         borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  //         borderSide:
                  //             BorderSide(color: Colors.blue, width: 2.0))),
                  hint: 'Digite seu CPF',
                  formatacao: [
                    FilteringTextInputFormatter.digitsOnly,
                    CpfInputFormatter(),
                  ]),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: customButton(
                  tap: () async {
                    await usuario.checarUsuario(
                        _cpfController.text, _emailController.text);
                    if (usuario.valido) {
                      Navigator.push(
                          conetext,
                          MaterialPageRoute(
                              builder: (context) => ConfirmPassword(
                                  email: _emailController.text,
                                  cpf: _cpfController.text)));
                    } else {
                      showMessage(message: usuario.msgError, context: context);
                    }
                  },
                  text: "Avançar",
                  context: context,
                  status: usuario.carregando
                  // style: ElevatedButton.styleFrom(
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(5.0),
                  //   ),
                  // ),
                  // onPressed: () {
                  //   usuario.checarUsuario(
                  //       _cpfController.text, _emailController.text);
                  //   if (usuario.valido) {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => ConfirmPassword(
                  //                 email: _emailController.text,
                  //                 cpf: _cpfController.text,
                  //               )),
                  //     );
                  //   } else {
                  //     showMessage(
                  //       message: usuario.msgError,
                  //       context: conetext
                  //     );
                  //   }
                  // },
                  // child: const Text("Avançar")
                  ),
            )
          ],
        ),
      );
    });
  }
}
