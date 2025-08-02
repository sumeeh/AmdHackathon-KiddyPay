// main.dart
import 'package:flutter/material.dart';
import 'signup_screen.dart';
import 'id_entry_screen.dart';
import 'verification_screen.dart';
import 'personality_questions_screen.dart';
import 'main_page.dart';
import 'goals_page.dart';
import 'challenges_page.dart';
import 'cards_page.dart';
import 'card_request_page.dart';
import 'user_type_selection_screen.dart';
import 'parent_main_page.dart';
import 'add_child_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'kid_statistics_page.dart';

void main() {
  runApp(KiddyPayApp());
}

class KiddyPayApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KiddyPay',
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: GoogleFonts.tajawalTextTheme(),
      ),
      home: UserTypeSelectionScreen(),
      routes: {
        '/signup': (context) => SignupScreen(),
        '/id-entry': (context) => IdEntryScreen(),
        '/verification': (context) => VerificationScreen(),
        '/personality': (context) => PersonalityQuestionsScreen(),
        '/main': (context) => MainPage(),
        '/goals': (context) => GoalsPage(),
        '/challenges': (context) => ChallengesPage(),
        '/cards': (context) => CardsPage(),
        '/card-request': (context) => CardRequestPage(),
        '/user-type': (context) => UserTypeSelectionScreen(),
        '/parent-main': (context) => ParentMainPage(),
        '/add-child': (context) => AddChildPage(),
        '/kid-statistics': (context) => KidStatisticsPage(
          kidName:
              (ModalRoute.of(context)?.settings.arguments
                  as Map<String, dynamic>?)?['kidName'] ??
              'طفل',
        ),
      },
      builder: (context, child) {
        return Directionality(textDirection: TextDirection.rtl, child: child!);
      },
    );
  }
}
