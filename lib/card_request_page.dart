import 'package:flutter/material.dart';

class CardRequestPage extends StatefulWidget {
  @override
  _CardRequestPageState createState() => _CardRequestPageState();
}

class _CardRequestPageState extends State<CardRequestPage> {
  String selectedCity = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Card Stack Image Placeholder
          Container(
            height: 300,
            width: 700,
            margin: EdgeInsets.all(20),
            child: Center(
              child: Image.asset(
                'assets/card.png',
                // fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.account_balance_wallet,
                    size: 100,
                    color: Color(0xFF9BB5A6),
                  );
                },
              ),
            ),
          ),

          SizedBox(height: 20),

          // Title
          Text(
            'طلب البطاقة البلاستيكية',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),

          SizedBox(height: 10),

          // Location subtitle
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on, color: Colors.red, size: 16),
              SizedBox(width: 5),
              Text(
                'حدد موقعك الآن',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
            ],
          ),

          SizedBox(height: 30),

          // City Dropdown
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedCity.isEmpty ? null : selectedCity,
                hint: Text(
                  'المدينة',
                  style: TextStyle(color: Colors.grey[600], fontSize: 16),
                ),
                isExpanded: true,
                items:
                    [
                      'الرياض',
                      'جدة',
                      'الدمام',
                      'مكة المكرمة',
                      'المدينة المنورة',
                      'الطائف',
                      'تبوك',
                      'بريدة',
                      'خميس مشيط',
                      'حائل',
                    ].map((String city) {
                      return DropdownMenuItem<String>(
                        value: city,
                        child: Text(city, style: TextStyle(fontSize: 16)),
                      );
                    }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCity = newValue!;
                  });
                },
                icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey[600]),
              ),
            ),
          ),

          Spacer(),

          // Delivery Fee Section
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xFF9BB5A6),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.local_shipping,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'رسوم التوصيل',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'ريال 30.00',
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.check_circle, color: Color(0xFF9BB5A6), size: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
