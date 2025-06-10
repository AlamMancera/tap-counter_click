import 'package:flutter/material.dart';

// Pantalla principal del contador
class CounterScreen extends StatefulWidget {
  
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
// Variable para contar los clics (actualmente no cambia)
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior de la app con título centrado
      appBar: AppBar(title: Text("Counter Screen"), centerTitle: true),
      body: Center(
        // Centra el contenido en la pantalla
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Muestra el número del contador (actualmente fijo en 10)
            Text(
              "$clickCounter",
              style: TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
            ),
            // Texto descriptivo debajo del número
            Text("Clic${clickCounter == 1 ? "": "s"}", style: TextStyle(fontSize: 25)),
          ],
        ),
      ),
      // Botón flotante para incrementar el contador (aún sin lógica)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Incrementa el contador al hacer clic
          clickCounter++;
          // Actualiza el estado para reflejar el cambio en la UI
          setState(() {});
        },
        child: Icon(Icons.plus_one),
      ),
    );
  }
}
