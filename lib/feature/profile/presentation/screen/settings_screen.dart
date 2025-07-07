import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      context.pop();
                    },
                  ),

                  Text(
                    'Settings',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  IconButton(
                    icon: Icon(Icons.more_vert, color: Colors.black),
                    onPressed: () {},
                  ),
                ],
              ),
              Divider(color: Colors.grey.shade200),
              Text(
                'General',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 16),
              _buildSettingItem(
                icon: Icons.person,
                title: 'Edit Profile',
                onTap: () {
                  context.push('/profile');
                },
              ),
              _buildSettingItem(
                icon: Icons.lock,
                title: 'Change Password',
                onTap: () {
                  context.push('/changePassword');
                },
              ),
              _buildSettingItem(
                icon: Icons.notifications,
                title: 'Notifications',
                onTap: () {},
              ),
              _buildSettingItem(
                icon: Icons.security,
                title: 'Security',
                onTap: () {},
              ),
              _buildSettingItem(
                icon: Icons.language,
                title: 'Language',
                trailing: Text(
                  'English',
                  style: TextStyle(color: Colors.grey[600]),
                ),
                onTap: () {},
              ),
              SizedBox(height: 32),
              Text(
                'Preferences',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 16),
              _buildSettingItem(
                icon: Icons.description,
                title: 'Legal and Policies',
                onTap: () {},
              ),
              _buildSettingItem(
                icon: Icons.help,
                title: 'Help & Support',
                onTap: () {},
              ),
              SizedBox(height: 32),
              _buildSettingItem(
                icon: Icons.logout,
                title: 'Logout',
                titleColor: Colors.red,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    Widget? trailing,
    Color? titleColor,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            Icon(icon, size: 24, color: titleColor ?? Colors.grey),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: titleColor ?? Colors.black87,
                ),
              ),
            ),
            if (trailing != null) trailing,
            if (trailing == null)
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
          ],
        ),
      ),
    );
  }
}
