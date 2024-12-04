import 'package:flutter/material.dart';
import 'package:sasimee/screens/main/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    SasimeeApp(),
  );
}

/// 라우팅 설정 (pushNamed를 통해 쉽게 화면 라우팅을 할 수 있다)
final route = {
  MainScreen.routeName: (context) => const MainScreen(),
};

class SasimeeApp extends StatelessWidget {
  const SasimeeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sasimee',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
          fontFamily: "Pretendard"
      ),
      initialRoute: MainScreen.routeName,
      routes: route,
    );
  }
}
