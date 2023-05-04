import 'package:ecommerce_application/me/me.dart';
import 'package:ecommerce_application/produk/produk.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> images = [
  'https://picsum.photos/seed/picsum/200/300',
  'https://picsum.photos/200/300?grayscale',
  'https://picsum.photos/id/237/200/300',
  'https://picsum.photos/id/870/200/300',
  'https://picsum.photos/200/300/?blur',
];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        // backgroundColor: Color.fromARGB(255, 20, 140, 145),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 20 / 11,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  viewportFraction: 0.9,
                ),
                items: images.map((image) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Image.network(image, fit: BoxFit.fill),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Kategori',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      // fungsi ketika kategori belanja di klik
                    },
                    child: Column(
                      children: [
                        Icon(Icons.shopping_bag, size: 30),
                        SizedBox(height: 8),
                        Text('Belanja'),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // fungsi ketika kategori makanan di klik
                    },
                    child: Column(
                      children: [
                        Icon(Icons.food_bank, size: 30),
                        SizedBox(height: 8),
                        Text('Makanan'),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // fungsi ketika kategori transportasi di klik
                    },
                    child: Column(
                      children: [
                        Icon(Icons.car_rental, size: 30),
                        SizedBox(height: 8),
                        Text('Transportasi'),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // fungsi ketika kategori rumah di klik
                    },
                    child: Column(
                      children: [
                        Icon(Icons.home, size: 30),
                        SizedBox(height: 8),
                        Text('Rumah'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Indeks halaman aktif
        onTap: (index) {
          // Menggunakan onTap untuk menavigasi ke halaman sesuai indeks
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
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => AccountPage(
                        email: '',
                        name: '',
                      )),
            );
          } else if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => AccountPage(
                        email: '',
                        name: '',
                      )),
            );
          } else if (index == 4) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => AccountPage(
                        email: '',
                        name: '',
                      )),
            );
          } else if (index == 5) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => AccountPage(
                        email: '',
                        name: '',
                      )),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color.fromARGB(255, 20, 140, 145),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_grocery_store_sharp),
            label: 'Shop',
            backgroundColor: Color.fromARGB(255, 20, 140, 145),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: 'plus',
            backgroundColor: Color.fromARGB(255, 20, 140, 145),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_agenda),
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
