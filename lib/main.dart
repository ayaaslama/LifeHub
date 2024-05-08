import 'package:blood_life/core/helper/constants.dart';
import 'package:blood_life/core/routing/app_router.dart';
import 'package:blood_life/core/widgets/navigation_bar.dart';
import 'package:blood_life/features/forget_password/logic/cubit/forgetpassword_cubit.dart';
import 'package:blood_life/features/forget_password/logic/cubit/new_password_cubit.dart';
import 'package:blood_life/features/login/logic/cubit/login_cubit.dart';
import 'package:blood_life/features/signup/logic/cubit/signup_cubit.dart';
import 'package:blood_life/features/splash/splash_screen.dart';
import 'package:blood_life/features/verifiction/logic/cubit/cubit/code_verify_cubit.dart';
import 'package:blood_life/features/verifiction/logic/cubit/cubit/email_verify_cubit.dart';

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
          ),
          BlocProvider(
            create: (context) => ForgetpasswordCubit(),
          ),
          BlocProvider(
            create: (context) => EmailVerifyCubit(),
          ),
          BlocProvider(
            create: (context) => CodeVerifyCubit(),
          ),
          BlocProvider(
            create: (context) => NewPasswordCubit(),
          ),
          BlocProvider(
            create: (context) => SignupCubit(),
          ),
        ],
        child: MaterialApp(
          title: 'LifeBlood App',
          theme: ThemeData(
            primaryColor: Colors.grey,
            scaffoldBackgroundColor: Colors.white,
          ),
          home: const MyNavigationBar(),

          debugShowCheckedModeBanner: false,
          scaffoldMessengerKey: scaffoldKey,
          onGenerateRoute: appRouter.generateRoute,

          //initialRoute: Routes.onBoardingScreen,
        ),
      ),
    );
  }
}
