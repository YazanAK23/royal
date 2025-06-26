import 'package:flutter/material.dart';
import 'package:royal/generated/l10n.dart';

class DrawerMenuItem {
  final String titleKey;
  final String icon;
  final String route;

  const DrawerMenuItem({
    required this.titleKey,
    required this.icon,
    required this.route,
  });

  String getLocalizedTitle(BuildContext context) {
    // Access S class properties based on titleKey
    switch (titleKey) {
      case 'profileLabel':
        return S.of(context).profileLabel;
      case 'ordersLabel':
        return S.of(context).ordersLabel;
      case 'newItemsLabel':
        return S.of(context).newItemsLabel;
      case 'browsingArchiveLabel':
        return S.of(context).browsingArchiveLabel;
      case 'monthlyOffersLabel':
        return S.of(context).monthlyOffersLabel;
      case 'newsLabel':
        return S.of(context).newsLabel;
      case 'certificatesLabel':
        return S.of(context).certificatesLabel;
      case 'appInfoLabel':
        return S.of(context).appInfoLabel;
      default:
        return titleKey;
    }
  }
}
