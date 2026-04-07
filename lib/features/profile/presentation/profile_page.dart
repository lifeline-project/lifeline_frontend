import 'package:flutter/material.dart';
import '../../../shared/widgets/responsive_center.dart';
import '../../../shared/widgets/custom_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: ResponsiveCenter(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'), // Placeholder
              ),
              const SizedBox(height: 16),
              Text(
                'Alex Johnson',
                style: theme.textTheme.titleLarge,
              ),
              const SizedBox(height: 4),
              Text(
                'alex.johnson@example.com',
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 32),
              
              _buildProfileOption(
                context, 
                title: 'Personal Information', 
                icon: Icons.person_outline,
              ),
              _buildProfileOption(
                context, 
                title: 'My Prescriptions', 
                icon: Icons.description_outlined,
              ),
              _buildProfileOption(
                context, 
                title: 'Order History', 
                icon: Icons.history,
              ),
              _buildProfileOption(
                context, 
                title: 'Settings', 
                icon: Icons.settings_outlined,
              ),
              
              const SizedBox(height: 32),
              CustomButton(
                text: 'Log Out',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Logged out')),
                  );
                },
                backgroundColor: theme.colorScheme.error,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileOption(BuildContext context, {required String title, required IconData icon}) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: theme.colorScheme.primary),
        title: Text(title, style: theme.textTheme.bodyLarge),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      ),
    );
  }
}
