import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:royal/generated/l10n.dart';
import '../core/providers/locale_provider.dart';

class LanguageToggleButton extends ConsumerWidget {
  const LanguageToggleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);

    return TextButton(
      onPressed: () {
        ref.read(localeProvider.notifier).toggleLocale();
      },
      child: Text(
        locale.languageCode == 'en'
            ? S.of(context).languageArabic
            : S.of(context).languageEnglish,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
