import 'package:flutter/material.dart';
import 'package:royal/generated/l10n.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_bottom_nav_bar.dart';
import 'package:royal/core/routes/app_routes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                textDirection: TextDirection.rtl,
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundColor: Color(0xFFE0E0E0),
                    child: Icon(Icons.person, size: 80, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                s.profileWelcome,
                style: const TextStyle(
                  fontSize: 28,
                  color: Color(0xFF00AEEF),
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                s.profileName,
                style: const TextStyle(
                  fontSize: 24,
                  color: Color(0xFF00AEEF),
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00AEEF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () {
                      AppRoutes.navigateTo(context, AppRoutes.profileEdit);
                    },
                    child: Text(
                      s.profileEdit,
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _ProfileMenuItem(icon: Icons.assignment, label: s.profileOrders),
              _ProfileMenuItem(icon: Icons.star, label: s.profileNewItems),
              _ProfileMenuItem(icon: Icons.history, label: s.profileBrowsingArchive),
              _ProfileMenuItem(icon: Icons.favorite_border, label: s.profileFavorites),
              const SizedBox(height: 24),
              Center(
                child: SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF5A5A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () {},
                    child: Text(
                      s.profileLogout,
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 2, // Profile tab
        onTap: (index) {
          // Navigation handled in CustomBottomNavBar
        },
      ),
    );
  }
}

class _ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  const _ProfileMenuItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF6F7F9),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListTile(
            leading: Icon(icon, color: Colors.grey[700]),
            title: Text(
              label,
              style: const TextStyle(fontSize: 16, color: Colors.black),
              textAlign: TextAlign.right,
            ),
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
