import 'package:flutter/material.dart';
import 'package:pertemuan5/app_bar_icon.dart';
import 'package:pertemuan5/app_color.dart';
import 'package:pertemuan5/detailpage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pertemuan5/product_card.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, dynamic>> products = [
      {
        'nama': 'Mie Ayam',
        'harga': 'Rp.15.000',
        'deskripsi': 'Mie ayam the best',
        'rating': '5.0',
        'img': 'https://th.bing.com/th/id/OIP.O7QsZ5ax3crO8n2PbygMHgHaHa?w=195&h=195&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3',
        'bahan': [
          {'nama': 'Mie', 'takaran': '1 piring'},
          {'nama': 'ayam', 'takaran': '2 ekor'},
          {'nama': 'kerupuk', 'takaran': '1 butir'},
          {'nama': 'Kecap', 'takaran': '3 sendok makan'},
        ],
      },
      {
        'nama': 'Mie Goreng',
        'harga': 'Rp.10.000',
        'deskripsi': 'Masakan mie indonesia paling enak.',
        'rating': '4.5',
        'img': 'https://th.bing.com/th/id/OIP.ONJI0I5HjZ3iRv90PKSLJgHaE8?w=267&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3',
        'bahan': [
          {'nama': 'Mie', 'takaran': '1 bungkus'},
          {'nama': 'Sosis', 'takaran': '2 pcs'},
          {'nama': 'Telor', 'takaran': '1 butir'},
          {'nama': 'Kecap', 'takaran': '2 sendok makan'},
        ],
      },
      {
        'nama': 'Mie Kwetiau',
        'harga': 'Rp.13.000',
        'deskripsi': 'Masakan mie kwetiau paling enak asal indonesia',
        'rating': '5.0',
        'img': 'https://tse1.mm.bing.net/th/id/OIP.uFpxAWz0HZ_7QsrKA_FXLQHaFJ?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
        'bahan': [
          {'nama': 'Mie', 'takaran': '1 bungkus'},
          {'nama': 'Sosis', 'takaran': '2 pcs'},
          {'nama': 'Telor', 'takaran': '1 butir'},
          {'nama': 'Kecap', 'takaran': '2 sendok makan'},
        ],
      },
      {
        'nama': 'Nasi Goreng Kampung',
        'harga': 'Rp.15.000',
        'deskripsi': 'Masakan Nasi goreng paling enak.',
        'rating': '5.0',
        'img': 'https://www.caramelandspice.com/wp-content/uploads/2022/05/072-Nasi-Goreng-Kampung-Indonesian-Fried-Rice-1-of-1.jpg',
        'bahan': [
          {'nama': 'Nasi', 'takaran': '2 potong'},
          {'nama': 'Tomat', 'takaran': '3 potong'},
          {'nama': 'Lalapan', 'takaran': '3 daun'},
        ],
      },
    ];

    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColor.primaryYellow,

        title: Container(
          height:40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25)
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      color: AppColor.font3
                    ),
                    border: .none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 13)
                  ),
                ),
              ),

              Container(
                width: 32, 
                height: 32,
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColor.primaryOrange,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  'assets/icons/filter.svg',
                  // Gunakan colorFilter untuk memaksa warna SVG menjadi putih, menggantikan properti 'color'
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              )
            ],
          ),
        ),

        

        actions: [
          AppBarIcon(
            imagePath: 'assets/icons/keranjang.svg',
            onTap:() {
              
            } ,
          ),
          AppBarIcon(
            imagePath: 'assets/icons/notifikasi.svg',
            onTap:() {
              
            } ,
          ),
          AppBarIcon(
            imagePath: 'assets/icons/profil.svg',
            onTap:() {
              
            } ,
          )
        ],
      ),

      body: Container(
        // Background melengkung di pojok kiri atas sesuai desain
        decoration: const BoxDecoration(
          color: Color(0xFFF8F9FA), // Warna abu-abu sangat muda/putih tulang
          borderRadius: BorderRadius.only(topLeft: Radius.circular(40)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // Teks Judul
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Discover our most popular dishes!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryOrange
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            // GridView untuk kartu makanan
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, 
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 5,
                  mainAxisExtent: 320
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  
                  return ProductCard(
                    nama: product['nama'],
                    harga: product['harga'],
                    deskripsi: product['deskripsi'],
                    rating: product['rating'],
                    img: product['img'],

                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            nama: product['nama'],
                            harga: product['harga'],
                            deskripsi: product['deskripsi'], 
                            img: product['img'],
                            bahan: product['bahan']
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}