import 'package:flutter/material.dart';
import 'package:royal/core/routes/app_routes.dart';
import 'package:royal/generated/l10n.dart';
import 'package:royal/core/constants/app_colors.dart';
import 'package:royal/core/constants/app_text_styles.dart';
import 'package:royal/core/constants/app_dimensions.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacementNamed(AppRoutes.customDrawer);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appBarBackground,
          elevation: AppDimensions.appBarElevation,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: AppColors.primary, size: 28),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.customDrawer);
            },
          ),
          title: Text(
            S.of(context).appInfoLabel,
            style: AppTextStyles.appBarTitle,
          ),
          centerTitle: true,
          actions: const [],
        ),
        body: Column(
          children: [
            const SizedBox(height: AppDimensions.menuItemSpacing),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.menuItemBackground,
                borderRadius: BorderRadius.circular(AppDimensions.menuItemBorderRadius),
              ),
              padding: const EdgeInsets.symmetric(vertical: AppDimensions.menuItemPaddingVertical),
              margin: const EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                children: [
                  _buildMenuItem(S.of(context).aboutRoyalLabel),
                  const Divider(height: 0, color: AppColors.menuItemDivider),
                  _buildMenuItem(S.of(context).jobsLabel),
                  const Divider(height: 0, color: AppColors.menuItemDivider),
                  _buildMenuItem(S.of(context).privacyPolicyLabel),
                ],
              ),
            ),
            const SizedBox(height: AppDimensions.versionSpacing),
            Column(
              children: [
                Text(
                  S.of(context).versionLabel("2.1"),
                  style: AppTextStyles.versionText,
                ),
                const SizedBox(height: AppDimensions.madeInSpacing),
                Text(
                  S.of(context).madeInPalestine,
                  style: AppTextStyles.madeInText,
                ),
                const SizedBox(height: AppDimensions.madeInSpacing),
                Text(
                  S.of(context).royalCo2022,
                  style: AppTextStyles.madeInText,
                ),
              ],
            ),
            const SizedBox(height: AppDimensions.bottomSpacing),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      title: Text(
        title,
        style: const TextStyle(fontSize: 18, color: Colors.grey),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.grey,
        size: 16,
      ),
      onTap: () {},
    );
  }
}
