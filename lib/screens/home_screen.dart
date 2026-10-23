import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeTab(),
    const ScheduleScreen(),
    const GradesScreen(),
    const CoursesScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          selectedItemColor: const Color(0xFF3B82F6),
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: const TextStyle(
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.bold,
          ),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
            BottomNavigationBarItem(icon: Icon(Icons.schedule), label: 'الجدول'),
            BottomNavigationBarItem(icon: Icon(Icons.grade), label: 'الدرجات'),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'المواد'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'الملف'),
          ],
        ),
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'جامعة فزان',
          style: TextStyle(
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: () => themeProvider.toggleTheme(),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWelcomeCard(),
            const SizedBox(height: 30),
            _buildQuickAccessGrid(context),
            const SizedBox(height: 30),
            _buildNewsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeCard() {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1E3A8A), Color(0xFF3B82F6)],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF3B82F6).withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'مرحباً بك',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
              fontFamily: 'SF Pro Display',
            ),
          ),
          SizedBox(height: 10),
          Text(
            'طالب جامعة فزان',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              fontFamily: 'SF Pro Display',
            ),
          ),
          SizedBox(height: 10),
          Text(
            'الفصل الدراسي الأول 2026-2027',
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

  Widget _buildQuickAccessGrid(BuildContext context) {
    final items = [
      {'icon': Icons.schedule, 'label': 'الجدول الدراسي', 'route': '/schedule'},
      {'icon': Icons.grade, 'label': 'الدرجات', 'route': '/grades'},
      {'icon': Icons.book, 'label': 'المواد', 'route': '/courses'},
      {'icon': Icons.web, 'label': 'البوابة الإلكترونية', 'route': '/portal'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 1.3,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return _buildQuickAccessCard(
          icon: items[index]['icon'] as IconData,
          label: items[index]['label'] as String,
          onTap: () {
            if (items[index]['route'] == '/portal') {
              // فتح الموقع
            } else {
              Navigator.pushNamed(context, items[index]['route'] as String);
            }
          },
        );
      },
    );
  }

  Widget _buildQuickAccessCard({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFF3B82F6).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 35, color: const Color(0xFF3B82F6)),
            ),
            const SizedBox(height: 15),
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'SF Pro Display',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'آخر الأخبار',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontFamily: 'SF Pro Display',
          ),
        ),
        const SizedBox(height: 15),
        _buildNewsCard(
          title: 'بدء التسجيل للفصل الدراسي الجديد',
          date: '2026-10-20',
          description: 'يبدأ التسجيل للفصل الدراسي الثاني يوم الأحد القادم',
        ),
        const SizedBox(height: 10),
        _buildNewsCard(
          title: 'نتائج الفصل الدراسي الأول',
          date: '2026-10-15',
          description: 'تم اعتماد نتائج الفصل الدراسي الأول ويمكن الاطلاع عليها',
        ),
      ],
    );
  }

  Widget _buildNewsCard({
    required String title,
    required String date,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'SF Pro Display',
            ),
          ),
          const SizedBox(height: 8),
          Text(
            date,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
              fontFamily: 'SF Pro Display',
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 14,
              fontFamily: 'SF Pro Display',
            ),
          ),
        ],
      ),
    );
  }
}