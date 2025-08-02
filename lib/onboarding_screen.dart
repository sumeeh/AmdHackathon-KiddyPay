import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                children: [
                  _buildOnboardingPage(
                    title: 'أهلاً بك في عالم المال!',
                    description: 'مع KiddyPay ستتعلم كيف تدير مصروفك بذكاء وتصبح مليونيراً صغيراً! ⭐',
                    imagePath: 'assets/image11.png',
                  ),
                  _buildOnboardingPage(
                    title: 'ضع هدف وتتنقل عليها',
                    description: 'نخ تجمع لشئ تحبة اللعبة الجديدة الدراجة KiddyPay يساعدك تذكر وتوصل لهدفك.',
                    imagePath: 'assets/22.png',
                  ),
                  _buildOnboardingPage(
                    title: 'KiddyPay',
                    description: 'نساعدك في إدارة فلوسك، تقسيمها على حسب احتياجاتك، مع إمكانية تحديد أهداف مالية .',
                    imagePath: 'assets/image11.png',
                  ),
                  _buildOnboardingPage(
                    title: 'كل يوم تحدي جديد!',
                    description: 'تحدي بسيط كل يوم، وكل ما خلصت، تكتسب وتقرب لهدفك!',
                    imagePath: 'assets/2222.png',
                  ),
                ],
              ),
            ),
            
            // Page Indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) => 
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: currentIndex == index ? 12 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: currentIndex == index ? Color(0xFF9BB5A6) : Colors.grey[300],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            
            SizedBox(height: 30),
            
            // Navigation Buttons
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (currentIndex > 0)
                    TextButton(
                      onPressed: () {
                        _pageController.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      },
                      child: Text(
                        'السابق',
                        style: TextStyle(
                          color: Color(0xFF9BB5A6),
                          fontSize: 16,
                        ),
                      ),
                    )
                  else
                    SizedBox.shrink(),
                  
                  if (currentIndex < 3)
                    TextButton(
                      onPressed: () {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      },
                      child: Text(
                        'التالي',
                        style: TextStyle(
                          color: Color(0xFF9BB5A6),
                          fontSize: 16,
                        ),
                      ),
                    )
                  else
                    TextButton(
                      onPressed: () {
                        // Changed to go to signup instead of main
                        Navigator.pushReplacementNamed(context, '/signup');
                      },
                      child: Text(
                        'ابدأ',
                        style: TextStyle(
                          color: Color(0xFF9BB5A6),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
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
    );
  }

  Widget _buildOnboardingPage({
    required String title,
    required String description,
    required String imagePath,
  }) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 400,
            width: 400,
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.image,
                  size: 100,
                  color: Colors.grey[400],
                );
              },
            ),
          ),
          
          SizedBox(height: 40),
          
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          
          SizedBox(height: 20),
          
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}