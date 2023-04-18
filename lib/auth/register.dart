import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmasipasswordController = TextEditingController();

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
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Confirmasi Password',
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
                  onPressed: () {
                    // Aksi ketika tombol register ditekan
                    String username = _usernameController.text;
                    String email = _emailController.text;
                    String password = _passwordController.text;
                    String confirmasipassword =
                        _confirmasipasswordController.text;

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
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

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('Selamat! Anda berhasil registrasi'),
      ),
    );
  }
}
