import 'package:flutter/material.dart';
import 'package:journo/screens/admin/dashboard/admin_screens/tags/screens/admin_tags_module.dart';
import 'package:journo/utils/constants/colors.dart';
import 'package:journo/utils/constants/text_strings.dart';
import 'package:journo/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/sizes.dart';

class AdminTagsScreen extends StatefulWidget {
  const AdminTagsScreen({super.key});

  @override
  State<AdminTagsScreen> createState() => _AdminTagsScreenState();
}

class _AdminTagsScreenState extends State<AdminTagsScreen> {
  final List<String> tags = [
    JText.tagOkiewe,
    JText.tagTesting,
    JText.tagLol,
    JText.tagHuss,
    JText.tagLala,
    JText.tagMast,
    JText.tagHaha,
    JText.tagEntertainment,
    JText.tagMyTag,
    JText.tagNewTagsNow,
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = JHelper.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDark ? JColors.blue : JColors.orange,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          JText.addTags,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
        ),
        actions: [
          IconButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminTagsModule(module: "Add"),
                  )),
              icon: Icon(
                Icons.add,
                color: Colors.white,
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            top: JSizes.defaultSpace,
            left: JSizes.defaultSpace,
            right: JSizes.defaultSpace),
        child: ListView.builder(
          itemCount: tags.length,
          itemBuilder: (context, index) {
            return Card(
              color: JColors.white,
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(" ${index + 1}"),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          tags[index],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () =>
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                              const AdminTagsModule(
                                  module: "Update"),
                            )),
                            icon: const Icon(
                              Icons.edit,
                              color: JColors.green,
                            )),
                        IconButton(
                            onPressed: () => {},
                            icon: const Icon(
                              Icons.delete,
                              color: JColors.red,
                            ))
                      ],
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
