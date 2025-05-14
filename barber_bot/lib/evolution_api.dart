import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dotenv/dotenv.dart' show env, load;

Future<bool> agendarNaEvolution(String nome, String telefone, String horario) async {
  load(); // carrega variáveis do .env

  final url = Uri.parse('\${env['EVOLUTION_URL']}/agendamentos');
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer \${env['EVOLUTION_TOKEN']}',
    },
    body: jsonEncode({
      'cliente': nome,
      'telefone': telefone,
      'horario': horario,
      'servico': 'Corte'
    }),
  );

  return response.statusCode == 201;
}
