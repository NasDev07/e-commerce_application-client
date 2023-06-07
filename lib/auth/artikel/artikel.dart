import 'package:ecommerce_application/home.dart';
import 'package:ecommerce_application/me/me.dart';
import 'package:ecommerce_application/produk/produk.dart';
import 'package:flutter/material.dart';

class ArtikelMenu extends StatelessWidget {
  final List<Artikel> artikelList = [
    Artikel(
      gambar: 'assets/produk1.jpg',
      judul: 'Golden Organik',
      body:
          'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.',
    ),
    Artikel(
      gambar: 'assets/produk2.jpg',
      judul: 'Optifeed',
      body:
          'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.',
    ),
    Artikel(
      gambar: 'assets/produk3.jpg',
      judul: 'Cara memakai pupuk YGO',
      body:
          'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.',
    ),
    // Tambahkan artikel lainnya sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text('Menu Artikel'),
          ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: artikelList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Image.asset(
                  artikelList[index].gambar,
                  width: 80.0,
                  height: 80.0,
                  fit: BoxFit.cover,
                ),
                title: Text(artikelList[index].judul),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailArtikel(artikel: artikelList[index]),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
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

class Artikel {
  final String gambar;
  final String judul;
  final String body;

  Artikel({
    required this.gambar,
    required this.judul,
    required this.body,
  });
}

class DetailArtikel extends StatelessWidget {
  final Artikel artikel;

  DetailArtikel({required this.artikel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Artikel'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(artikel.gambar),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    artikel.judul,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    artikel.body,
                    style: TextStyle(fontSize: 18.0),
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
