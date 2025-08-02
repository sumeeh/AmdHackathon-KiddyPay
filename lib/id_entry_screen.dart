import 'package:flutter/material.dart';

class IdEntryScreen extends StatefulWidget {
  @override
  _IdEntryScreenState createState() => _IdEntryScreenState();
}

class _IdEntryScreenState extends State<IdEntryScreen> {
  TextEditingController _idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Color(0xFF9BB5A6), width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // KiddyPay Logo Section with Image
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xFF9BB5A6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Logo Image
                        Container(
                          height: 70,
                          width: 100,
                          child: Image.asset(
                            'assets/KiddyPayDarkLogo.png',
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(
                                Icons.account_balance_wallet,
                                size: 20,
                                color: Colors.white,
                              );
                            },
                          ),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                  ),

                  SizedBox(height: 25),

                  Text(
                    'بطاقة الأحوال/الإقامة',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF9BB5A6),
                    ),
                  ),

                  SizedBox(height: 20),

                  // ID Input Field
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: TextField(
                      controller: _idController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                        hintText: 'أدخل رقم بطاقة الأحوال/الإقامة',
                        hintStyle: TextStyle(color: Colors.grey[500]),
                        border: InputBorder.none,
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  // Continue Button
                  // Continue Button
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_idController.text.isNotEmpty) {
                          // Get the arguments from this screen
                          final arguments =
                              ModalRoute.of(context)?.settings.arguments
                                  as Map<String, dynamic>?;
                          final userType = arguments?['userType'] ?? 'kid';

                          // Pass them to verification screen
                          Navigator.pushNamed(
                            context,
                            '/verification',
                            arguments: {'userType': userType}, // ← ADD THIS!
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF9BB5A6),
                        padding: EdgeInsets.symmetric(vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'سجل دخولك',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _idController.dispose();
    super.dispose();
  }
}
