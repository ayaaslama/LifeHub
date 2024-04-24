import 'package:blood_life/core/routing/app_router.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/features/Additional_Service/additional_service_screen.dart';
import 'package:blood_life/features/additional_service/blood_filtration_service.dart';
import 'package:blood_life/features/additional_service/blood_test_service.dart';
import 'package:blood_life/features/additional_service/washed_rbcs_service.dart';
import 'package:blood_life/features/ai_generator/ui/ai_generator.dart';
import 'package:blood_life/features/donate/ui/book_blood_screen.dart';
import 'package:blood_life/features/donate/ui/book_plasma_screen.dart';
import 'package:blood_life/features/donate/ui/donate_blood_screen.dart';
import 'package:blood_life/features/forget_password/ui/forget_password.dart';
import 'package:blood_life/features/forget_password/ui/new_password.dart';
import 'package:blood_life/features/home/ui/after_donate_screen.dart';
import 'package:blood_life/features/home/ui/befor_donate_screen.dart';
import 'package:blood_life/features/home/ui/home_screen.dart';
import 'package:blood_life/features/home/ui/in_center_screen.dart';
import 'package:blood_life/features/home/ui/notfication_screen.dart';
import 'package:blood_life/features/home/ui/widgets/buttom_navigation_bar.dart';
import 'package:blood_life/features/map/map_screen.dart';
import 'package:blood_life/features/profile/guidline/guidlines_screen.dart';
import 'package:blood_life/features/profile/profile_screen.dart';
import 'package:blood_life/features/profile/setting/setting_screen.dart';
import 'package:blood_life/features/request/ui/book_request_blood_screen.dart';
import 'package:blood_life/features/request/ui/book_request_plasma_screen.dart';
import 'package:blood_life/features/request/ui/request_blood_screen.dart';
import 'package:blood_life/features/signup/ui/signup_screen.dart';
import 'package:blood_life/features/splash/splash_screen.dart';
import 'package:blood_life/features/login/ui/login.dart';
import 'package:blood_life/features/verify/email_verifiction.dart';
import 'package:blood_life/features/verify/otp_verifiction.dart';
import 'package:flutter/material.dart';
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
      child: MaterialApp(
        title: 'LifeBlood App',
        theme: ThemeData(
          primaryColor: ManagerColor.mainred,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: const SplashScreen(),
        routes: {
          '/signup': (context) => const SignUp(),
          '/login': (context) => const LogIn(),
          //'/authentication': (context) => const Authentication(),
          '/otp_verifiction': (context) => const OtpVerifiction(),
          '/ne_password': (context) => const NewPassword(),
          '/befor_donate': (context) => const BeforDonate(),
          '/home': (context) => const HomePage(),
          '/after_donate': (context) => const AfterDonate(),
          '/in_center': (context) => const InCenter(),
          '/donate_blood': (context) => const DonateBlood(),
          '/blood_donate': (context) => const DonateBlood(),
          '/blood_requset': (context) => const RequestBloodScreen(),
          '/book_blood': (context) => const BookBloodScreen(),
          '/book_plasma': (context) => const BookPlasmaScreen(),
          '/blood_search': (context) => const SearchBloodScreen(),
          '/plasma_search': (context) => const SearchPlasmaScreen(),
          '/notefication': (context) => const NoteficationScreen(),
          '/map': (context) => const MapScreen(),
          '/profile': (context) => const ProfileSreen(),
          '/setting': (context) => const SettingScreen(),
          '/navigationbar': (context) => const MyNavigationBar(),
          '/service': (context) => const AdditionalService(),
          '/bloodtest': (context) => const BloodTest(),
          '/bloodfiltration': (context) => const BloodFiltration(),
          '/washedrbcs': (context) => const WashedRcbs(),
          '/guidlines': (context) => const GuidlinesScreen(),
          '/email_for_forget_password': (context) =>
              const EmailForForgetPassword(),
          '/email_for_verify': (context) => const EmailForVerify(),
          '/new-password': (context) => const NewPassword(),
          '/ai_generator': (context) => const AiGenerator(),
        },

        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,

        //initialRoute: Routes.onBoardingScreen,
      ),
    );
  }
}
