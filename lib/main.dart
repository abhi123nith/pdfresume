import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

void main() {
  runApp(const ResumeApp());
}

class ResumeApp extends StatelessWidget {
  const ResumeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resume PDF App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Resume PDF'),
      ),
      body: PdfPreview(
        build: (format) => _generateResumePdf(),
      ),
    );
  }

  Future<Uint8List> _generateResumePdf() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                '                   ABHISHEK GODARA',
                style:
                    pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
                textAlign: pw.TextAlign.center,
              ),
              pw.SizedBox(height: 5), 

              // Contact Info 
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text('+91-9664022597 | Churu, Rajasthan',
                      style: const pw.TextStyle(fontSize: 18)),
                ],
              ),
              pw.SizedBox(height: 5), 

              // Email and Links as clickable buttons
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text('abhishekgodaranith@gmail.com'),
                  pw.Text(' | '),
                  _buildUrlText('LinkedIn',
                      'https://www.linkedin.com/in/abhishek-godara-ab28a725a/'),
                  pw.Text(' | '),
                  _buildUrlText('GitHub', 'https://github.com/abhi123nith'),
                  pw.Text(' | '),
                  _buildUrlText(
                      'LeetCode', 'https://leetcode.com/u/abhigodara/'),
                  pw.Text(' | '),
                  _buildUrlText(
                      'Codolio', 'https://codolio.com/profile/BNcimQYt'),
                  pw.Text(' | '),
                  _buildUrlText(
                      'Portfolio', 'https://godaraportfolio.netlify.app/'),
                ],
              ),

              pw.SizedBox(height: 10), 

              // Line separator
              _buildLineSeparator(),

              // Education Section 
              pw.Text('EDUCATION',
                  style: pw.TextStyle(
                      fontSize: 14, fontWeight: pw.FontWeight.bold)),
              _buildBullet(
                  'National Institute Of Technology (NIT), Hamirpur                        Nov 2022 - July 2026'),
              pw.Text(
                  'B.Tech - Computer Science and Engineering                                               CGPA: 8.17'),
              pw.SizedBox(height: 10),
              _buildLineSeparator(),

              // Skills Section 
              pw.Text('SKILLS',
                  style: pw.TextStyle(
                      fontSize: 14, fontWeight: pw.FontWeight.bold)),
              _buildBullet('Languages: C, C++, Dart, Javascript, SQL'),
              _buildBullet('Frameworks/Technologies: Flutter, Git, MongoDB'),
              _buildBullet(
                  'Developer Tools: VS Code, Firebase, GitHub, Android Studio, MySQL'),
              _buildBullet(
                  'Relevant Coursework: Data Structures, OS, OOP, DBMS'),
              pw.SizedBox(height: 10), 

              _buildLineSeparator(),

              // Experience Section 
              pw.Text('EXPERIENCE',
                  style: pw.TextStyle(
                      fontSize: 14, fontWeight: pw.FontWeight.bold)),
              _buildDarkBullet(
                  'Wow Codes - Flutter Developer Intern (2 Months)'),
              pw.Bullet(
                  text:
                      ' Converted 10+ UI/UX designs into responsive Flutter pages, improving app performance and user satisfaction by 30%.'),
              pw.Bullet(
                  text:
                      ' Integrated 10+ REST APIs, reducing data retrieval time by 20%.'),
              pw.Bullet(
                  text:
                      ' Collaborated with a team of 6 developers, meeting 100% of project deadlines.'),
              pw.SizedBox(height: 10),
              _buildDarkBullet(
                  'Robotics Society, NITH - Executive Member (Dec 2022 - Jan 2024)'), // Darker bullets for Experience
              pw.Bullet(
                  text:
                      ' Developed a line-following robot and secured 1st place at Exodia, IIT Mandi, and 2nd place at Techkriti, IIT Kanpur.'),
              pw.Bullet(
                  text:
                      ' Created an auto fire extinguisher bot reducing response time by 80%.'),
              pw.Bullet(
                  text:
                      ' Led RoboSoccer project, attracting 400+ students and enhancing robotics skills.'),
              pw.SizedBox(height: 10), 
              _buildLineSeparator(),

              // Projects Section
              pw.Text('PROJECTS',
                  style: pw.TextStyle(
                      fontSize: 14, fontWeight: pw.FontWeight.bold)),
              _buildDarkBullet(
                  'CampusTracker'), 
              pw.Bullet(
                  text:
                      " Developed a responsive Web and App application for NIT Hamirpur's campus, reducing lost-and-found resolution time by 50%."),
              _buildDarkBullet(
                  'Sampark App'), 
              pw.Bullet(
                  text:
                      'Created a feature-rich chat application with functionalities for text, image, and video calls group and one to one, messaging in one to and group, Live Streaming.'),
              pw.SizedBox(height: 10),
              _buildLineSeparator(),

              // Achievements Section 
              pw.Text('ACHIEVEMENTS',
                  style: pw.TextStyle(
                      fontSize: 14, fontWeight: pw.FontWeight.bold)),
              _buildBullet(
                  'Rajasthan State Topper in Class 12 with 100% marks'),
              _buildBullet(
                  'Second College Topper of NITH on Coding Ninjas platform'),
              _buildBullet(
                  'Solved 500+ Data Structures and Algorithms problems on LeetCode, Code 360'),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }

  // Helper function to create URL buttons
  pw.Widget _buildUrlText(String text, String url) {
    return pw.UrlLink(
      destination: url,
      child: pw.Text(
        text,
        style: const pw.TextStyle(
          decoration: pw.TextDecoration.underline,
          color: PdfColors.black,
        ),
      ),
    );
  }

 
  pw.Widget _buildBullet(String text) {
    return pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Container(
          width: 5,
          height: 5,
          margin: const pw.EdgeInsets.only(top: 7, right: 5),
          decoration: const pw.BoxDecoration(
            color: PdfColors.black,
            shape: pw.BoxShape.circle,
          ),
        ),
        pw.Expanded(child: pw.Text(text)),
      ],
    );
  }

  
  pw.Widget _buildDarkBullet(String text) {
    return pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Container(
          width: 6,
          height: 6,
          margin: const pw.EdgeInsets.only(top: 7, right: 5),
          decoration: const pw.BoxDecoration(
            color: PdfColors.black,
            shape: pw.BoxShape.circle,
          ),
        ),
        pw.Expanded(
            child: pw.Text(text,
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold))),
      ],
    );
  }

  
  pw.Widget _buildLineSeparator() {
    return pw.Container(
      width: double.infinity,
      height: 1,
      color: PdfColors.black, 
      margin: const pw.EdgeInsets.symmetric(
          vertical: 5), 
    );
  }
}
