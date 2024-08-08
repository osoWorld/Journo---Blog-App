import 'package:flutter/material.dart';
import 'package:journo/utils/constants/colors.dart';
import 'package:journo/utils/constants/sizes.dart';
import 'package:journo/utils/constants/text_strings.dart';
import 'package:journo/utils/helpers/helper_functions.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  var isApproved = false;

  @override
  Widget build(BuildContext context) {
    final isDark = JHelper.isDarkMode(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            top: JSizes.defaultSpace,
            left: JSizes.defaultSpace,
            right: JSizes.defaultSpace),
        child: ListView.builder(
          itemCount: 8,
          itemBuilder: (context, index) {
            return Card(
              elevation: 1,
              color: isDark ? JColors.black2 : JColors.white2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 120,
                          child: LinearProgressIndicator(
                            value: 0.5,
                            minHeight: 11,
                            valueColor: AlwaysStoppedAnimation(
                                isApproved ? JColors.green : JColors.red),
                            backgroundColor:
                                isDark ? JColors.black2 : JColors.white2,
                          ),
                        ),
                        Text(
                          JText.demoTime,
                          style: TextStyle(
                              color: isDark ? JColors.blue : JColors.orange,
                              fontSize: 10,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: JSizes.spaceBtwSections / 2,
                    ),
                    Text(
                      JText.demoNotification,
                      style: TextStyle(
                          color: isDark ? JColors.blue : JColors.orange,
                          fontWeight: FontWeight.w600,
                          fontSize: 12),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
