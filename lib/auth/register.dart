import 'dart:convert';

import 'package:ecommerce_application/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmasipasswordController = TextEditingController();

  Future<void> registerUser(String username, String email, String password,
      String passwordConfirmation) async {
    String apiUrl =
        'http://localhost:8000/api/register'; // Ganti dengan URL REST API register Anda

    // Mengirim data login ke REST API
    http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'name': username,
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmation,
      },
    );

    // Menangani response dari REST API
    if (response.statusCode == 200) {
      // Jika register berhasil, Anda dapat mengatur logika navigasi ke halaman beranda atau halaman lain yang diinginkan
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else if (response.statusCode == 422) {
      // Jika register gagal karena validasi gagal, Anda dapat menampilkan pesan error yang diberikan oleh REST API
      String errorMessage = jsonDecode(response.body)['errors']['email'][0];
      print('Register failed. Status code: ${response.statusCode}');
      print('Error message: $errorMessage');
    } else {
      // Jika register gagal karena alasan lain, Anda dapat menampilkan pesan error umum
      print('Register failed. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Sign Up',
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
              children: [
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _confirmasipasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Confirmasi Password',
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    // Aksi ketika tombol register ditekan
                    String username = _usernameController.text;
                    String email = _emailController.text;
                    String password = _passwordController.text;
                    String passwordConfirmation =
                        _confirmasipasswordController.text;

                    await registerUser(
                        username, email, password, passwordConfirmation);
                  },
                  child: Text('Register'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
