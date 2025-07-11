import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royal/generated/l10n.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    // Detect text direction from locale
    final isRTL = Directionality.of(context) == TextDirection.rtl || Localizations.localeOf(context).languageCode == 'ar';
    return Directionality(
      textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Column(
              children: [
                const SizedBox(height: 56),
                Stack(
                  alignment: isRTL ? Alignment.bottomLeft : Alignment.bottomRight,
                  children: [
                     CircleAvatar(
                      radius: 64.r,
                      backgroundColor: const Color(0xFFE0E0E0),
                      child: Icon(Icons.person, size: 90.sp, color: Colors.grey),
                    ),
                    Positioned(
                      bottom: 10,
                      right: isRTL ? null : 10,
                      left: isRTL ? 10 : null,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF00AEEF),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        padding: EdgeInsets.all(5.r),
                        child: const Icon(Icons.edit, color: Colors.white, size: 22),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 44),
                Row(
                  textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
                  children: [
                    Expanded(
                      child: _ProfileEditField(
                        label: s.profileLastName,
                        hint: s.profileLastNameHint,
                        isRTL: isRTL,
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: _ProfileEditField(
                        label: s.profileFirstName,
                        hint: s.profileFirstNameHint,
                        isRTL: isRTL,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
                  children: [
                    Expanded(
                      child: _ProfileEditField(
                        label: s.profilePhone,
                        hint: s.profilePhoneHint,
                        isRTL: isRTL,
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: _ProfileEditField(
                        label: s.profileMobile,
                        hint: s.profileMobileHint,
                        isRTL: isRTL,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                _ProfileEditField(
                  label: s.profileAddress,
                  hint: s.profileAddressHint,
                  isRTL: isRTL,
                ),
                const SizedBox(height: 24),
                _ProfileEditField(
                  label: s.profileEmail,
                  hint: s.profileEmailHint,
                  isRTL: isRTL,
                ),
                const SizedBox(height: 24),
                _ProfileEditField(
                  label: s.profilePassword,
                  hint: s.profilePasswordHint,
                  obscureText: true,
                  suffixIcon: const Icon(Icons.visibility_off, color: Colors.grey),
                  isRTL: isRTL,
                ),
                const SizedBox(height: 44),
                Row(
                  textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF00AEEF),
                          padding: EdgeInsets.symmetric(vertical: 18.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(s.save, style: TextStyle(color: Colors.white, fontSize: 16.sp)),
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: const Color(0xFFF6F7F9),
                          side: BorderSide.none,
                          padding: EdgeInsets.symmetric(vertical: 18.h),
                        ),
                        onPressed: () {},
                        child: Text(s.cancel, style: TextStyle(color: Colors.black, fontSize: 16.sp)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 44),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ProfileEditField extends StatelessWidget {
  final String label;
  final String hint;
  final bool obscureText;
  final Widget? suffixIcon;
  final bool isRTL;
  const _ProfileEditField({
    required this.label,
    required this.hint,
    this.obscureText = false,
    this.suffixIcon,
    this.isRTL = false,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
      child: Column(
        crossAxisAlignment: isRTL ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 14.sp, color: Colors.black, fontWeight: FontWeight.w500),
            textAlign: isRTL ? TextAlign.right : TextAlign.left,
          ),
          const SizedBox(height: 6),
          TextField(
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: Color(0xFFBDBDBD)),
              filled: true,
              fillColor: const Color(0xFFF6F7F9),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide.none,
              ),
              suffixIcon: suffixIcon,
              contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            ),
            style: TextStyle(fontSize: 16.sp, color: Colors.black),
            textAlign: isRTL ? TextAlign.right : TextAlign.left,
          ),
        ],
      ),
    );
  }
}
