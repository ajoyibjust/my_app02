import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Notification extends StatelessWidget {
  const Notification({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 15,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
                    onPressed: () {
                      context.pop();
                    },
                  ),

                  Text(
                    'Notification',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  IconButton(
                    icon: Icon(Icons.settings, color: Colors.grey),
                    onPressed: () {
                      context.push('/setting');
                    },
                  ),
                ],
              ),
              Text(
                'Recent',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              _buildNotificationItem(
                icon: Icons.shopping_cart,
                title: 'Purchase Completed!',
                subtitle:
                    'You have successfully purchased \$34 headphones, thank you and wait for your package to arrive',
                time: '2 min ago',
              ),
              _buildNotificationItem(
                icon: Icons.person,
                title: 'Jeremy Send You a Message',
                subtitle:
                    'Hello you certainly has turned around and we all have meet.',
                time: '5 min ago',
                hasReply: true,
              ),
              _buildNotificationItem(
                icon: Icons.flash_on,
                title: 'Flash Sale!',
                subtitle:
                    'Get 20% discount for first transaction in this month',
                time: '2 min ago',
              ),
              _buildNotificationItem(
                icon: Icons.local_shipping,
                title: 'Package Sent',
                subtitle: 'Hi your package has been sent from new york',
                time: '10 min ago',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String time,
    bool hasReply = false,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 20, color: Colors.black54),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      time,
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
                if (hasReply) ...[
                  SizedBox(height: 8),
                  Text(
                    'Reply the message',
                    style: TextStyle(color: Colors.blue, fontSize: 14),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
