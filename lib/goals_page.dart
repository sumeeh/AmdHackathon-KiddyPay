import 'package:flutter/material.dart';

class GoalsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Spacer(),
                  Text(
                    'أهدافي',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back_ios, size: 20),
                  ),
                ],
              ),
            ),
            
            // Category buttons
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildCategoryButton('مستلزمات المدرسة', Icons.school),
                  _buildCategoryButton('هدية للوالدين', Icons.card_giftcard),
                  _buildCategoryButton('لعبة جديدة', Icons.gamepad_outlined),
                ],
              ),
            ),
            
            SizedBox(height: 30),
            
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Color(0xFF9BB5A6), width: 2),
              ),
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage('assets/VR.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: FractionallySizedBox(
                            alignment: Alignment.centerRight,
                            widthFactor: 0.25,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF9BB5A6),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        '25%',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF9BB5A6),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 30),
            
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'آخر العمليات',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            
            SizedBox(height: 15),
            
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _buildOperationItem('20 ريال', 'إضافة مبلغ'),
                  _buildOperationItem('40 ريال', 'إضافة مبلغ'),
                  _buildOperationItem('30 ريال', 'إضافة مبلغ'),
                ],
              ),
            ),
          ],
        ),
      ),
      
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
            _buildNavItem(Icons.track_changes, 'أهدافي', true),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/challenges'),
              child: _buildNavItem(Icons.trending_up, 'التحديات', false),
            ),
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

  Widget _buildCategoryButton(String text, IconData icon) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Color(0xFF9BB5A6),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 24),
        ),
        SizedBox(height: 8),
        Text(text, style: TextStyle(fontSize: 12), textAlign: TextAlign.center),
      ],
    );
  }

  Widget _buildOperationItem(String amount, String type) {
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
          Text(
            amount,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF9BB5A6),
            ),
          ),
          Expanded(
            child: Text(
              type,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Color(0xFF9BB5A6),
              shape: BoxShape.circle,
            ),
            child: Transform.rotate(
              angle: -0.7,
              child: Icon(Icons.arrow_upward, color: Colors.white, size: 20),
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