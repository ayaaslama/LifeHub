// import 'package:blood_life/core/helper/extension.dart';
// import 'package:blood_life/core/routing/routes.dart';
// import 'package:blood_life/core/theaming/color.dart';
// import 'package:blood_life/core/theaming/stlye.dart';
// import 'package:blood_life/core/widgets/app_text_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:intl/intl.dart';

// class HelpUs extends StatefulWidget {
//   HelpUs({super.key, this.padding, this.right});

//   final double? padding;

//   final double? right;

//   @override
//   State<HelpUs> createState() => _HelpUsState();
// }

// class _HelpUsState extends State<HelpUs> {
 
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         scrollDirection: Axis.vertical,
//         shrinkWrap: true,
//         itemCount: data.length,
//         itemBuilder: (context, i) {
//           final data = data[i];
//           final hospitalCenter = data['hospitalCenter'];
//           final bloodType = data['bloodType'];
//           final dateFormat = DateFormat('MM/dd/yyyy');
//           final date = dateFormat.format(dateFormat.parse(data['d']));
//           if (i < data.length) {
//             final data = data[i];
//             final hospitalCenter = data['hospitalCenter'];
//             final bloodType = data['bloodType'];
//             final dateFormat = DateFormat('MM/dd/yyyy');
//             final date = dateFormat.format(dateFormat.parse(data['d']));

//             return Padding(
//               padding: EdgeInsets.only(
//                   bottom: 20.0,
//                   left: widget.padding ?? 0.0,
//                   right: widget.right ?? 0.0),
//               child: Center(
//                 child: Container(
//                   width: 343,
//                   height: 135.h,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(16),
//                     color: Colors.white,
//                     boxShadow: const [
//                       BoxShadow(
//                         color: Color.fromRGBO(217, 217, 217, 1),
//                         spreadRadius: 0,
//                         blurRadius: 4,
//                       ),
//                     ],
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Expanded(
//                               child: Padding(
//                                 padding: const EdgeInsets.only(left: 20.0),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(nameHospital,
//                                         style:
//                                             TextStyles.font14mainK7lysemiBold),
//                                     Text(location,
//                                         style: TextStyles.font13GreyRegular),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Text(
//                               bloodName,
//                               style: TextStyles.font22mainRedbold,
//                             )
//                           ],
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(top: 5.h, right: 0),
//                           child: AppTextButton(
//                             textButton: "Donate Now",
//                             onPressed: () {
//                               context.pushNamed(Routes.donateBlood);
//                             },
//                             backgroundColor: ManagerColor.mainred,
//                             buttonWidth: 300.w,
//                             buttonHeight: 46.h,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           }
//         });
//   }
// }
