import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile App',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Poppins',
          scaffoldBackgroundColor: Color(0xFFF8FAFC)),
      home: ProfileScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final skills = [
    {
      'name': 'Flutter',
      'level': 0.8,
      'icon': Icons.phone_android,
      'color': Color(0xFF0EA5E9)
    },
    {
      'name': 'Dart',
      'level': 0.7,
      'icon': Icons.code,
      'color': Color(0xFF8B5CF6)
    },
    {
      'name': 'Firebase',
      'level': 0.6,
      'icon': Icons.local_fire_department,
      'color': Color(0xFFEF4444)
    },
    {
      'name': 'UI/UX',
      'level': 0.75,
      'icon': Icons.palette,
      'color': Color(0xFF10B981)
    },
  ];

  final contacts = [
    {
      'icon': Icons.email_outlined,
      'text': '5026221118@student.its.ac.id',
      'color': Color(0xFFEF4444)
    },
    {
      'icon': Icons.phone_outlined,
      'text': '+62 812-3456-7890',
      'color': Color(0xFF10B981)
    },
    {
      'icon': Icons.location_on_outlined,
      'text': 'Surabaya, East Java',
      'color': Color(0xFF8B5CF6)
    },
    {
      'icon': Icons.link,
      'text': 'linkedin.com/ezrabimantara',
      'color': Color(0xFF0EA5E9)
    },
  ];

  final experiences = [
    {
      'title': 'IT Project Manager Intern',
      'company': 'PT. Sineas Kreatif Indonesia',
      'period': 'Februrary 2025 - May 2025',
      'desc': 'Mengembangkan aplikasi HRIS untuk internal perusahaan.'
    },
    {
      'title': 'Coding Teacher Part Time',
      'company': 'Timedoor Indonesia',
      'period': 'February 2025 - Present',
      'desc': 'Mengajar pemrograman dasar untuk anak-anak usia 8-18 tahun.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _headerModern(),
                SizedBox(height: 28),
                _section('My Skills', _skillsGrid()),
                SizedBox(height: 28),
                _section('About Me', _aboutCard()),
                SizedBox(height: 28),
                _section('My Experience', _experienceList()),
                SizedBox(height: 28),
                _section('Contact Me', _contactCard()),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _headerModern() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 38,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 34,
            backgroundImage: NetworkImage(
                'https://media.licdn.com/dms/image/v2/D5603AQHG97fNK051Bw/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1690687340234?e=1753920000&v=beta&t=_D5XJg7vj7o-2ZSd3xqpQvqcuiWurlFYZW-GUqo95gw'),
          ),
        ),
        SizedBox(width: 18),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Halo Semua !',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1E293B))),
              SizedBox(height: 6),
              Text('Saya Ezra Bimantara',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF64748B))),
              SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Color(0xFFE3F2FD),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text('5026221118',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF3B82F6))),
                  ),
                  SizedBox(width: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Color(0xFFE3F2FD),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text('SI ITS-Semester 6',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF3B82F6))),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _section(String title, Widget child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B))),
        SizedBox(height: 12),
        child,
      ],
    );
  }

  Widget _skillsGrid() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: skills
          .map((s) => Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: skills.last == s ? 0 : 10),
                  padding: EdgeInsets.symmetric(vertical: 18),
                  decoration: _cardDecoration(),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: (s['color'] as Color).withOpacity(0.12),
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(s['icon'] as IconData,
                            color: s['color'] as Color, size: 22),
                      ),
                      SizedBox(height: 7),
                      Text(s['name'] as String,
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF475569))),
                    ],
                  ),
                ),
              ))
          .toList(),
    );
  }

  Widget _aboutCard() {
    return Container(
      padding: EdgeInsets.all(18),
      decoration: _cardDecoration(),
      child: Column(
        children: [
          _infoRow(Icons.person_outline, Color(0xFF3B82F6),
              'Mahasiswa Sistem Informasi yang passionate dalam pengembangan aplikasi mobile dan web development.'),
          SizedBox(height: 14),
          _infoRow(Icons.school_outlined, Color(0xFF0EA5E9),
              'Institut Teknologi Sepuluh Nopember\nSistem Informasi - Semester 6'),
        ],
      ),
    );
  }

  Widget _experienceList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: experiences
          .map((exp) => Container(
                margin:
                    EdgeInsets.only(bottom: experiences.last == exp ? 0 : 18),
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF64748B).withOpacity(0.06),
                      blurRadius: 10,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exp['title']!,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      exp['company']!,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12.5,
                        color: Color(0xFF60A5FA),
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.1,
                      ),
                    ),
                    Text(
                      exp['period']!,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        color: Color(0xFF94A3B8),
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.1,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      exp['desc']!,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        color: Color(0xFF475569),
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }

  Widget _contactCard() {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: _cardDecoration(),
      child: Column(
        children: contacts
            .map((c) => Container(
                  margin: EdgeInsets.only(bottom: contacts.last == c ? 0 : 16),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: (c['color'] as Color).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(c['icon'] as IconData,
                            color: c['color'] as Color, size: 20),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                          child: Text(c['text'] as String,
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xFF475569)))),
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }

  Widget _infoRow(IconData icon, Color color, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8)),
          child: Icon(icon, color: color, size: 20),
        ),
        SizedBox(width: 12),
        Expanded(
            child: Text(text,
                style: TextStyle(
                    fontSize: 14, height: 1.6, color: Color(0xFF475569)))),
      ],
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
            color: Color(0xFF64748B).withOpacity(0.08),
            blurRadius: 12,
            offset: Offset(0, 4))
      ],
    );
  }
}
