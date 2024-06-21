import 'dart:js';
import 'package:epi/Provider/admin/cadepi.dart';
import 'package:epi/Provider/admin/colaborador.dart';
import 'package:epi/Provider/admin/entrega.dart';
import 'package:epi/Provider/cadastro/valida_login.dart';
import 'package:epi/Provider/cadastro/verifica_usuario.dart';
import 'package:epi/Provider/login/logar.dart';
import 'package:epi/pages/admin/adm_entrega.dart';
import 'package:epi/pages/admin/adm_epi.dart';
import 'package:epi/pages/admin/adm_func.dart';
import 'package:epi/pages/admin/admin.dart';
import 'package:epi/pages/admin/entrega/dataentrega.dart';
import 'package:epi/pages/admin/entrega/escolheepi.dart';
import 'package:epi/pages/dashboard.dart';
import 'package:epi/pages/homepage.dart';
import 'package:epi/pages/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ValidarSenha()),
    ChangeNotifierProvider(create: (_) => UsuarioCadastro()),
    ChangeNotifierProvider(create: (_) => Logar()),
    ChangeNotifierProvider(create: (_) => CadEpiProvider()),
    ChangeNotifierProvider(create: (_) => ColaboradorProvider()),
    ChangeNotifierProvider(create: (_) => EntregaProvider()),
  ],
  child: MaterialApp(
    initialRoute: "/",
    routes: {
      '/':(context) => const HomePage(),
      '/cadastro': (context) => const SignupScreen(),
      '/dashboard': (context) => const Dashboard(),
      '/admepi' : (context) => const AdminEpi(),
      '/admfunc' : (context) => const AdmFunc(),
      '/admentrega' : (context) => const AdmEntrega(),
      '/admin' : (context) => const Admin(),
      '/episentrega' : (context) => const EpiScreen(),
      '/entrega' : (context) => EntregaScreen(),
    },
    debugShowCheckedModeBanner: false,
  ),
  ));
}