import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:journo/screens/category/classes/category_utils.dart';
import 'package:journo/utils/constants/colors.dart';
import 'package:journo/utils/constants/image_strings.dart';
import 'package:journo/utils/constants/sizes.dart';
import 'package:journo/utils/constants/text_strings.dart';
import 'package:journo/utils/helpers/helper_functions.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var selectedChipIndex = 0;
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  void scrollToIndex(int index) {
    if (itemScrollController.isAttached) {
      itemScrollController.scrollTo(
          index: index,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          alignment:
              0.3); // Adjust the alignment to keep the chip more centered
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = JHelper.isDarkMode(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            top: JSizes.defaultSpace,
            left: JSizes.defaultSpace,
            right: JSizes.defaultSpace),
        child: Column(
          children: [
            SizedBox(
                height: 50,
                child: ScrollablePositionedList.builder(
                  scrollDirection: Axis.horizontal,
                  itemScrollController: itemScrollController,
                  itemPositionsListener: itemPositionsListener,
                  itemCount: JCategoryUtils.categoryItems.length,
                  itemBuilder: (context, index) {
                    var isSelected = index == selectedChipIndex;
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: RawChip(
                        label: Text(
                          JCategoryUtils.categoryItems[index],
                          style: TextStyle(
                              color: isSelected
                                  ? JColors.white
                                  : isDark
                                      ? JColors.blue
                                      : JColors.orange,
                              fontWeight: FontWeight.w600,
                              fontSize: 12),
                        ),
                        selected: isSelected,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                            side: BorderSide(
                              color: (isDark ? JColors.blue : JColors.orange),
                              width: 2,
                            )),
                        selectedColor: isDark ? JColors.blue : JColors.orange,
                        showCheckmark: false,
                        backgroundColor: Colors.transparent,
                        onSelected: (value) => setState(() {
                          selectedChipIndex = index;
                          scrollToIndex(index);
                        }),
                      ),
                    );
                  },
                )),
            const SizedBox(
              height: JSizes.spaceBtwItems,
            ),
            Expanded(
              child: StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                itemCount: 12,
                itemBuilder: (context, index) {
                  // Determine the image height based on the row index
                  bool isFirstInRow = index % 2 == 0;
                  int rowIndex = index ~/ 2;
                  double height = (rowIndex % 2 == 0)
                      ? (isFirstInRow ? 120.0 : 230.0)
                      : (isFirstInRow ? 230.0 : 120.0);

                  return Card(
                    elevation: 1,
                    color: isDark ? JColors.black2 : JColors.white2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 7),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              height: height,
                              child: Image.asset(
                                JImages.horizontalDemo,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: JSizes.spaceBtwItems,
                          ),
                          Text(
                            JText.demoBlogText,
                            style: TextStyle(
                                color: isDark ? JColors.blue : JColors.orange,
                                fontWeight: FontWeight.w600,
                                fontSize: 12),
                          ),
                          const SizedBox(
                            height: JSizes.defaultSpace / 2,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                JText.demoDate,
                                style: TextStyle(
                                    color: JColors.textGrey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 9),
                                maxLines: 4,
                              ),
                              CircleAvatar(
                                maxRadius: 2,
                                backgroundColor: JColors.dotGrey,
                              ),
                              Text(
                                JText.demoRead,
                                style: TextStyle(
                                    color: JColors.textGrey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 9),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
                staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
              ),
            )
          ],
        ),
      ),
    );
  }
}
