import 'package:flutter/material.dart';
import 'package:hena_gym/frontend/screens/market/product_screen.dart';
import 'package:hena_gym/frontend/screens/settings/settings_screen.dart';
import 'package:provider/provider.dart';
import 'data/models/my_user.dart';
import 'data/repository/auth_repo.dart';
import 'data/services/auth_services.dart';
import 'utils/logger.dart';
import 'constants/my_gui.dart';
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
    return StreamProvider<MyUser?>.value(
      value: AuthRepository(AuthServices()).user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,

        theme: ThemeData(primarySwatch: buildMaterialColor(MyColors.darkRed)),
      ),
    );
  }
}

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}
