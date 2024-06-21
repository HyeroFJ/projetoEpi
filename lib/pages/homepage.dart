import 'package:epi/Provider/login/logar.dart';
import 'package:epi/Utils/mensage.dart';
import 'package:epi/widget/botao.dart';
import 'package:epi/widget/field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _email.clear();
    _password.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer <Logar>(builder: (context, logar, _){
      return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text(
              'SafeGuard',
              style: TextStyle(color: Colors.white,
              fontWeight: FontWeight.w600),),
              Text(
                ' PRO',
                style: TextStyle(color: Colors.orange,
              fontWeight: FontWeight.w700),)
          ],
        ),
          
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 48, 58, 83),
      ),
      body: Container(
        decoration:  const BoxDecoration(
          color: Color.fromARGB(255, 33, 37, 44)
        ),
        child: Column(
          children: [
            customTextField(
              controller: _email,
              label: 'E-mail',
              hint: 'Digite seu e-mail',
              tipo:TextInputType.emailAddress,
            ),
            customTextField(
              controller: _password,
              label: 'Senha',
              hint: 'Digite sua senha',
              tipo: TextInputType.visiblePassword,
              funcao: (value) {
                logar.validatePassword(value);
              }
            ),
            if (logar.msgError.isNotEmpty)
            Text(
              logar.msgError,
              style: const TextStyle(color: Colors.red),
            ),
            customButton(
              text: 'Login',
              tap: () async {
                if (_email.text.isEmpty || _password.text.isEmpty){
                  showMessage(
                    message: "todos os campos são requiridos",
                    context: context
                  );
                } else{
                  await logar.logarUsuario(_email.text, _password.text, 0);
                  if (logar.logado) {
                    Navigator.of(context).pushNamed(logar.rota);
                  } else{
                    showMessage(message: 'Usuario ou senha inválido ',
                    context: context
                  );
                  }
                }
              },
              context: context,
              status: logar.carregando
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/cadastro');
              }, 
              child: const Text('Cadastre-se Agora'),
              ),
            // Container(
              // margin: const EdgeInsets.all(5.0),
              // child: const TextField(
                // decoration: InputDecoration(
                    // labelText: 'Nome',
                    // prefixIcon: Icon(Icons.password),
                    // enabledBorder: OutlineInputBorder(
                      // borderSide: BorderSide(
                          // color: Color.fromARGB(255, 106, 106, 106),
                          // width: 2.0),
                      // borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    // ),
                    // focusedBorder: OutlineInputBorder(
                        // borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        // borderSide:
                            // BorderSide(color: Colors.blue, width: 2.0))),
              // ),
            // ),
            // Container(
              // margin: const EdgeInsets.all(5.0),
              // child: const TextField(
                // decoration: InputDecoration(
                    // labelText: 'E-mail',
                    // prefixIcon: Icon(Icons.password),
                    // enabledBorder: OutlineInputBorder(
                      // borderSide: BorderSide(
                          // color: Color.fromARGB(255, 106, 106, 106),
                          // width: 2.0),
                      // borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    // ),
                    // focusedBorder: OutlineInputBorder(
                        // borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        // borderSide:
                            // BorderSide(color: Colors.blue, width: 2.0))),
              // ),
            // ),
            // Padding(
              // padding: const EdgeInsets.only(top: 20),
              // child: ElevatedButton(
                  // style: ElevatedButton.styleFrom(
                    // shape: RoundedRectangleBorder(
                      // borderRadius: BorderRadius.circular(5.0),
                    // ),
                  // ),
                  // onPressed: () {
                    // Navigator.of(context).pushNamed('/cadastro');
                  // },
                  // child: const Text("Cadastrar-se")),
            // )
          ],
        ),
      ),
    );
    });
    
  }
}
