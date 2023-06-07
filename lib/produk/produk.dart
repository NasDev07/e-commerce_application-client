import 'package:ecommerce_application/auth/artikel/artikel.dart';
import 'package:ecommerce_application/home.dart';
import 'package:ecommerce_application/me/me.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Product {
  final String name;
  final String price;
  final String image;
  final String description;

  Product({
    required this.name,
    required this.price,
    required this.image,
    required this.description,
  });
}

class ShopPage extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: "GOLDEN ORGANIC",
      price: "Rp. 100,000",
      image: "produk1.jpg",
      description: "Deskripsi produk Golden Organic",
    ),
    Product(
      name: "OPTIFEED",
      price: "Rp. 150,000",
      image: "produk2.jpg",
      description: "Deskripsi produk Optifeed",
    ),
    Product(
      name: "YGO",
      price: "Rp. 200,000",
      image: "produk3.jpg",
      description: "Deskripsi produk YGO",
    ),
    Product(
      name: "Product 4",
      price: "Rp. 250,000",
      image: "apli.jpg",
      description: "Deskripsi produk 4",
    ),
  ];

  List<Product> cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text('Shop'),
          ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(product: product),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Image.asset(
                          'assets/${product.image}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 20, 140, 145),
                            ),
                          ),
                          Text(
                            product.price,
                            style: TextStyle(
                              color: Color.fromARGB(255, 94, 89, 75),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
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
            icon: Icon(Icons.store),
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

class ProductDetailPage extends StatelessWidget {
  final Product product;

  ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Produk'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              child: Image.asset(
                'assets/${product.image}',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              child: Icon(Icons.local_grocery_store_sharp),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  product.price,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Keterangan Produk:',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  product.description,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                addToCart(product, context);
              },
              child: Text('Beli'),
            ),
          ),
        ],
      ),
    );
  }

  void addToCart(Product product, BuildContext context) {
    String message =
        'Halo, saya ingin membeli produk ${product.name} dengan harga ${product.price}.';
    String phoneNumber =
        '082267429797'; // Ganti dengan nomor WhatsApp tujuan Anda
    String url =
        'https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}';

    launch(url);
  }
}
