import 'package:flutter/material.dart';
import 'package:royal/generated/l10n.dart';
import '../../widgets/royal_scaffold.dart';
import 'package:royal/core/routes/app_routes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return RoyalScaffold(
      currentIndex: 2, // Profile tab
      onNavTap: (index) {
        if (index == 0) {
          Navigator.of(context).pushReplacementNamed('/home');
        } else if (index == 1) {
          Navigator.of(context).pushReplacementNamed('/favorite');
        } else if (index == 2) {
          // Already on profile
        } else if (index == 3) {
          Navigator.of(context).pushReplacementNamed('/downloads');
        } else if (index == 4) {
          Navigator.of(context).pushReplacementNamed('/info');
        }
      },
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
              _ProfileMenuItem(
                icon: Icons.assignment,
                label: s.profileOrders,
                onTap: () => Navigator.pushNamed(
                  context,
                  AppRoutes.orders,
                  arguments: {'source': 'profile'},
                ),
              ),
              _ProfileMenuItem(
                icon: Icons.star,
                label: s.profileNewItems,
                onTap: () => Navigator.pushNamed(
                  context,
                  '/new-items',
                  arguments: {'source': 'profile'},
                ),
              ),
              _ProfileMenuItem(
                icon: Icons.history,
                label: s.profileBrowsingArchive,
                onTap: () => Navigator.pushNamed(
                  context,
                  '/browsing-history',
                  arguments: {'source': 'profile'},
                ),
              ),
              _ProfileMenuItem(
                icon: Icons.favorite_border,
                label: s.profileFavorites,
                onTap: () => Navigator.pushNamed(
                  context,
                  '/favorite',
                  arguments: {'source': 'profile'},
                ),
              ),
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
    );
  }
}

class _ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  const _ProfileMenuItem({required this.icon, required this.label, this.onTap});

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
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}
