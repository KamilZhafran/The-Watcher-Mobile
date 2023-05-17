import 'package:firebase_core/firebase_core.dart';
import 'package:the_watcher/feature/splash_screen.dart';
import 'package:the_watcher/firebase_options.dart';
import 'core/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Watcher',
      theme: appTheme,
      home: const SplashScreen(),
    );
  }
}