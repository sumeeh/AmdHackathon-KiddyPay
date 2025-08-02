import 'package:flutter/material.dart';
import 'dart:async';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  bool showPersonalityPopup = true;
  bool showWelcomePopup = false;
  late AnimationController _fireworksController;
  // late Animation<double> _fireworksAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize fireworks animation
    _fireworksController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    
    // Start the popup sequence
    _startPopupSequence();
  }

  void _startPopupSequence() {
    // Start fireworks animation
    _fireworksController.repeat();


        // Hide welcome popup after 5 seconds
        Timer(Duration(seconds: 5), () {
          if (mounted) {
            setState(() {
              showWelcomePopup = false;
            });
          }
        });
  }

  @override
  void dispose() {
    _fireworksController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Stack(
        children: [
          // Main content
          SafeArea(
            child: Column(
              children: [
                SizedBox(height: 20),
                Text(
                  'الرئيسية',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 30),

                // Profile Card
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFF9BB5A6), width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(
                                  'assets/profile.jpeg',
                                ),
                                backgroundColor: Colors.grey[300],
                              ),
                              SizedBox(height: 8),
                              Text(
                                'أهلاً راكان!',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '1250 نقطة',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFFE6B800),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'الرصيد الاجمالي',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'ر.س 200',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.account_balance_wallet,
                                color: Color(0xFF9BB5A6),
                                size: 24,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30),

                // Level indicator
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Color(0xFF9BB5A6),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    'المستوى 3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 20),

                // Progress bar with star
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: Stack(
                    children: [
                      Container(
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      Container(
                        height: 10,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Color(0xFF9BB5A6),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      Positioned(
                        right: 135,
                        top: -12,
                        child: Icon(
                          Icons.star,
                          color: Color(0xFFE6B800),
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                ),

                Spacer(),

                // Daily Tasks Section
                Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xFF9BB5A6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'المهام اليومية',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.calendar_today, color: Colors.white),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Color(0xFF7A9B87),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.star_outline,
                                    color: Color(0xFFE6B800),
                                    size: 30,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    '20 نقطة',
                                    style: TextStyle(
                                      color: Color(0xFFE6B800),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'قصص عن الصدقة والعطاء',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Color(0xFF7A9B87),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.star_outline,
                                    color: Color(0xFFE6B800),
                                    size: 30,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    '30 نقطة',
                                    style: TextStyle(
                                      color: Color(0xFFE6B800),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'تعلم الادخار بطريقة ممتعة',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Text(
                        'عرض المهام',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),          

          // Welcome Popup
          if (showWelcomePopup)
            Container(
              color: Colors.black.withOpacity(0.7),
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('👋', style: TextStyle(fontSize: 50)),

                      SizedBox(height: 20),

                      Text(
                        'أهلاً وسهلاً بك في KiddyPay!',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: 15),

                      Text(
                        'ابدأ رحلتك في تعلم إدارة المال بطريقة ممتعة ومفيدة!',
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),

      // Bottom Navigation
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/goals'),
              child: _buildNavItem(Icons.track_changes, 'أهدافي', false),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/challenges'),
              child: _buildNavItem(Icons.trending_up, 'التحديات', false),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/cards'),
              child: _buildNavItem(Icons.credit_card, 'البطاقات', false),
            ),
            _buildNavItem(Icons.access_time, 'التخطيط', false),
            _buildNavItem(Icons.home, 'الرئيسية', true),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: isActive ? Color(0xFF9BB5A6) : Colors.grey[400],
          size: 24,
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: isActive ? Color(0xFF9BB5A6) : Colors.grey[400],
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
