import 'dart:convert';
import 'package:ecommerce_application/home.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce_application/auth/register.dart';
import 'package:flutter/material.dart';

Future<void> loginUser(
    BuildContext context, String email, String password) async {
  String apiUrl =
      'http://localhost:8000/api/login'; // Ganti dengan URL REST API login Anda

  // Mengirim data login ke REST API
  http.Response response = await http.post(
    Uri.parse(apiUrl),
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: {
      'email': email,
      'password': password,
    },
  );

  // Menangani response dari REST API
  if (response.statusCode == 200) {
    // Jika login berhasil, Anda dapat mengatur logika navigasi ke halaman beranda atau halaman lain yang diinginkan
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  } else {
    // Jika login gagal, Anda dapat menangani error sesuai dengan response dari REST API
    print('Login failed. Status code: ${response.statusCode}');
    dynamic data = json.decode(response.body);
    print('Error message: ${data['message']}');
  }
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lest Up',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LestUpScreen(),
      routes: {
        '/newScreen': (context) =>
            NewScreen(), // Daftarkan rute untuk halaman baru
      },
    );
  }
}

class LestUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(25),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Colors.teal,
                    width: 2.0,
                  ),
                ),
                padding: EdgeInsets.all(5.0),
                child: Text(
                  'Tentang Kami',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    'Yomari International, Kendaraan Bisnis Terbaik dan Tercepat Meraih IMPIAN dan Menghasilkan PASSIVE INCOME.',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Mungkin kamu seringkali berpikir, “Kok bisa ya, orang-orang terkaya di dunia uangnya tidak pernah habis?”, bahkan sampai ada ungkapan “uangnya tidak berseri”. Tahukah kamu apa alasannya orang-orang tersebut bisa hidup seperti itu? Jawabannya karena mereka menghasilkan PASSIVE INCOME.',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    height: 200.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/apli.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/newScreen');
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 255, 255, 255),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 7,
                shadowColor: Colors.grey.withOpacity(0.8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.arrow_circle_up,
                    size: 22,
                    color: Colors.teal,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25),
            child: Container(
              padding: EdgeInsets.all(5.0), // Padding teks di dalam container
              child: Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller:
                      emailController, // Menggunakan controller emailController
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller:
                      passwordController, // Menggunakan controller passwordController
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    // Mengambil nilai email dan password dari inputan pengguna
                    String email = emailController.text;
                    String password = passwordController.text;

                    // Memanggil fungsi loginUser untuk mengirim data login ke REST API
                    try {
                      await loginUser(context, email, password);
                    } catch (error) {
                      print('Error while logging in: $error');
                    }
                  },
                  child: Text('Login'),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Aksi ketika tombol register ditekan
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterForm()),
                    );
                  },
                  child: Text('belum punya akun? Register'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
