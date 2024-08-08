import 'package:flutter/material.dart';
import 'package:journo/utils/constants/colors.dart';
import 'package:journo/utils/constants/image_strings.dart';
import 'package:journo/utils/constants/sizes.dart';
import 'package:journo/utils/constants/text_strings.dart';
import 'package:journo/utils/helpers/helper_functions.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final isDark = JHelper.isDarkMode(context);
    return Scaffold(
      backgroundColor: isDark ? JColors.blue : JColors.orange,
      // body: Padding(
      //   padding: const EdgeInsets.all(JSizes.defaultSpace),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       CircleAvatar(
      //         maxRadius: 44.5,
      //         child: ClipOval(
      //           child: SizedBox(
      //             height: 100,
      //             width: 100,
      //             child: Image.asset(
      //               JImages.profilePlaceHolder,
      //               fit: BoxFit.cover,
      //             ),
      //           ),
      //         ),
      //       ),
      //       const SizedBox(
      //         height: JSizes.spaceBtwItems,
      //       ),
      //       const Text(
      //         JText.demoName,
      //         style: TextStyle(
      //             color: JColors.white,
      //             fontSize: 16,
      //             fontWeight: FontWeight.w600),
      //       ),
      //       const SizedBox(height: JSizes.spaceBtwSections / 2,),
      //       const Text(
      //         JText.demoBio,
      //         style: TextStyle(
      //             color: JColors.white2,
      //             fontWeight: FontWeight.w400,
      //             fontSize: 13,),
      //         textAlign: TextAlign.center,
      //         maxLines: 4,
      //         overflow: TextOverflow.ellipsis,
      //       ),
      //       const SizedBox(height: JSizes.spaceBtwSections,),
      //       const Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceAround,
      //         children: [
      //           Column(
      //             children: [
      //               Text("6", style: TextStyle(color: JColors.white, fontWeight: FontWeight.bold, fontSize: 16),),
      //               Text('Posts', style: TextStyle(color: JColors.white, fontWeight: FontWeight.w400, fontSize: 16),)
      //             ],
      //           ),
      //
      //           // Divider(height: 4, color: Colors.white,),
      //           Column(
      //             children: [
      //               Text("13", style: TextStyle(color: JColors.white, fontWeight: FontWeight.bold, fontSize: 16),),
      //               Text('Followings', style: TextStyle(color: JColors.white, fontWeight: FontWeight.w400, fontSize: 16),)
      //             ],
      //           ),
      //         ],
      //       ),
      //
      //       Expanded(
      //         child: Align(
      //           alignment: Alignment.bottomCenter,
      //           child: SizedBox(height: 100,),
      //         ),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}