import 'package:ecommerce_application/auth/artikel/artikel.dart';
import 'package:ecommerce_application/home.dart';
import 'package:ecommerce_application/home_screen.dart';
import 'package:ecommerce_application/produk/produk.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String name = '';
  String email = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    Uri apiUrl = Uri.parse('http://localhost:8000/api/me');

    try {
      final response = await http.get(
        apiUrl,
        headers: {'Authorization': 'Bearer santom'},
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          name = data['name'];
          email = data['email'];
        });
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> logout() async {
    Uri logoutUrl = Uri.parse('http://localhost:8000/api/logout');

    try {
      final response = await http.post(
        logoutUrl,
        headers: {'Authorization': 'Bearer santom'},
      );
      if (response.statusCode == 200) {
        // Berhasil logout
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage(
                    'https://maulidayanti.com/assets/img/avatars/1.png',
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Nama : $name',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              Text(
                name,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[700],
                ),
              ),
              Text(
                'Email : $email',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                email,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Column(
                      children: [
                        Icon(Icons.topic, size: 40.0),
                        SizedBox(height: 5.0),
                        Text(
                          'Organik',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Column(
                      children: [
                        Icon(Icons.view_agenda, size: 40.0),
                        SizedBox(height: 5.0),
                        Text(
                          'Kimia',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Column(
                      children: [
                        Icon(Icons.invert_colors, size: 40.0),
                        SizedBox(height: 5.0),
                        Text(
                          'YGO',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50.0),
              ElevatedButton(
                onPressed: () {
                  logout();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                child: Text('Keluar'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 4,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ShopPage()),
            );
          } else if (index == 2) {
            //
          } else if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ArtikelMenu()),
            );
          } else if (index == 4) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AccountPage()),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
            backgroundColor: Color.fromARGB(255, 20, 140, 145),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_grocery_store_sharp),
            label: 'Produk',
            backgroundColor: Color.fromARGB(255, 20, 140, 145),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: 'Tambah',
            backgroundColor: Color.fromARGB(255, 20, 140, 145),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Blog',
            backgroundColor: Color.fromARGB(255, 20, 140, 145),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Akun',
            backgroundColor: Color.fromARGB(255, 20, 140, 145),
          ),
        ],
      ),
    );
  }
}
