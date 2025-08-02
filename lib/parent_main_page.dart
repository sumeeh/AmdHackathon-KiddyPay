import 'package:flutter/material.dart';

class ParentMainPage extends StatefulWidget {
  @override
  _ParentMainPageState createState() => _ParentMainPageState();
}

class _ParentMainPageState extends State<ParentMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),

              // Header
              Text(
                'حياك الله يا أبو راكان',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              SizedBox(height: 30),

              // Summary Card
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFB8D4C1), Color(0xFF9BB5A6)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildSummaryItem('3', 'عدد الأطفال'),
                    _buildSummaryItem('500', 'إجمالي المصروف'),
                    _buildSummaryItem('85%', 'الادخار'),
                  ],
                ),
              ),

              SizedBox(height: 30),

              // Add Child Button & My Kids Header
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/add-child'),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF8A7CFF),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.add, color: Colors.white, size: 16),
                            SizedBox(width: 5),
                            Text(
                              'إضافة طفل',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      'أطفالي',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // Kids Cards
              _buildKidCard(
                context: context,
                name: 'راكان',
                level: 'المستوى 3',
                points: 1250,
                spent: 489,
                saved: 285,
                isActive: true,
                profileImage: 'assets/profile.jpeg',
                alertType: 'normal',
              ),

              SizedBox(height: 15),

              SizedBox(height: 15),

              _buildKidCard(
                context: context,
                name: 'سارة',
                level: 'المستوى 2',
                points: 850,
                spent: 320,
                saved: 180,
                isActive: true,
                profileImage: 'assets/kidgirl.jpeg',
                alertType: 'security',
              ),

              SizedBox(height: 20),
            ],
          ),
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
            _buildNavItem(Icons.person, 'حسابي', false),
            _buildNavItem(Icons.credit_card, 'البطاقات', false),
            _buildNavItem(Icons.bar_chart, 'أهدافي', false),
            _buildNavItem(Icons.notifications, 'التنبيهات', false),
            _buildNavItem(Icons.home, 'الرئيسية', true),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.white70)),
      ],
    );
  }

  Widget _buildKidCard({
    required BuildContext context,
    required String name,
    required String level,
    required int points,
    required int spent,
    required int saved,
    required bool isActive,
    required String profileImage,
    required String alertType,
  }) {
    bool isSecurityAlert = alertType == 'security';

    return GestureDetector(
      onTap: () {
        if (isSecurityAlert) {
          _showSecurityAlert(context, name);
        } else {
          Navigator.pushNamed(
            context,
            '/kid-statistics',
            arguments: {'kidName': name},
          );
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isSecurityAlert
              ? Color(0xFFE57373)
              : (isActive ? Colors.white : Colors.grey[100]),
          borderRadius: BorderRadius.circular(15),
          border: isSecurityAlert
              ? Border.all(color: Color(0xFFD32F2F), width: 2)
              : (isActive
                    ? Border.all(color: Color(0xFF9BB5A6), width: 2)
                    : Border.all(color: Colors.grey[300]!, width: 1)),
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
            // Header with name and level
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(profileImage),
                      backgroundColor: Colors.grey[300],
                      onBackgroundImageError: (_, __) {},
                      child: profileImage.isEmpty
                          ? Icon(Icons.person, color: Colors.grey[600])
                          : null,
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: isSecurityAlert
                                ? Colors.white
                                : Colors.black87,
                          ),
                        ),
                        if (isSecurityAlert)
                          Text(
                            'تنبية! نشاط غير طبيعي',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        else
                          Text(
                            level,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: isSecurityAlert
                        ? Colors.white
                        : (isActive ? Color(0xFF9BB5A6) : Colors.orange),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    isSecurityAlert ? 'تنبيه' : (isActive ? 'نشط' : 'غير نشط'),
                    style: TextStyle(
                      color: isSecurityAlert ? Color(0xFFD32F2F) : Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            // Stats Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem(points.toString(), 'النقاط', isSecurityAlert),
                _buildStatItem(spent.toString(), 'المُنفق', isSecurityAlert),
                _buildStatItem(saved.toString(), 'الرصيد', isSecurityAlert),
              ],
            ),

            SizedBox(height: 15),

            // Action Button
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isSecurityAlert ? Colors.white : Color(0xFF8A7CFF),
                shape: BoxShape.circle,
              ),
              child: Icon(
                isSecurityAlert ? Icons.warning : Icons.add,
                color: isSecurityAlert ? Color(0xFFD32F2F) : Colors.white,
                size: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String value, String label, bool isSecurityAlert) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isSecurityAlert ? Colors.white : Colors.black87,
          ),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isSecurityAlert ? Colors.white70 : Colors.grey[600],
          ),
        ),
      ],
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

  void _showSecurityAlert(BuildContext context, String kidName) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            // Handle bar
            Container(
              width: 40,
              height: 4,
              margin: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            SizedBox(height: 20),

            // Header
            Text(
              'تفاصيل العملية',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            SizedBox(height: 30),

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _buildDetailItem('المبلغ:', '500 ريال سعودي'),
                      SizedBox(height: 20),
                      _buildDetailItem(
                        'الوقت:',
                        '3:12 صباحاً - الثلاثاء 31 يوليو 2025',
                      ),
                      SizedBox(height: 20),
                      _buildDetailItem(
                        'الموقع الجغرافي:',
                        'جدة\n(السلوك المعتاد: الرياض)',
                      ),
                      SizedBox(height: 20),
                      _buildDetailItem('نوع العملية:', 'شراء إلكتروني'),
                      SizedBox(height: 20),
                      _buildDetailItem(
                        'اسم المتجر:',
                        'buy-example.xyz (غير معروف)',
                      ),
                      SizedBox(height: 30),

                      // Warning options
                      Center(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                                margin: EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                  color: Color(0xFF9BB5A6),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  'تأكيد ان العملية آمنة',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                                margin: EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  'تجاهل التنبيه',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                                margin: EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                  color: Color(0xFFE57373),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  'تحديد العملية كمشبوهة',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

  Widget _buildDetailItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 5),
        Text(
          value,
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}
