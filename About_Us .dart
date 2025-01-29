import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pinkAccent.shade100, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      'https://images.deliveryhero.io/image/fd-sg/corporate/corporate-landing-page/sign-up-page/illustration_paupaumobilefinger.png',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Food Panda',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.pinkAccent.shade700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Your favorite food delivered fast at your door.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildSectionCard(
                    title: 'Our Mission',
                    content:
                        'At Food Panda, our mission is to bring delicious food from your favorite local restaurants right to your doorstep. We strive to provide fast and reliable delivery with the best customer service.',
                    icon: Icons.food_bank,
                  ),
                  const SizedBox(height: 16),
                  _buildSectionCard(
                    title: 'Contact Us',
                    content:
                        '📧 Email: support@foodpanda.com\n📞 Phone: +0123 456 7890\n🏠 Address: 123 Food Panda Street, Food City, FP 12345',
                    icon: Icons.contact_mail,
                  ),
                  const SizedBox(height: 16),
                  _buildSectionCard(
                    title: 'About Developer',
                    content:
                        '📧 Email: SeatSatya@gmail.com\n📞 Phone: +855 456 7890\n🏠 Address: 05 Svay Pak Commune, Russey Keo District, Phnom Penh',
                    icon: Icons.person,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Back to previous screen
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pinkAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    ),
                    child: const Text(
                      'Back',
                      style: TextStyle(fontSize: 16, color: Colors.white),
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

  Widget _buildSectionCard({required String title, required String content, required IconData icon}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 40, color: Colors.pinkAccent), // Fixed icon size
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.pinkAccent.shade700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
