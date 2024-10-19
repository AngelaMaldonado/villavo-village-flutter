import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido a Inversiones GEADO'),
        backgroundColor: Color.fromARGB(255, 146, 184, 241),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/contrato');
              },
              child: Text('Formulario de Contrato'),
            ),
            SizedBox(height: 20), // Espacio entre los botones
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/invierte');
              },
              child: Text('Invierte con nosotros'),
            ),
          ],
        ),
      ),
    );
  }
}
