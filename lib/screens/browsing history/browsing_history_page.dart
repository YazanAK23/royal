import 'package:flutter/material.dart';
import 'package:royal/core/routes/app_routes.dart';
import 'package:royal/generated/l10n.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_bottom_nav_bar.dart';
import '../../widgets/product_card.dart';
import 'package:royal/core/constants/app_colors.dart';
import 'package:royal/core/constants/app_dimensions.dart';
import 'package:royal/core/constants/app_text_styles.dart';

class BrowsingHistoryPage extends StatefulWidget {
  const BrowsingHistoryPage({super.key});

  @override
  State<BrowsingHistoryPage> createState() => _BrowsingHistoryPageState();
}

class _BrowsingHistoryPageState extends State<BrowsingHistoryPage> {
  String? _source;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is Map && args['source'] is String) {
      _source = args['source'] as String;
    } else {
      _source = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return WillPopScope(
      onWillPop: () async {
        if (_source == 'drawer') {
          AppRoutes.navigateTo(context, AppRoutes.customDrawer);
          return false;
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: AppColors.browsingHistoryBackground,
        appBar: CustomAppBar(
          onMenuTap: () => AppRoutes.navigateTo(context, AppRoutes.customDrawer),
        ),
        body: Column(
          children: [
            const SizedBox(height: AppDimensions.browsingHistorySpacingSmall),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: AppDimensions.browsingHistorySpacingSmall),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: AppColors.browsingHistoryIcon, size: AppDimensions.browsingHistoryIconSize),
                  onPressed: () {
                    if (_source == 'drawer') {
                      AppRoutes.navigateTo(context, AppRoutes.customDrawer);
                    } else {
                      Navigator.of(context).maybePop();
                    }
                  },
                  tooltip: s.browsingArchiveLabel,
                ),
              ),
            ),
            const SizedBox(height: AppDimensions.browsingHistorySpacingSmall),
            Center(
              child: Text(
                s.browsingArchiveLabel,
                style: AppTextStyles.browsingHistoryTitle,
              ),
            ),
            const SizedBox(height: AppDimensions.browsingHistorySpacingMedium),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppDimensions.browsingHistoryPaddingHorizontal, vertical: AppDimensions.browsingHistoryPaddingVertical),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: AppDimensions.browsingHistoryGridSpacing,
                  mainAxisSpacing: AppDimensions.browsingHistoryGridSpacing,
                  childAspectRatio: AppDimensions.browsingHistoryGridAspectRatio,
                  children: [
                    ProductCard(
                      imagePath: 'assets/images/tank7.png',
                      title: s.waterTanks,
                    ),
                    ProductCard(
                      imagePath: 'assets/images/tank7.png',
                      title: s.waterTanks ,
                    ),
                    ProductCard(
                      imagePath: 'assets/images/tank6.png',
                      title: s.waterTanks,
                    ),
                    ProductCard(
                      imagePath: 'assets/images/tank4.png',
                      title: s.waterTanks ,
                    ),
                    ProductCard(
                      imagePath: 'assets/images/tank3.png',
                      title: s.waterTanks ,
                    ),
                    ProductCard(
                      imagePath: 'assets/images/tank5.png',
                      title: s.waterTanks,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: -1, // No item selected for Browsing History page
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
      ),
    );
  }
}
