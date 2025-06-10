import 'package:flutter/material.dart';

// Pantalla principal del contador
class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  // Variable para contar los clics (actualmente no cambia)
  int clickCounter = 0;
  bool isBlocked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Barra superior de la app con título centrado
      appBar: AppBar(title: Text("Tap & Clic Counter"), centerTitle: true),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (!isBlocked) {
            setState(() {
              clickCounter++;
            });
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$clickCounter",
                style: TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
              ),
              Text(
                "Clic${clickCounter == 1 ? "" : "s"}",
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
        ),
      ),

      // Botón flotante para incrementar el contador (aún sin lógica)
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
            icon: isBlocked ? Icons.lock_open : Icons.lock,
            onPressed: () {
              setState(() {
                isBlocked = !isBlocked;
              });
            },
          ),
          SizedBox(width: 10), // Espacio entre los botones

          CustomButton(
            icon: Icons.plus_one_outlined,
            onPressed: isBlocked
                ? null
                : () {
                    setState(() {
                      clickCounter++;
                    });
                  },
          ), // Botón personalizado para incrementar
          SizedBox(width: 10), // Espacio entre los botones
          CustomButton(
            icon: Icons.refresh_outlined,
            onPressed: isBlocked
                ? null
                : () {
                    setState(() {
                      clickCounter = 0;
                    });
                  },
          ), // Botón personalizado para refrescar
          SizedBox(width: 10), // Espacio entre los botones
          CustomButton(
            icon: Icons.exposure_minus_1_outlined,
            onPressed: isBlocked
                ? null
                : () {
                    setState(() {
                      if (clickCounter > 0) {
                        clickCounter--;
                      }
                    });
                  },
          ), // Botón personalizado para decrementar
        ],
      ),
    );
  }
}

// Codigo de un botón personalizado que hereda de FloatingActionButton
class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  // El constructor recibe un icono y un clic
  const CustomButton({super.key, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: StadiumBorder(), // Forma del botón personalizada (circular)
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
