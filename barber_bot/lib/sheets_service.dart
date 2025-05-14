import 'package:gsheets/gsheets.dart';
import 'package:dotenv/dotenv.dart' show env, load;

Future<void> salvarNoSheets(String nome, String telefone, String horario) async {
  load();
  final gsheets = GSheets(env['GSHEETS_CREDENTIALS']!);
  final ss = await gsheets.spreadsheet(env['SPREADSHEET_ID']!);
  final sheet = ss.worksheetByTitle('Agendamentos');

  await sheet?.values.appendRow([nome, telefone, horario]);
}
