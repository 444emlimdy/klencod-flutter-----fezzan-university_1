import 'package:flutter/material.dart';

class GradesScreen extends StatelessWidget {
  const GradesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final grades = [
      {'subject': 'Physics II', 'grade': 'A', 'score': 92, 'credits': 3},
      {'subject': 'Digital Electronics', 'grade': 'B+', 'score': 85, 'credits': 3},
      {'subject': 'Control System I', 'grade': 'A-', 'score': 88, 'credits': 3},
      {'subject': 'Data Structure', 'grade': 'A', 'score': 95, 'credits': 3},
      {'subject': 'Microprocessors I', 'grade': 'B', 'score': 78, 'credits': 3},
      {'subject': 'Digital Communication', 'grade': 'A', 'score': 91, 'credits': 3},
    ];

    final gpa = _calculateGPA(grades);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'الدرجات',
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
            _buildGPACard(gpa),
            const SizedBox(height: 30),
            _buildGradesList(grades),
          ],
        ),
      ),
    );
  }

  double _calculateGPA(List<Map<String, dynamic>> grades) {
    double totalPoints = 0;
    int totalCredits = 0;
    
    for (var grade in grades) {
      double points = _gradeToPoints(grade['grade']);
      totalPoints += points * grade['credits'];
      totalCredits += grade['credits'] as int;
    }
    
    return totalCredits > 0 ? totalPoints / totalCredits : 0;
  }

  double _gradeToPoints(String grade) {
    switch (grade) {
      case 'A': return 4.0;
      case 'A-': return 3.7;
      case 'B+': return 3.3;
      case 'B': return 3.0;
      case 'B-': return 2.7;
      case 'C+': return 2.3;
      case 'C': return 2.0;
      default: return 0.0;
    }
  }

  Widget _buildGPACard(double gpa) {
    return Container(
      padding: const EdgeInsets.all(30),
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
      child: Column(
        children: [
          const Text(
            'المعدل التراكمي',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 18,
              fontFamily: 'SF Pro Display',
            ),
          ),
          const SizedBox(height: 15),
          Text(
            gpa.toStringAsFixed(2),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 64,
              fontWeight: FontWeight.bold,
              fontFamily: 'SF Pro Display',
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              _getGPAClassification(gpa),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'SF Pro Display',
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getGPAClassification(double gpa) {
    if (gpa >= 3.7) return 'ممتاز';
    if (gpa >= 3.0) return 'جيد جداً';
    if (gpa >= 2.5) return 'جيد';
    if (gpa >= 2.0) return 'مقبول';
    return 'ضعيف';
  }

  Widget _buildGradesList(List<Map<String, dynamic>> grades) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'درجات المواد',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontFamily: 'SF Pro Display',
          ),
        ),
        const SizedBox(height: 15),
        ...grades.map((grade) => _buildGradeCard(grade)),
      ],
    );
  }

  Widget _buildGradeCard(Map<String, dynamic> grade) {
    final color = _getGradeColor(grade['grade']);
    
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
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                grade['grade'],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
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
                  grade['subject'],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SF Pro Display',
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'الدرجة: ${grade['score']} | الساعات: ${grade['credits']}',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                    fontFamily: 'SF Pro Display',
                  ),
                ),
              ],
            ),
          ),
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