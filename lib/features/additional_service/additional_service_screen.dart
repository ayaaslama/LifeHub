import 'package:blood_life/core/helper/extension.dart';
import 'package:blood_life/core/routing/routes.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:blood_life/features/additional_service/widget/container_for_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdditionalService extends StatelessWidget {
  const AdditionalService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ManagerColor.mainred,
        title: Text(
          'Additional Services',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            context.pushReplacementNamed(Routes.myNavigationBar);
          },
          icon: const Icon(Icons.arrow_back_ios_sharp),
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Note , This Services may be payed , please\n ask the center for more Details',
              style: TextStyles.font16GreysemiBold,
            ),
          ),
          ContainerService(
            serviceName: 'More Blood Tests..',
            image: 'assets/images/bloodtest.png',
            onTap: () {
              context.pushNamed(Routes.bloodTest);
            },
          ),
          ContainerService(
            serviceName: 'Blood Filtration',
            image: 'assets/images/blood filtration.png',
            onTap: () {
              context.pushNamed(Routes.bloodFiltration);
            },
          ),
          ContainerService(
            serviceName: 'Washed Rbcs',
            image: 'assets/images/washed rbcs.png',
            onTap: () {
              context.pushNamed(Routes.washedRcbs);
            },
          ),
        ],
      ),
    );
  }
}
