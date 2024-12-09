import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sasimee/screens/main/experiment/experiment_screen.dart';
import 'package:sasimee/screens/main/main_screen.dart';
import 'package:sasimee/widgets/tag_item.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: const [Locale('ko')], // 지원 언어 목록
    path: 'assets/translations', // 번역 파일 위치
    fallbackLocale: const Locale('ko'), // 기본 언어 설정
    child: SasimeeApp(),
  ));
}

/// 라우팅 설정 (pushNamed를 통해 쉽게 화면 라우팅을 할 수 있다)
final route = {
  MainScreen.routeName: (context) => const MainScreen(),
  ExperimentScreen.routeName: (context) {
    final args = ModalRoute.of(context)!.settings.arguments as ExperimentType;
    return ExperimentScreen(type: args);
  },
};

class SasimeeApp extends StatelessWidget {
  const SasimeeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'app_name'.tr(),
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
          fontFamily: "Pretendard"
      ),
      initialRoute: MainScreen.routeName,
      routes: route,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
    );
  }
}
