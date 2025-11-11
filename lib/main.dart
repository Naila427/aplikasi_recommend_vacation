import 'package:flutter/material.dart';
import 'dashboard_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UTS MOBILE PROGRAMMING',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  final Color lightCoral = Color(0xFFF08080);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightCoral,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("Selamat Datang",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                Text("Silahkan login untuk melanjutkan"),
                SizedBox(height: 20),
                Image.asset("assets/hii.png", height: 120),
                SizedBox(height: 20),
                TextField(
                  controller: emailC,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: "Email / Username",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 12),
                TextField(
                  controller: passC,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: "Password",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: () {
                    if (emailC.text.isEmpty || passC.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Field tidak boleh kosong")),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DashboardPage(username: emailC.text),
                        ),
                      );
                    }
                  },
                  child: Text("Login", style: TextStyle(color: Colors.black)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
