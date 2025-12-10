import 'package:flutter/material.dart';
import 'package:sandwich_shop/views/app_styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile', style: heading1)),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: const Align(
                alignment: Alignment.bottomLeft,
                child: Text('Menu', style: heading1),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home', style: normalText),
              onTap: () => Navigator.of(context).pop(),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile', style: normalText),
              selected: true,
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 36,
                  backgroundColor: Colors.blue.withOpacity(0.1),
                  child: const Text('A', style: heading1),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Alex Morgan', style: heading1),
                    SizedBox(height: 4),
                    Text('Premium member', style: normalText),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),

            const Text('Account', style: heading2),
            const SizedBox(height: 12),

            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: const [
                    _InfoRow(icon: Icons.email, label: 'Email', value: 'alex.morgan@example.com'),
                    Divider(),
                    _InfoRow(icon: Icons.phone, label: 'Phone', value: '+1 (555) 123-4567'),
                    Divider(),
                    _InfoRow(icon: Icons.calendar_today, label: 'Member since', value: 'Jan 2022'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Save changes'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: normalText),
              const SizedBox(height: 2),
              Text(value, style: normalText),
            ],
          ),
        ),
      ],
    );
  }
}
