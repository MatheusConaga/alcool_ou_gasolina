import "package:flutter/material.dart";


class AlcoolGasolina extends StatefulWidget {
  const AlcoolGasolina({super.key});

  @override
  State<AlcoolGasolina> createState() => _AlcoolGasolinaState();
}

class _AlcoolGasolinaState extends State<AlcoolGasolina> {
  TextEditingController _alcoolController = TextEditingController();
  TextEditingController _gasolinaController = TextEditingController();
  String _resultadoText = "Resultado";

  void _Calcular(){
    String alcoolText = _alcoolController.text.replaceAll(',', '.');
    String gasolinaText = _gasolinaController.text.replaceAll(',', '.');

    double? precoAlcool = double.tryParse(alcoolText);
    double? precoGasolina = double.tryParse(gasolinaText);

    if (precoAlcool == null || precoGasolina == null){
      setState(() {
        _resultadoText = "Número inválido, insira pelo menos um número em cada campo";
      });
    } else{
      var resultado = (precoAlcool/precoGasolina);
      if(resultado >= 0.7){
        setState(() {
          _resultadoText = "Melhor abastecer com gasolina";
        });
      } else{
        setState(() {
          _resultadoText = "Melhor abastecer com alcool";
        });
      }
      _LimparCampos();
    }
  }
  void _LimparCampos(){
    _gasolinaController.text = "";
    _alcoolController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Álcool ou Gasolina",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Image.asset("images/logo.png"),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Saiba qual a melhor opção para abastecimento do seu carro",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Preço Alcool, ex: 1.59",
                  ),
                  style: TextStyle(
                    fontSize: 22,
                  ),
                  controller: _alcoolController,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Preço Gasolina, ex: 3.15",
                  ),
                  style: TextStyle(
                    fontSize: 22,
                  ),
                  controller: _gasolinaController,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                ),
                child: Text(
                  "Calcular",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: _Calcular,
              ),
              Padding(
                padding: EdgeInsets.only(top: 32,),
                child: Text(
                    _resultadoText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
