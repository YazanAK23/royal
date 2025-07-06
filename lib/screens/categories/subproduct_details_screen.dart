import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royal/widgets/custom_app_bar.dart';
import 'package:royal/widgets/custom_bottom_nav_bar.dart';
import 'package:royal/widgets/custom_drawer.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/routes/app_routes.dart';
import '../../core/constants/app_text_styles.dart';

final List<Map<String, String>> _tableRows = [
  {'productNo': '01-0010', 'itemName': 'Nipple', 'size': '3', 'length': '-'},
  {'productNo': '01-0010', 'itemName': 'Pipe', 'size': '4', 'length': '4'},
  {'productNo': '01-0010', 'itemName': 'Nipple', 'size': '4', 'length': '0.5'},
  {'productNo': '01-0010', 'itemName': 'Pipe', 'size': '6', 'length': '4'},
  {'productNo': '01-0010', 'itemName': 'Pipe', 'size': '4', 'length': '-'},
  {'productNo': '01-0010', 'itemName': 'Pipe', 'size': '4', 'length': '4'},
  {'productNo': '01-0010', 'itemName': 'Nipple', 'size': '6', 'length': '3'},
  {'productNo': '01-0010', 'itemName': 'Pipe', 'size': '6', 'length': '1'},
];

class SubProductDetailsScreen extends StatelessWidget {
  const SubProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.subProductDetailsBackground,
      endDrawer: CustomDrawer(
        onMenuItemTap: (route) {
          Navigator.pop(context);
          Navigator.pushNamed(context, route);
        },
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppDimensions.appBarHeight.h),
        child: Builder(
          builder: (context) => CustomAppBar(
            onMenuTap: () => Scaffold.of(context).openEndDrawer(),
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              // Breadcrumb with left-aligned title and background color
              Container(
                width: double.infinity,
                color: AppColors.breadcrumbBackground,
                padding: EdgeInsets.symmetric(horizontal: AppDimensions.padding24.w),
                child: Text(
                  'Breadcrumb Title',
                  style: AppTextStyles.appBarTitle.copyWith(fontSize: 16.sp),
                ),
              ),
              // Title and navigation with background color
              Container(
                width: double.infinity,
                color: AppColors.titleBackground,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimensions.titlePaddingHorizontal,
                        vertical: AppDimensions.titlePaddingVertical,
                      ),
                      child: Center(
                        child: Text(
                          'U-PVC Drain & Sewer Pipe (SN-2)',
                          style: AppTextStyles.titleText,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimensions.titlePaddingHorizontal,
                        vertical: 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacementNamed(
                                AppRoutes.subProductDetail,
                                arguments: {'direction': 'previous'},
                              );
                            },
                            child: const Row(
                              children: [
                                Icon(Icons.chevron_left, color: AppColors.iconBlue, size: 18),
                                SizedBox(width: 2),
                                Text('Previous product',
                                    style: TextStyle(color: AppColors.iconBlue, fontSize: 12)),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacementNamed(
                                AppRoutes.subProductDetail,
                                arguments: {'direction': 'next'},
                              );
                            },
                            child: const Row(
                              children: [
                                Icon(Icons.chevron_right, color: AppColors.iconLightBlue, size: 18),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Product image and carousel with left/right buttons
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: _ImageCarousel(
                  images: [
                    'assets/images/tank6.png',
                    'assets/images/tank6.png',
                    'assets/images/tank6.png',
                  ],
                ),
              ),
              // Description with See more functionality
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.titlePaddingHorizontal,
                  vertical: AppDimensions.titlePaddingVertical,
                ),
                child: _ExpandableDescription(
                  text: 'U-PVC Pipes are the ideal substitute for cast-iron and asbestos. Because of its special...',
                  maxLength: 60,
                ),
              ),
              // Size tabs (order and style as in image)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.breadcrumbPaddingHorizontal,
                  vertical: AppDimensions.breadcrumbPaddingVertical,
                ),
                child: _SelectableSizeTabs(),
              ),
              // Table header (order: Length, Size, Item Name, Product No., Arrow)
              Container(
                color: AppColors.tableHeaderBackground,
                padding: const EdgeInsets.symmetric(
                  vertical: AppDimensions.tableHeaderPaddingVertical,
                ),
                child: const Row(
                  children: [
                    Expanded(child: Text('Length (m)', style: AppTextStyles.tableHeaderText)),
                    Expanded(child: Text('Size (inch)', style: AppTextStyles.tableHeaderText)),
                    Expanded(child: Text('Item Name', style: AppTextStyles.tableHeaderText)),
                    Expanded(child: Text('Product No.', style: AppTextStyles.tableHeaderText)),
                    SizedBox(width: 32),
                  ],
                ),
              ),
              // Table rows with divider and icon at the end
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemCount: _tableRows.length + 1, // Add one for the last divider
                        separatorBuilder: (context, i) => const Divider(thickness: 1, height: 1),
                        itemBuilder: (context, i) {
                          if (i == _tableRows.length) {
                            // Last divider under the last row
                            return const Divider(thickness: 2, height: 2);
                          }
                          final row = _tableRows[i];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                            child: Row(
                              children: [
                                Expanded(child: Text(row['length'] ?? '')),
                                Expanded(child: Text(row['size'] ?? '')),
                                Expanded(child: Text(row['itemName'] ?? '')),
                                Expanded(child: Text(row['productNo'] ?? '')),
                                const SizedBox(
                                  child: Icon(Icons.reply, color: AppColors.iconLightBlue, size: 20),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppDimensions.actionButtonSpacing),
              // Centered action icons below the table
              // Right-align the action icons using an Align widget
              const Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: AppDimensions.breadcrumbPaddingHorizontal),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _CircleActionButton(icon: Icons.inventory_2),
                      SizedBox(width: AppDimensions.actionButtonSpacing),
                      _CircleActionButton(icon: Icons.attachment),
                      SizedBox(width: AppDimensions.actionButtonSpacing),
                      _CircleActionButton(icon: Icons.copy),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppDimensions.actionButtonSpacing),
            ],
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 0) {
            Navigator.of(context).pushReplacementNamed(AppRoutes.home);
          } else if (index == 1) {
            Navigator.of(context).pushReplacementNamed(AppRoutes.favorite);
          } else if (index == 2) {
            Navigator.of(context).pushReplacementNamed(AppRoutes.profile);
          } else if (index == 3) {
            Navigator.of(context).pushReplacementNamed(AppRoutes.downloads);
          } else if (index == 4) {
            Navigator.of(context).pushReplacementNamed(AppRoutes.info);
          }
        },
      ),
    );
  }
}

class _SizeTab extends StatelessWidget {
  final String label;
  final bool selected;
  const _SizeTab({required this.label, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        decoration: BoxDecoration(
          color: selected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: selected ? AppColors.iconBlue : AppColors.iconLightBlue),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? AppColors.iconWhite : AppColors.iconBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _ImageCircle extends StatelessWidget {
  final String image;
  final bool selected;
  const _ImageCircle({required this.image, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: selected ? Colors.blue : Colors.grey[300]!, width: 2),
      ),
      child: ClipOval(
        child: Image.asset(image, fit: BoxFit.cover),
      ),
    );
  }
}

class _ExpandableDescription extends StatefulWidget {
  final String text;
  final int maxLength;
  const _ExpandableDescription({required this.text, this.maxLength = 60});

  @override
  State<_ExpandableDescription> createState() => _ExpandableDescriptionState();
}

class _ExpandableDescriptionState extends State<_ExpandableDescription> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    final isLong = widget.text.length > widget.maxLength;
    final displayText = expanded || !isLong
        ? widget.text
        : '${widget.text.substring(0, widget.maxLength)}...';
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isLong && !expanded)
          GestureDetector(
            onTap: () => setState(() => expanded = true),
            child: const Text('See more', style: TextStyle(color: Colors.blue, fontSize: 12)),
          ),
        if (isLong && !expanded) const SizedBox(width: 4),
        Expanded(
          child: Text(
            displayText,
            style: TextStyle(fontSize: 12, color: Colors.grey[700]),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}

class _ImageCarousel extends StatefulWidget {
  final List<String> images;
  const _ImageCarousel({required this.images});

  @override
  State<_ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<_ImageCarousel> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.images.length - 1;
  }

  void _goLeft() {
    if (currentIndex > 0) setState(() => currentIndex--);
  }

  void _goRight() {
    if (currentIndex < widget.images.length - 1) setState(() => currentIndex++);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.chevron_left, color: currentIndex == 0 ? Colors.grey[300] : AppColors.iconLightBlue, size: 36),
                onPressed: currentIndex == 0 ? null : _goLeft,
              ),
              Expanded(
                child: Center(
                  child: Image.asset(widget.images[currentIndex], height: 100),
                ),
              ),
              IconButton(
                icon: Icon(Icons.chevron_right, color: currentIndex == widget.images.length - 1 ? Colors.grey[300] : AppColors.iconLightBlue, size: 36),
                onPressed: currentIndex == widget.images.length - 1 ? null : _goRight,
              ),
            ],
          ),
          Positioned(
            bottom: 8,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.images.length, (i) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: _ImageCircle(image: widget.images[i], selected: i == currentIndex),
              )),
            ),
          ),
        ],
      ),
    );
  }
}

class _SelectableSizeTabs extends StatefulWidget {
  @override
  State<_SelectableSizeTabs> createState() => _SelectableSizeTabsState();
}

class _SelectableSizeTabsState extends State<_SelectableSizeTabs> {
  final List<String> sizes = ['"1/2"', '"3/4"', '"3/4"', '"3/4"'];
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      textDirection: TextDirection.ltr, // Force left-to-right order
      children: List.generate(sizes.length, (i) => GestureDetector(
        onTap: () => setState(() => selected = i),
        child: _SizeTab(label: sizes[i], selected: selected == i),
      )),
    );
  }
}

// Add this at the end of the file (replace _CircleButton):
class _CircleActionButton extends StatelessWidget {
  final IconData icon;
  const _CircleActionButton({required this.icon});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.iconLightBlue,
      radius: 24,
      child: Icon(icon, color: AppColors.iconWhite, size: 26),
    );
  }
}
