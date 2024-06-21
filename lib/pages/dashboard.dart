import 'package:epi/Models/colaborador_epi.dart';
import 'package:epi/Models/epi.dart';
import 'package:epi/Services/epis.dart';
import 'package:epi/Utils/mensage.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final ApiService _apiService = ApiService();
  List<ColaboradorEpi> _epis = [];

  @override
  void initState() {
    super.initState();
    _consumirEpis();
  }

  Future<void> _consumirEpis() async {
    try {
      List<ColaboradorEpi> epis = await _apiService.buscarEpis();
      setState(() {
        _epis = epis;
      });
    } catch (e) {
      showMessage(message: "Erro ao carregar dados...", context: context);
    }
  }

  void _mostrarEpisDetalhes(int idEpi) async {
    try {
      Epi epiDetalhes = await _apiService.detalhesEpi(idEpi);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(epiDetalhes.nome),
              content: Text(epiDetalhes.instrucaoUso),
              actions: <Widget>[
                TextButton(
                    child: Text('Fechar'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    })
              ],
            );
          });
    } catch (e) {
      showMessage(message: "Erro");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de EPIs'),
      ),
      body: ListView.builder(
          itemCount: _epis.length,
          itemBuilder: (context, index) {
            final epi = _epis[index];
            return ListTile(
              title: Text('Data de Validade: ${epi.dataValidade}'),
              subtitle: Text('Data de Validade: ${epi.dataEntrega}'),
            );
          }),
    );
  }
}
