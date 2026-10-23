import 'package:flutter/material.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'الجدول الدراسي',
            style: TextStyle(
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: const TabBar(
            isScrollable: true,
            labelStyle: TextStyle(
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.bold,
            ),
            tabs: [
              Tab(text: 'السبت'),
              Tab(text: 'الأحد'),
              Tab(text: 'الاثنين'),
              Tab(text: 'الثلاثاء'),
              Tab(text: 'الأربعاء'),
              Tab(text: 'الخميس'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildDaySchedule(_getSaturdaySchedule()),
            _buildDaySchedule(_getSundaySchedule()),
            _buildDaySchedule(_getMondaySchedule()),
            _buildDaySchedule(_getTuesdaySchedule()),
            _buildDaySchedule(_getWednesdaySchedule()),
            _buildDaySchedule(_getThursdaySchedule()),
          ],
        ),
      ),
    );
  }

  List<Map<String, dynamic>> _getSaturdaySchedule() {
    return [
      {
        'time': '8:30 - 11:00',
        'subject': 'Physics II',
        'location': 'قاعة 101',
        'type': 'محاضرة',
      },
      {
        'time': '11:00 - 1:30',
        'subject': 'Physics I A',
        'location': 'معمل الفيزياء',
        'type': 'عملي',
      },
      {
        'time': '1:30 - 3:30',
        'subject': 'Physics I B',
        'location': 'قاعة 102',
        'type': 'محاضرة',
      },
    ];
  }

  List<Map<String, dynamic>> _getSundaySchedule() {
    return [
      {
        'time': '8:30 - 11:00',
        'subject': 'Dig. Sig. Processing I',
        'location': 'قاعة 201',
        'type': 'محاضرة',
      },
      {
        'time': '11:00 - 1:30',
        'subject': 'Digital Electronics',
        'location': 'معمل الإلكترونيات',
        'type': 'عملي',
      },
      {
        'time': '1:30 - 3:30',
        'subject': 'Electric circuits II',
        'location': 'قاعة 202',
        'type': 'محاضرة',
      },
    ];
  }

  List<Map<String, dynamic>> _getMondaySchedule() {
    return [
      {
        'time': '8:30 - 11:00',
        'subject': 'Microprocessors I',
        'location': 'قاعة 301',
        'type': 'محاضرة',
      },
      {
        'time': '11:00 - 1:30',
        'subject': 'Measurements',
        'location': 'معل القياسات',
        'type': 'عملي',
      },
    ];
  }

  List<Map<String, dynamic>> _getTuesdaySchedule() {
    return [
      {
        'time': '8:30 - 11:00',
        'subject': 'Control System I',
        'location': 'قاعة 401',
        'type': 'محاضرة',
      },
      {
        'time': '11:00 - 1:30',
        'subject': 'Data Structure',
        'location': 'معمل الحاسوب',
        'type': 'عملي',
      },
    ];
  }

  List<Map<String, dynamic>> _getWednesdaySchedule() {
    return [
      {
        'time': '8:30 - 11:00',
        'subject': 'Digital Systems II',
        'location': 'قاعة 501',
        'type': 'محاضرة',
      },
      {
        'time': '11:00 - 1:30',
        'subject': 'Parallel Processing',
        'location': 'معمل الحاسوب',
        'type': 'عملي',
      },
    ];
  }

  List<Map<String, dynamic>> _getThursdaySchedule() {
    return [
      {
        'time': '8:30 - 11:00',
        'subject': 'Digital Communication',
        'location': 'قاعة 601',
        'type': 'محاضرة',
      },
      {
        'time': '11:00 - 1:30',
        'subject': 'Image Processing',
        'location': 'معمل الصور',
        'type': 'عملي',
      },
    ];
  }

  Widget _buildDaySchedule(List<Map<String, dynamic>> schedule) {
    if (schedule.isEmpty) {
      return const Center(
        child: Text(
          'لا توجد محاضرات اليوم',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'SF Pro Display',
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: schedule.length,
      itemBuilder: (context, index) {
        final item = schedule[index];
        return _buildScheduleCard(
          time: item['time'],
          subject: item['subject'],
          location: item['location'],
          type: item['type'],
        );
      },
    );
  }

  Widget _buildScheduleCard({
    required String time,
    required String subject,
    required String location,
    required String type,
  }) {
    final isLab = type == 'عملي';
    
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isLab
            ? Colors.orange.withOpacity(0.1)
            : Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: isLab ? Colors.orange : Colors.blue,
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: isLab ? Colors.orange : Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  type,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SF Pro Display',
                  ),
                ),
              ),
              Text(
                time,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SF Pro Display',
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            subject,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'SF Pro Display',
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.location_on, size: 18, color: Colors.grey),
              const SizedBox(width: 5),
              Text(
                location,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                  fontFamily: 'SF Pro Display',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}