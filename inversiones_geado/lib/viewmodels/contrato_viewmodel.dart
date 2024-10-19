import 'package:http/http.dart' as http;
import 'dart:convert';

class ContratoViewModel {
  Future<String> enviarContrato(Map<String, dynamic> datosContrato) async {
    final String url =
        'http://143.110.234.164:8000/formulario_registro/api/crear-contrato/'; // Cambia a 127.0.0.1 si no es emulador Android
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
            datosContrato), // Asegurarse de enviar los datos en formato JSON
      );

      if (response.statusCode == 201) {
        return 'success'; // Envío exitoso
      } else {
        return 'error: ${response.statusCode}'; // Error con el código de estado
      }
    } catch (e) {
      return 'error: $e';
    }
  }
}
