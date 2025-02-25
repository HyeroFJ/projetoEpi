// import 'package:epi/Models/epi.dart';
import 'package:epi/Services/entregaepi.dart';
// import 'package:epi/Services/epis.dart';
import 'package:flutter/material.dart';

class EntregaProvider with ChangeNotifier {
  final ApiServiceEntrega apiService = ApiServiceEntrega();

  List<dynamic> colaboradores = [];
  List<dynamic> epis = [];
  int? selectedColaborador;
  String? nomeColaborador;
  int? selectedEpi;
  String? dataValidade;
  String? dataEntrega;
  bool carregando = false;
  bool sucesso = false;

  Future<void> fetchColaboradores() async {
    carregando = true;
    colaboradores = await apiService.fetchColaboradores();
    carregando = false;
    notifyListeners();
  }

  Future<void> fetchEpis() async {
    carregando = true;
    colaboradores = await apiService.fetchEpis();
    carregando = false;
    notifyListeners();
  }
  Future<void> criarEntrega() async {
    carregando = true;

    try {
      final response = await apiService.cadastrar(selectedColaborador!, selectedEpi!, dataValidade!, dataEntrega!);

      if (response.statusCode == 200 || response.statusCode == 201) {
        sucesso = true;
        carregando = false;
        notifyListeners();
      } else {
        sucesso = false;
        notifyListeners();
      }
    } catch (e) {
      sucesso = false;
      notifyListeners();
    }
    
  }

  void setSelectedEpi(int idEpi) {
    selectedEpi = idEpi;
    notifyListeners();
  }

  void setDataValidade(String validade) {
    dataValidade = validade;
    notifyListeners();
  }

    void setDataEntrega(String entrega) {
    dataEntrega = entrega;
    notifyListeners();
  }

  void setSelectedColaborador(int idCol, String nome) {
    nomeColaborador = nome;
    selectedColaborador = idCol;
    notifyListeners();
  }

  Future<void> deleteColaborador(int idCol) async{
  carregando = true;
  final response = await apiService.deleteColaborador(idCol);
  if (response.statusCode ==  200 || response.statusCode == 204) {
    colaboradores.removeWhere((colaborador) => colaborador['idCol'] == idCol);
    notifyListeners();
  } else {
    throw Exception('Falha ao exluir Colaborador');
  }
  carregando = false;
  notifyListeners();
  }

  Future<bool>deleteEpi(int idEpi) async {
    final response = await apiService.deleteEpi(idEpi);

    if (response.statusCode == 200 || response.statusCode == 204) {
      epis.removeWhere((epi) => epi['idEpi'] == idEpi);
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }


}


