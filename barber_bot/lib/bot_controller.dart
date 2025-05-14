import 'evolution_api.dart';
import 'sheets_service.dart';

Future<String> processarAgendamento(Map<String, dynamic> data) async {
  final nome = data['nome'];
  final telefone = data['telefone'];
  final horario = data['horario'];

  final sucessoApi = await agendarNaEvolution(nome, telefone, horario);
  if (!sucessoApi) return 'Erro ao agendar na Evolution';

  await salvarNoSheets(nome, telefone, horario);
  return 'Agendamento realizado com sucesso!';
}
