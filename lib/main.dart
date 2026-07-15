import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TelaPrincipal());
  }
}

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  final TextEditingController _DistanciaKM = TextEditingController();
  final TextEditingController _PrecoCombustivel = TextEditingController();
  final TextEditingController _ConsumoVeiculo = TextEditingController();
  final TextEditingController _VelocidadeMedia = TextEditingController();

  final TextEditingController _DistanciaTempo = TextEditingController();

  String mensagemCusto = "Mensagem do custo";
  String mensagemTempo = "Mensagem do tempo";

  void calcularCusto() {
    double distancia = double.tryParse(_DistanciaKM.text) ?? 0.0;
    double precoCombustivel = double.tryParse(_PrecoCombustivel.text) ?? 0.0;
    double consumo = double.tryParse(_ConsumoVeiculo.text) ?? 0.0;

    String custo = ((distancia / consumo) * precoCombustivel).toStringAsFixed(
      2,
    );

      if (distancia <= 0 || precoCombustivel <= 0 || consumo <= 0) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Digite valores válidos")));
      } else {
        setState(() {
           mensagemCusto = "O custo é: $custo";
        });    
      }
  }

  void calcularTempo() {
    double distancia = double.tryParse(_DistanciaTempo.text) ?? 0.0;
    double velocidadeMedia = double.tryParse(_VelocidadeMedia.text) ?? 0.0;

    String tempoViagem = (distancia / velocidadeMedia).toStringAsFixed(2);

    if (distancia <= 0 || velocidadeMedia <= 0) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Digite valores válidos")));
    } else {
      setState(() {
        mensagemTempo = "O tempo de viagem será aproximadamente de $tempoViagem horas";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Prova 2 - Mobile")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: _DistanciaKM,
                decoration: InputDecoration(labelText: "Adicione os KM"),
              ),

              SizedBox(height: 10),

              TextField(
                controller: _PrecoCombustivel,
                decoration: InputDecoration(
                  labelText: "Adicione o preço do combustível",
                ),
              ),

              SizedBox(height: 10),

              TextField(
                controller: _ConsumoVeiculo,
                decoration: InputDecoration(
                  labelText: "Adicione o consumo do veículo",
                ),
              ),

              SizedBox(height: 10),

              ElevatedButton(
                onPressed: calcularCusto,
                child: Text("Calcular custo da viagem"),
              ),

              SizedBox(height: 10),

              Text(mensagemCusto),

              SizedBox(height: 50),

              TextField(
                controller: _DistanciaTempo,
                decoration: InputDecoration(
                  labelText: "Adicione a distância em KM",
                ),
              ),

              SizedBox(height: 10),

              TextField(
                controller: _VelocidadeMedia,
                decoration: InputDecoration(
                  labelText: "Adicione a velocidade média que pretende dirigir",
                ),
              ),

              SizedBox(height: 10),

              ElevatedButton(
                onPressed: calcularTempo,
                child: Text("Calcular tempo de viagem"),
              ),

              SizedBox(height: 10),

              Text(mensagemTempo),
            ],
          ),
        ),
      ),
    );
  }
}
