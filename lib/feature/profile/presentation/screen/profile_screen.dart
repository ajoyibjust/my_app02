import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app2/core/extension/sizedbox_extension.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.grey),
                    onPressed: () {
                      context.pop();
                    },
                  ),

                  Text(
                    'Edit Profile',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  IconButton(
                    icon: Icon(Icons.more_vert, color: Colors.grey),
                    onPressed: () {},
                  ),
                ],
              ),
              20.height,
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                ),
                child: Icon(Icons.person, size: 60, color: Colors.grey[600]),
              ),
              SizedBox(height: 32),
              _buildProfileField(
                label: 'Username',
                icon: Icons.person,
                value: 'Magdalena Saccorse',
              ),
              SizedBox(height: 24),
              _buildProfileField(
                label: 'Email or Phone Number',
                icon: Icons.email,
                value: 'magdalenab3@email.com',
              ),
              SizedBox(height: 24),
              _buildProfileField(
                label: 'Account Linked With',
                icon: Icons.link,
                value: 'Google',
              ),
              Spacer(),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigoAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    'Save Changes',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileField({
    required String label,
    required IconData icon,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(icon, size: 20, color: Colors.grey[600]),
              SizedBox(width: 12),
              Expanded(child: Text(value, style: TextStyle(fontSize: 16))),
            ],
          ),
        ),
      ],
    );
  }
}
