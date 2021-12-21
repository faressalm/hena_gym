import 'package:flutter/material.dart';
import 'utils/logger.dart';
import 'constants/my_gui.dart';
import 'frontend/screens/authenticate/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'utils/theme_utils.dart';
import 'frontend/app_router.dart';

Future<void> main() async {
  await initializeApp();
  runApp(HenaGym(appRouter: AppRouter()));
  ApplicationLogger.getLogger("<main>").v("<gone through>");
}

class HenaGym extends StatelessWidget {
  final AppRouter appRouter;
  const HenaGym({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
      theme: ThemeData(primarySwatch: buildMaterialColor(MyColors.darkRed)),
    );
  }
}

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}
