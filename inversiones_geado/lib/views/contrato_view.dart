import 'package:flutter/material.dart';
import 'package:inversiones_geado/viewmodels/contrato_viewmodel.dart';

class ContratoView extends StatelessWidget {
  final ContratoViewModel contratoViewModel = ContratoViewModel();

  final TextEditingController reservaController = TextEditingController();
  final TextEditingController plataformaController = TextEditingController();
  final TextEditingController direccionController = TextEditingController();
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidosController = TextEditingController();
  final TextEditingController identidadController = TextEditingController();
  final TextEditingController nacionalidadController = TextEditingController();
  final TextEditingController ciudadController = TextEditingController();
  final TextEditingController motivoController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController ocupacionController = TextEditingController();
  final TextEditingController pagoController = TextEditingController();
  final TextEditingController duracionController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario de Contrato'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTextField(reservaController, 'Reserva No.'),
              _buildTextField(plataformaController, 'Plataforma'),
              _buildTextField(direccionController, 'Dirección'),
              _buildTextField(nombreController, 'Nombre del Huésped'),
              _buildTextField(apellidosController, 'Apellidos del Huésped'),
              _buildTextField(identidadController, 'Número de Identidad'),
              _buildTextField(nacionalidadController, 'Nacionalidad'),
              _buildTextField(ciudadController, 'Ciudad de Residencia'),
              _buildTextField(motivoController, 'Motivo del Viaje'),
              _buildTextField(correoController, 'Correo Electrónico'),
              _buildTextField(ocupacionController, 'Ocupación'),
              _buildTextField(pagoController, 'Medio de Pago'),
              _buildTextField(duracionController, 'Duración (días)',
                  isNumeric: true),
              _buildTextField(telefonoController, 'Teléfono', isNumeric: true),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final datosContrato = {
                    "reserva_no": reservaController.text,
                    "plataforma": plataformaController.text,
                    "direccion": direccionController.text,
                    "nombre_huesped": nombreController.text,
                    "apellidos_huesped": apellidosController.text,
                    "numero_identidad": identidadController.text,
                    "nacionalidad": nacionalidadController.text,
                    "ciudad_residencia": ciudadController.text,
                    "motivo_viaje": motivoController.text,
                    "correo_electronico": correoController.text,
                    "ocupacion": ocupacionController.text,
                    "medio_pago": pagoController.text,
                    "duracion": int.parse(duracionController.text),
                    "telefono": telefonoController.text,
                  };

                  String response =
                      await contratoViewModel.enviarContrato(datosContrato);
                  if (response == 'success') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Contrato enviado con éxito!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                    Navigator.pushNamed(context, '/');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Error al enviar el contrato: $response'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      {bool isNumeric = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
      ),
    );
  }
}
