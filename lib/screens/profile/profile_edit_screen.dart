import 'package:flutter/material.dart';
import 'package:royal/generated/l10n.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0), // Increased horizontal padding
          child: Column(
            children: [
              const SizedBox(height: 56), // Increased top margin
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const CircleAvatar(
                    radius: 64, // Slightly larger avatar
                    backgroundColor: Color(0xFFE0E0E0),
                    child: Icon(Icons.person, size: 90, color: Colors.grey), // Larger icon
                  ),
                  Positioned(
                    bottom: 10, // Adjusted for new avatar size
                    right: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF00AEEF),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      padding: const EdgeInsets.all(5),
                      child: const Icon(Icons.edit, color: Colors.white, size: 22),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 44), // More space below avatar
              Row(
                children: [
                  Expanded(
                    child: _ProfileEditField(
                      label: s.profileLastName,
                      hint: 'Bashar',
                    ),
                  ),
                  const SizedBox(width: 24), // Increased space between fields
                  Expanded(
                    child: _ProfileEditField(
                      label: s.profileFirstName,
                      hint: 'Hjooj',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24), // Increased vertical space between rows
              Row(
                children: [
                  Expanded(
                    child: _ProfileEditField(
                      label: s.profilePhone,
                      hint: '0599 123 123',
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: _ProfileEditField(
                      label: s.profileMobile,
                      hint: '02 22 22222',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _ProfileEditField(
                label: s.profileAddress,
                hint: 'ssasfs sffsgs fwefwegwgrwege erg egre',
              ),
              const SizedBox(height: 24),
              _ProfileEditField(
                label: s.profileEmail,
                hint: 'Bashar@royal.ps',
              ),
              const SizedBox(height: 24),
              _ProfileEditField(
                label: s.profilePassword,
                hint: '**********',
                obscureText: true,
                suffixIcon: Icon(Icons.visibility_off, color: Colors.grey),
              ),
              const SizedBox(height: 44), // More space before buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00AEEF),
                        padding: const EdgeInsets.symmetric(vertical: 18), // Taller button
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(s.save, style: const TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  ),
                  const SizedBox(width: 24), // More space between buttons
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: const Color(0xFFF6F7F9),
                        side: BorderSide.none,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                      ),
                      onPressed: () {},
                      child: Text(s.cancel, style: const TextStyle(color: Colors.black, fontSize: 16)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 44), // More space at the bottom
            ],
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
  const _ProfileEditField({
    required this.label,
    required this.hint,
    this.obscureText = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
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
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            ),
            style: const TextStyle(fontSize: 16, color: Colors.black),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}
