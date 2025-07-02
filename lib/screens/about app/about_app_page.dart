import 'package:flutter/material.dart';
import 'package:royal/core/routes/app_routes.dart';
import 'package:royal/generated/l10n.dart';

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
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.blue, size: 28),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.customDrawer);
            },
          ),
          title: Text(
            S.of(context).appInfoLabel, // 'معلومات التطبيق'
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.blue[900],
            ),
          ),
          centerTitle: true,
          actions: [],
        ),
        body: Column(
          children: [
            const SizedBox(height: 32),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8),
              margin: const EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                children: [
                  _buildMenuItem(S.of(context).aboutRoyalLabel),
                  Divider(height: 0, color: Colors.grey.shade300),
                  _buildMenuItem(S.of(context).jobsLabel),
                  Divider(height: 0, color: Colors.grey.shade300),
                  _buildMenuItem(S.of(context).privacyPolicyLabel),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Column(
              children: [
                Text(
                  S.of(context).versionLabel("2.1"),
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue[900],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  S.of(context).madeInPalestine,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Text(
                  S.of(context).royalCo2022,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 30),
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
