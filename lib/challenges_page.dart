import 'package:flutter/material.dart';

class ChallengesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            
            // Header
            Text(
              'التحديات والمكافآت',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            
            SizedBox(height: 30),
            
            // Hero Card
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF9BB5A6), Color(0xFF7A9B87)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'أهلاً يا بطل!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'شوف التحديات اللي يتسويها\nوالمكافآت اللي تجيك',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Color(0xFFE6B800),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '1250\nنقطة',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 30),
            
            // Challenges Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'التحديات',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            
            SizedBox(height: 15),
            
            // Challenge Items
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _buildChallengeItem('الصلاة في المسجد', '50 نقطة', true),
                  _buildChallengeItem('رسم شيء يعجبني اليوم', '20 نقطة', true),
                  _buildChallengeItem('حل لغز أو بازل لمدة 10 دقائق', '30 نقطة', true),
                  _buildChallengeItem('تعلم 10 كلمات من لغة جديدة', '20 نقطة', true),
                ],
              ),
            ),
            
            SizedBox(height: 20),
            
            // Rewards Section
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFF9BB5A6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Text(
                    'المكافآت',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                  SizedBox(height: 20),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildRewardItem(Icons.emoji_events, 'كأس'),
                      _buildRewardItem(Icons.card_giftcard, 'هدية'),
                      _buildRewardItem(Icons.star, 'نجمة'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
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
            _buildNavItem(Icons.trending_up, 'التحديات', true),
            _buildNavItem(Icons.apps, 'التطبيقات', false),
            _buildNavItem(Icons.access_time, 'التخطيط', false),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/main'),
              child: _buildNavItem(Icons.home, 'الرئيسية', false),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChallengeItem(String title, String points, bool completed) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: completed ? Colors.green : Color(0xFF9BB5A6),
              shape: BoxShape.circle,
            ),
            child: Icon(
              completed ? Icons.check : Icons.star_outline,
              color: Colors.white,
              size: 24,
            ),
          ),
          
          SizedBox(width: 15),
          
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
          
          Text(
            points,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFFE6B800),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRewardItem(IconData icon, String label) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Color(0xFF7A9B87),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 30),
          SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
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