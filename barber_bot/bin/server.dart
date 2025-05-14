import 'dart:convert';
import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import '../lib/bot_controller.dart';

void main() async {
  final handler = Pipeline().addMiddleware(logRequests()).addHandler(_router);
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await io.serve(handler, InternetAddress.anyIPv4, port);
  print('Servidor rodando em http://localhost:\$port');
}

Future<Response> _router(Request request) async {
  if (request.method == 'POST' && request.url.path == 'agendar') {
    final payload = await request.readAsString();
    final data = jsonDecode(payload);
    final resultado = await processarAgendamento(data);
    return Response.ok(jsonEncode({'status': resultado}));
  }

  return Response.notFound('Rota não encontrada');
}
