import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'envio_model.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final caixaEnvios = Hive.box<Envio>('envios');

    return Scaffold(
      appBar: AppBar(
        title: const Text('MeuEnvio: Controle'),
        backgroundColor: Colors.teal,
      ),
      body: ValueListenableBuilder(
        valueListenable: caixaEnvios.listenable(),
        builder: (context, Box<Envio> box, _) {
          if (box.values.isEmpty) {
            return const Center(
              child: Text(
                'Nenhum envio registrado.\nToque no + para começar!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }

          final envios = box.values.toList().cast<Envio>();

          return ListView.builder(
            itemCount: envios.length,
            itemBuilder: (context, index) {
              final envio = envios[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  leading: const Icon(Icons.send, color: Colors.teal),
                  title: Text(envio.destinatario),
                  subtitle: Text('${envio.metodoEnvio} • ${envio.data.day}/${envio.data.month}/${envio.data.year}'),
                  trailing: Text(
                    '${envio.valor.toStringAsFixed(2)}',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.green),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/adicionar');
        },
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
