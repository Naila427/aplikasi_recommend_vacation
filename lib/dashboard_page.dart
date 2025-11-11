import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'detail_page.dart';

class DashboardPage extends StatelessWidget {
  final String username;
  DashboardPage({required this.username});

  final Color lightCoral = Color(0xFFF08080);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightCoral,
        title: Text("Recomment Vacation"),
        actions: [Icon(Icons.notifications), SizedBox(width: 10)],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  "assets/vacation.png",
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),

              Text(
                "Rekomendasi",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  vacationItem(
                    context,
                    "Bali",
                    "assets/bali.png",
                    "Pulau dengan pantai indah dan budaya unik.",
                  ),
                  vacationItem(
                    context,
                    "Bromo",
                    "assets/bromo.png",
                    "Destinasi wisata gunung dengan panorama alam yang luar biasa.",
                  ),
                  vacationItem(
                    context,
                    "Labuan Bajo",
                    "assets/labuan bajo.png",
                    "Destinasi populer dengan pulau komodo.",
                  ),
                ],
              ),

              SizedBox(height: 30),

              Text(
                "Menu",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  menuItem(Icons.person, "Profil", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(username: username),
                      ),
                    );
                  }),
                  menuItem(Icons.list, "Data", () {}),
                  menuItem(Icons.settings, "Pengaturan", () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget vacationItem(
    BuildContext context,
    String title,
    String imgPath,
    String desc,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DetailPage(title: title, image: imgPath, description: desc),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: 90,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(imgPath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(title),
        ],
      ),
    );
  }

  Widget menuItem(IconData icon, String label, VoidCallback onTap) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: lightCoral,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.white),
          ),
        ),
        SizedBox(height: 5),
        Text(label),
      ],
    );
  }
}
