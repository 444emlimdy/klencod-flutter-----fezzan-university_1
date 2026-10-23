import 'package:flutter/material.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentCourses = [
      {'name': 'Physics II', 'code': 'PHY102', 'credits': 3, 'progress': 0.7},
      {'name': 'Digital Electronics', 'code': 'ELC201', 'credits': 3, 'progress': 0.6},
      {'name': 'Control System I', 'code': 'CON301', 'credits': 3, 'progress': 0.8},
      {'name': 'Data Structure', 'code': 'CSC202', 'credits': 3, 'progress': 0.75},
      {'name': 'Microprocessors I', 'code': 'CSC301', 'credits': 3, 'progress': 0.65},
      {'name': 'Digital Communication', 'code': 'COM401', 'credits': 3, 'progress': 0.5},
    ];

    final completedCourses = [
      {'name': 'Physics I', 'code': 'PHY101', 'credits': 3, 'grade': 'A'},
      {'name': 'Mathematics I', 'code': 'MTH101', 'credits': 3, 'grade': 'B+'},
      {'name': 'Programming I', 'code': 'CSC101', 'credits': 3, 'grade': 'A-'},
      {'name': 'Electronics I', 'code': 'ELC101', 'credits': 3, 'grade': 'B'},
    ];

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'المواد الدراسية',
            style: TextStyle(
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: const TabBar(
            labelStyle: TextStyle(
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.bold,
            ),
            tabs: [
              Tab(text: 'المواد الحالية'),
              Tab(text: 'المواد المكتملة'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildCurrentCourses(currentCourses),
            _buildCompletedCourses(completedCourses),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentCourses(List<Map<String, dynamic>> courses) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: courses.length,
      itemBuilder: (context, index) {
        final course = courses[index];
        return _buildCourseCard(
          name: course['name'],
          code: course['code'],
          credits: course['credits'],
          progress: course['progress'],
        );
      },
    );
  }

  Widget _buildCompletedCourses(List<Map<String, dynamic>> courses) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: courses.length,
      itemBuilder: (context, index) {
        final course = courses[index];
        return _buildCompletedCourseCard(
          name: course['name'],
          code: course['code'],
          credits: course['credits'],
          grade: course['grade'],
        );
      },
    );
  }

  Widget _buildCourseCard({
    required String name,
    required String code,
    required int credits,
    required double progress,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context as BuildContext).cardColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SF Pro Display',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF3B82F6).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  code,
                  style: const TextStyle(
                    color: Color(0xFF3B82F6),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SF Pro Display',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            '$credits ساعات معتمدة',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
              fontFamily: 'SF Pro Display',
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 8,
                    backgroundColor: Colors.grey[300],
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Color(0xFF3B82F6),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                '${(progress * 100).toInt()}%',
                style: const TextStyle(
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

  Widget _buildCompletedCourseCard({
    required String name,
    required String code,
    required int credits,
    required String grade,
  }) {
    final color = _getGradeColor(grade);
    
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context as BuildContext).cardColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                grade,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SF Pro Display',
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SF Pro Display',
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '$code | $credits ساعات',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                    fontFamily: 'SF Pro Display',
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.check_circle, color: Colors.green, size: 28),
        ],
      ),
    );
  }

  Color _getGradeColor(String grade) {
    switch (grade[0]) {
      case 'A': return Colors.green;
      case 'B': return Colors.blue;
      case 'C': return Colors.orange;
      default: return Colors.red;
    }
  }
}