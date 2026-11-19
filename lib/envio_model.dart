import 'package:hive/hive.dart';

part 'envio_model.g.dart';

@HiveType(typeId: 0)
class Envio extends HiveObject {
  @HiveField(0)
  final double valor;

  @HiveField(1)
  final String destinatario;

  @HiveField(2)
  final String metodoEnvio;

  @HiveField(3)
  final double taxaPaga;

  @HiveField(4)
  final DateTime data;

  Envio({
    required this.valor,
    required this.destinatario,
    required this.metodoEnvio,
    required this.taxaPaga,
    required this.data,
  });
}
