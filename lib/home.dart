import 'package:ecommerce_application/auth/artikel/artikel.dart';
import 'package:ecommerce_application/me/me.dart';
import 'package:ecommerce_application/produk/produk.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> images = [
  'https://tabloidsinartani.com/uploads/news/images/770x413/-_191208060951-320.jpg',
  'https://insidelombok.id/wp-content/uploads/2022/05/images-2.jpeg',
  'https://4.bp.blogspot.com/-EgRIpk6ulek/UOk0yGn6ZqI/AAAAAAAACmg/qjegveYz27A/s1600/DSC_6353_%E5%89%AF%E6%9C%AC.jpg',
  'https://assets.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/jawapos/2019/01/petani-jagung-siap-panen-raya-darmin-diminta-pulang-kampung_m_.jpg',
  'https://s0.smartresize.com/wallpaper/923/387/HD-wallpaper-sawah-fields-hill-padi.jpg',
  'https://images.bisnis.com/posts/2017/06/14/662883/pandang-1.jpg',
  'https://www.kalamanthana.id/wp-content/uploads/2016/03/tambak-ikan.gif'
];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text('Home'),
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
                        Icon(Icons.topic, size: 30),
                        SizedBox(height: 8),
                        Text('Organik'),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // fungsi ketika kategori makanan di klik
                    },
                    child: Column(
                      children: [
                        Icon(Icons.view_agenda, size: 30),
                        SizedBox(height: 8),
                        Text('Kimia'),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // fungsi ketika kategori transportasi di klik
                    },
                    child: Column(
                      children: [
                        Icon(Icons.invert_colors, size: 30),
                        SizedBox(height: 8),
                        Text('YGO'),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // fungsi ketika kategori rumah di klik
                    },
                    child: Column(
                      children: [
                        Icon(Icons.library_books, size: 30),
                        SizedBox(height: 8),
                        Text('OPTIFEED'),
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
        currentIndex: 0,
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
            icon: Icon(Icons.store_sharp),
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
