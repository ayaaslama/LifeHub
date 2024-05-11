import 'package:blood_life/core/helper/constants.dart';
import 'package:blood_life/core/routing/app_router.dart';
import 'package:blood_life/core/widgets/navigation_bar.dart';
import 'package:blood_life/features/additional_service/logic/cubit/bloodfilteration_cubit.dart';
import 'package:blood_life/features/additional_service/logic/cubit/bloodrbcs_cubit.dart';
import 'package:blood_life/features/additional_service/logic/cubit/bloodtest_cubit.dart';
import 'package:blood_life/features/donate/logic/cubit/donateblood_cubit.dart';
import 'package:blood_life/features/donate/logic/cubit/donateplasma_cubit.dart';
import 'package:blood_life/features/donate/ui/donate_screen.dart';
import 'package:blood_life/features/forget_password/logic/cubit/forgetpassword_cubit.dart';
import 'package:blood_life/features/forget_password/logic/cubit/new_password_cubit.dart';
import 'package:blood_life/features/login/logic/cubit/login_cubit.dart';
import 'package:blood_life/features/profile/logic/cubit/personal_cubit.dart';
import 'package:blood_life/features/request/logic/cubit/requestblood_cubit.dart';
import 'package:blood_life/features/request/logic/cubit/requestplasma_cubit.dart';
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
          BlocProvider(
            create: (context) => PersonalCubit(),
          ),
          BlocProvider(
            create: (context) => DonatebloodCubit(),
          ),
          BlocProvider(
            create: (context) => DonateplasmaCubit(),
          ),
          BlocProvider(
            create: (context) => RequestbloodCubit(),
          ),
          BlocProvider(
            create: (context) => RequestplasmaCubit(),
          ),
          BlocProvider(
            create: (context) => BloodfilterationCubit(),
          ),
          BlocProvider(
            create: (context) => BloodtestCubit(),
          ),
          BlocProvider(
            create: (context) => BloodrbcsCubit(),
          ),
        ],
        child: MaterialApp(
          title: 'LifeBlood App',
          theme: ThemeData(
            primaryColor: Colors.grey,
            scaffoldBackgroundColor: Colors.white,
          ),
          home: const SplashScreen(),

          debugShowCheckedModeBanner: false,
          scaffoldMessengerKey: scaffoldKey,
          onGenerateRoute: appRouter.generateRoute,

          //initialRoute: Routes.onBoardingScreen,
        ),
      ),
    );
  }
}
