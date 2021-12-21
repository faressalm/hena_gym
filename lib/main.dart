import 'package:flutter/material.dart';
import 'package:hena_gym/utils/logger.dart';

import 'frontend/app_router.dart';

void main() {
  runApp(HenaGym(appRouter: AppRouter()));
  ApplicationLogger.getLogger("<main>").v("<gone through>");
}

class HenaGym extends StatelessWidget {
  final AppRouter appRouter;
  const HenaGym({Key? key, required this.appRouter}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
