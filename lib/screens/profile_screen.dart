import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'الملف الشخصي',
          style: TextStyle(
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 30),
            _buildInfoSection(),
            const SizedBox(height: 30),
            _buildSettingsSection(context),
            const SizedBox(height: 30),
            _buildLogoutButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1E3A8A), Color(0xFF3B82F6)],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, size: 50, color: Color(0xFF3B82F6)),
          ),
          SizedBox(height: 20),
          Text(
            'اسم الطالب',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'SF Pro Display',
            ),
          ),
          SizedBox(height: 5),
          Text(
            'الرقم الجامعي: 2024001',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
              fontFamily: 'SF Pro Display',
            ),
          ),
          SizedBox(height: 5),
          Text(
            'هندسة الحاسوب والشبكات',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
              fontFamily: 'SF Pro Display',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'المعلومات الشخصية',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'SF Pro Display',
          ),
        ),
        const SizedBox(height: 15),
        _buildInfoTile(Icons.email, 'البريد الإلكتروني', 'student@fezzanu.edu.ly'),
        _buildInfoTile(Icons.phone, 'رقم الهاتف', '0912345678'),
        _buildInfoTile(Icons.calendar_today, 'سنة الالتحاق', '2024'),
        _buildInfoTile(Icons.school, 'المستوى الدراسي', 'السنة الثالثة'),
      ],
    );
  }

  Widget _buildInfoTile(IconData icon, String title, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Theme.of(context as BuildContext).cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF3B82F6)),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                  fontFamily: 'SF Pro Display',
                ),
              ),
              const SizedBox(height: 3),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SF Pro Display',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'الإعدادات',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'SF Pro Display',
          ),
        ),
        const SizedBox(height: 15),
        _buildSettingsTile(
          icon: Icons.notifications,
          title: 'الإشعارات',
          subtitle: 'تفعيل إشعارات الجامعة',
          onTap: () {},
        ),
        _buildSettingsTile(
          icon: Icons.language,
          title: 'اللغة',
          subtitle: 'العربية',
          onTap: () {},
        ),
        _buildSettingsTile(
          icon: Icons.dark_mode,
          title: 'المظهر',
          subtitle: 'الوضع الليلي',
          onTap: () {},
        ),
        _buildSettingsTile(
          icon: Icons.info,
          title: 'حول التطبيق',
          subtitle: 'الإصدار 1.0.0',
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Theme.of(context as BuildContext).cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF3B82F6)),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'SF Pro Display',
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontFamily: 'SF Pro Display'),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/login');
        },
        icon: const Icon(Icons.logout),
        label: const Text(
          'تسجيل الخروج',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'SF Pro Display',
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}