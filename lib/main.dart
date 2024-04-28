import 'package:blood_life/core/helper/constants.dart';
import 'package:blood_life/core/routing/app_router.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/features/login/logic/cubit/login_cubit.dart';
import 'package:blood_life/features/splash/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(BloodLife(
    appRouter: AppRouter(),
  ));
}

class BloodLife extends StatelessWidget {
  const BloodLife({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginCubit(),
          )
        ],
        child: MaterialApp(
          title: 'LifeBlood App',
          theme: ThemeData(
            primaryColor: ManagerColor.mainred,
            scaffoldBackgroundColor: Colors.white,
          ),
          home: const SplashScreen(),

          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          onGenerateRoute: appRouter.generateRoute,

          //initialRoute: Routes.onBoardingScreen,
        ),
      ),
    );
  }
}
