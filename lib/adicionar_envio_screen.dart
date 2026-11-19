import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'envio_model.dart';

class AdicionarEnvioScreen extends StatefulWidget {
  const AdicionarEnvioScreen({Key? key}) : super(key: key);

  @override
  State<AdicionarEnvioScreen> createState() => _AdicionarEnvioScreenState();
}

class _AdicionarEnvioScreenState extends State<AdicionarEnvioScreen> {
  final _formKey = GlobalKey<FormState>();
  final _valorController = TextEditingController();
  final _destinatarioController = TextEditingController();
  final _metodoController = TextEditingController();
  final _taxaController = TextEditingController();

  void _salvarEnvio() {
    if (_formKey.currentState!.validate()) {
      final novoEnvio = Envio(
        valor: double.parse(_valorController.text),
        destinatario: _destinatarioController.text,
        metodoEnvio: _metodoController.text,
        taxaPaga: double.tryParse(_taxaController.text) ?? 0.0,
        data: DateTime.now(),
      );

      final caixaEnvios = Hive.box<Envio>('envios');
      caixaEnvios.add(novoEnvio);

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Novo Envio'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _destinatarioController,
                  decoration: const InputDecoration(labelText: 'Nome do Destinatário'),
                  validator: (value) => value!.isEmpty ? 'Insira o nome' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _valorController,
                  decoration: const InputDecoration(labelText: 'Valor Enviado'),
                  keyboardType: TextInputType.number,
                  validator: (value) => value!.isEmpty ? 'Insira o valor' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _taxaController,
                  decoration: const InputDecoration(labelText: 'Taxa da Agência (Opcional)'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _metodoController,
                  decoration: const InputDecoration(labelText: 'Método (ex: Wise, Western Union)'),
                  validator: (value) => value!.isEmpty ? 'Insira o método' : null,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: _salvarEnvio,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                  child: const Text('Guardar no Histórico', style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
