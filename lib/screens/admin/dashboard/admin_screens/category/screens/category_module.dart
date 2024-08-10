import 'package:flutter/material.dart';
import 'package:journo/screens/admin/dashboard/admin_dashboard.dart';
import 'package:journo/utils/constants/colors.dart';
import 'package:journo/utils/constants/sizes.dart';
import 'package:journo/utils/constants/text_strings.dart';
import 'package:journo/utils/helpers/helper_functions.dart';
import 'package:journo/widgets/common/buttons/main_button.dart';

class AdminCategoryModule extends StatefulWidget {
  const AdminCategoryModule({super.key, required this.module});

  @override
  State<AdminCategoryModule> createState() => _AdminCategoryModuleState();
  final String module;
}

class _AdminCategoryModuleState extends State<AdminCategoryModule> {
  final _titleController = TextEditingController();
  int _wordCount = 0;

  @override
  void initState() {
    super.initState();
    _titleController.addListener(_updateWordCount);
  }

  @override
  void dispose() {
    _titleController.removeListener(_updateWordCount);
    _titleController.dispose();
    super.dispose();
  }

  void _updateWordCount() {
    setState(() {
      _wordCount = _titleController.text.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = JHelper.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: isDark ? JColors.blue : JColors.orange,
        centerTitle: true,
        title: Text(
          widget.module == "Add" ? JText.addNewCategory : JText.updateCategory,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: JSizes.defaultSpace,
              vertical: JSizes.spaceBtwSections),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    TextFormField(
                      controller: _titleController,
                      decoration: InputDecoration(
                          label: Text(
                            JText.catModeTitle,
                            style: TextStyle(
                                color: isDark ? JColors.blue : JColors.orange),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                color: isDark ? JColors.blue : JColors.orange,
                                width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                  color: isDark ? JColors.blue : JColors.orange,
                                  width: 2)),
                          counterText: "$_wordCount/20 characters",
                          counterStyle: TextStyle(
                              color: _wordCount > 20
                                  ? JColors.red
                                  : isDark
                                      ? JColors.blue.withOpacity(0.7)
                                      : JColors.orange.withOpacity(0.7))),
                    ),
                    const SizedBox(
                      height: JSizes.defaultSpace,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          label: Text(
                            JText.catModeSlug,
                            style: TextStyle(
                                color: isDark ? JColors.blue : JColors.orange),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                color: isDark ? JColors.blue : JColors.orange,
                                width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                  color: isDark ? JColors.blue : JColors.orange,
                                  width: 2))),
                    ),
                  ],
                ),
                MainButton(
                    buttonText: widget.module,
                    onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AdminDashboardScreen(
                            initialIndex: 1,
                          ),
                        )),
                    isDark: isDark)
              ],
            ),
          )),
    );
  }
}
