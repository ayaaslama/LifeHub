import 'package:blood_life/core/theaming/stlye.dart';
import 'package:blood_life/core/widgets/app_bar.dart';
import 'package:blood_life/features/additional_service/widget/container_for_service.dart';
import 'package:flutter/material.dart';

class AdditionalService extends StatelessWidget {
  const AdditionalService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomeAppBar(
            text: 'Additional Services',
            iconColor: Colors.white,
          ),
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
              Navigator.pushNamed(context, '/bloodtest');
            },
          ),
          ContainerService(
            serviceName: 'Blood Filtration',
            image: 'assets/images/blood filtration.png',
            onTap: () {
              Navigator.pushNamed(context, '/bloodfiltration');
            },
          ),
          ContainerService(
            serviceName: 'Washed Rbcs',
            image: 'assets/images/washed rbcs.png',
            onTap: () {
              Navigator.pushNamed(context, '/washedrbcs');
            },
          ),
        ],
      ),
    );
  }
}
