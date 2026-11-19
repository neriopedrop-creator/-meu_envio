import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import './envio_model.dart';
import './dashboard_screen.dart';
import './adicionar_envio_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(EnvioAdapter());
  await Hive.openBox<Envio>('envios');

  runApp(const MeuEnvioApp());
}

class MeuEnvioApp extends StatelessWidget {
  const MeuEnvioApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MeuEnvio: Controle de Remessas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const DashboardScreen(),
        '/adicionar': (context) => const AdicionarEnvioScreen(),
      },
    );
  }
}
