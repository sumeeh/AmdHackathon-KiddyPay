import 'package:flutter/material.dart';

class PersonalityQuestionsScreen extends StatefulWidget {
  @override
  _PersonalityQuestionsScreenState createState() => _PersonalityQuestionsScreenState();
}

class _PersonalityQuestionsScreenState extends State<PersonalityQuestionsScreen> {
  PageController _pageController = PageController();
  int currentPage = 0;
  int? hoveredIndex; 

  List<Map<String, dynamic>> questions = [
    {
      'title': 'ركز! واكتشف شخصيتك المالية',
      'subtitle': 'جاوب على الأسئلة عشان نعرف شخصيتك أكثر',
      'options': [
        'أحب المغامرات والتجارب الجديدة',
        'أحب التخطيط والتنظيم',
        'أحب مساعدة الآخرين والعطاء',
        'أحب جمع النقود والادخار'
      ]
    },
    {
      'title': 'ركز! واكتشف شخصيتك المالية',
      'subtitle': 'إذا كان عندك 10 ريال، ودك تشتري لعبة ب15 ريال، وش تسوي؟',
      'options': [
        'أستنى وأجمع زيادة',
        'أشتري لعبة أرخص',
        'أطلب من أمي بيشترونها',
        'أزعل لنني ما قدرت أشتري منتها'
      ]
    },
    {
      'title': 'ركز! واكتشف شخصيتك المالية',
      'subtitle': 'إذا جاك مبلغ مفاجئ (مثلاً أحد أعطاك 50 ريال)، وش تسوي؟',
      'options': [
        'أحطها في حصالتي',
        'أروح أشتري شي أحبه على طول',
        'أتبرع بجزء منها لمن يحتاج',
        'أبحث عن طريقة أخليها تصير 100 ريال'
      ]
    },
    {
      'title': 'ركز! واكتشف شخصيتك المالية',
      'subtitle': 'لو صاحبك اشترى لعبة غالية وأنت ما تقدر، وش يكون رد فعلك؟',
      'options': [
        'أحاول أوفر عشان أشتريها',
        'أطلب من أمي يشترونها',
        'أزعل لنني ما قدرت أشتري منتها',
        'أقول الحمد لله وأفكر في شي ثاني يناسب ميزانيتي'
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50),
            
            // Header with waving hand emoji
            Row(
              children: [
                SizedBox(width: 20),
                Text(
                  '👋',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(width: 10),
                Text(
                  'أهلاً ببطلنا راكان',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            
            SizedBox(height: 10),
            
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: questions.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                    hoveredIndex = null; 
                  });
                },
                itemBuilder: (context, index) {
                  return _buildQuestionPage(questions[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionPage(Map<String, dynamic> question) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Question Title
          Text(
            question['title'],
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          
          SizedBox(height: 20),
          
          // Question Subtitle
          Text(
            question['subtitle'],
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
              height: 1.4,
            ),
          ),
          
          SizedBox(height: 40),
          
          // Options with hover effect
          ...question['options'].asMap().entries.map((entry) {
            int index = entry.key;
            String option = entry.value;
            bool isHovered = hoveredIndex == index;
            
            return Container(
              margin: EdgeInsets.only(bottom: 15),
              child: MouseRegion(
                onEnter: (_) {
                  setState(() {
                    hoveredIndex = index;
                  });
                },
                onExit: (_) {
                  setState(() {
                    hoveredIndex = null;
                  });
                },
                child: GestureDetector(
                  onTap: () {
                    // Move to next question or complete setup
                    if (currentPage < questions.length - 1) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    } else {
                      // Go to main app
                      Navigator.pushReplacementNamed(context, '/main');
                    }
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    width: double.infinity,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: isHovered ? Color(0xFF9BB5A6) : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: isHovered ? Color(0xFF9BB5A6) : Colors.grey[300]!,
                        width: isHovered ? 2 : 1,
                      ),
                      boxShadow: isHovered ? [
                        BoxShadow(
                          color: Color(0xFF9BB5A6).withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ] : [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      option,
                      style: TextStyle(
                        fontSize: 16,
                        color: isHovered ? Colors.white : Colors.black87,
                        fontWeight: isHovered ? FontWeight.bold : FontWeight.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}