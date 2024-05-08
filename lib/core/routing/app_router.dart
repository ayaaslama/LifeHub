import 'package:blood_life/core/routing/routes.dart';
import 'package:blood_life/core/widgets/navigation_bar.dart';
import 'package:blood_life/features/additional_service/additional_service_screen.dart';
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
import 'package:blood_life/features/login/ui/login.dart';
import 'package:blood_life/features/map/map_screen.dart';
import 'package:blood_life/features/onboarding/onboarding.dart';
import 'package:blood_life/features/profile/guidline/guidlines_screen.dart';
import 'package:blood_life/features/profile/profile_screen.dart';
import 'package:blood_life/features/profile/setting/setting_screen.dart';
import 'package:blood_life/features/questionnaires/ui/questionnaires.dart';
import 'package:blood_life/features/request/ui/book_request_blood_screen.dart';
import 'package:blood_life/features/request/ui/book_request_plasma_screen.dart';
import 'package:blood_life/features/request/ui/request_blood_screen.dart';
import 'package:blood_life/features/signup/ui/signup_screen.dart';
import 'package:blood_life/features/verifiction/ui/code_verify.dart';
import 'package:blood_life/features/verifiction/ui/email_verify.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this argument to passed in any screen like this (arguments as ClassName)
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

      case Routes.logIn:
        return MaterialPageRoute(
          builder: (_) => Login(),
        );

      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => const SignUp());
      case Routes.code:
        return MaterialPageRoute(builder: (_) => CodeForVerfiy());
      case Routes.emailVerify:
        return MaterialPageRoute(builder: (_) => EmailForVerfiy());
      case Routes.forgetPassword:
        return MaterialPageRoute(builder: (_) => EmailForForgetPassword());

      // case Routes.newPassword:
      //   return MaterialPageRoute(builder: (_) => const NewPassword());

      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case Routes.donateBlood:
        return MaterialPageRoute(builder: (_) => const DonateBlood());
      case Routes.bloodRequset:
        return MaterialPageRoute(builder: (_) => const RequestBloodScreen());
      case Routes.bookBloodScreen:
        return MaterialPageRoute(builder: (_) => const BookBloodScreen());
      case Routes.bookPlasmaScreen:
        return MaterialPageRoute(builder: (_) => const BookPlasmaScreen());
      case Routes.searchBloodScreen:
        return MaterialPageRoute(builder: (_) => const SearchBloodScreen());
      case Routes.searchPlasmaScreen:
        return MaterialPageRoute(builder: (_) => const SearchPlasmaScreen());
      case Routes.noteficationScreen:
        return MaterialPageRoute(builder: (_) => const NoteficationScreen());
      case Routes.mapScreen:
        return MaterialPageRoute(builder: (_) => const MapScreen());
      case Routes.profileSreen:
        return MaterialPageRoute(builder: (_) => const ProfileSreen());
      case Routes.settingScreen:
        return MaterialPageRoute(builder: (_) => const SettingScreen());
      case Routes.myNavigationBar:
        return MaterialPageRoute(builder: (_) => const MyNavigationBar());
      case Routes.additionalService:
        return MaterialPageRoute(builder: (_) => const AdditionalService());
      case Routes.bloodTest:
        return MaterialPageRoute(builder: (_) => const BloodTest());
      case Routes.bloodFiltration:
        return MaterialPageRoute(builder: (_) => const BloodFiltration());
      case Routes.washedRcbs:
        return MaterialPageRoute(builder: (_) => const WashedRcbs());
      case Routes.guidlinesScreen:
        return MaterialPageRoute(builder: (_) => const GuidlinesScreen());
      case Routes.beforDonate:
        return MaterialPageRoute(builder: (_) => const BeforDonate());
      case Routes.inCenter:
        return MaterialPageRoute(builder: (_) => const InCenter());
      case Routes.afterDonate:
        return MaterialPageRoute(builder: (_) => const AfterDonate());
      case Routes.newPassword:
        return MaterialPageRoute(builder: (_) => NewPassword());

      // case Routes.emailForVerify:
      //   return MaterialPageRoute(builder: (_) => const EmailForVerify());
      case Routes.aiGenerator:
        return MaterialPageRoute(builder: (_) => const AiGenerator());
      case Routes.questionare:
        return MaterialPageRoute(builder: (_) => const Questionnaires());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No Route defiend For ${settings.name}'),
                  ),
                ));
    }
  }
}
