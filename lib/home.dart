import 'package:flutter/material.dart';
import 'package:appimc/imc.dart';
import 'package:appimc/resultado.dart';

class HomeIMC extends StatefulWidget {
  @override
  _HomeIMCState createState() => _HomeIMCState();
}

class _HomeIMCState extends State<HomeIMC> {
  TextEditingController _alturaController = TextEditingController();
  TextEditingController _pesoController = TextEditingController();

  // Lipar os campos da tela:
  void _limparCampos() {
    _alturaController.text = "";
    _pesoController.text = "";
  }

  void _btnCalcularIMC() {
    //Obtem os valores de altura e peso a partir dos controllers
    //dos campos de texto:
    double alt = double.parse(_alturaController.text);
    double pes = double.parse(_pesoController.text);

    var myImc = IMC(altura: alt, peso: pes);

    //Realiza a nevegação para a próxima tela (resultado)
    //instanciando o widget IMCResultado e passando os parâmetros
    //necessários:
    setState(() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => IMCResultado(
                    imc: myImc,
                  )));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        actions: [],
      ),
    );
  }
}
