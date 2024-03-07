import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:case1_kamus_talawi/screen/page_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kamus Talawi - Indonesia',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade300),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade300,
      body: CarouselSlider(
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height,
          aspectRatio: 16 / 9,
          viewportFraction: 1.0,
          initialPage: 0,
          enableInfiniteScroll: false,
          autoPlay: false,
        ),
        items: [
          SelamatDatangPage(),
          SelamatMenikmatiPage(),
        ],
      ),
    );
  }
}

class SelamatDatangPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade300,
      child: Stack(
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Image.asset('gambar/logo_sawahlunto.png', width: 150, height: 150,),
                )
              ],
            ),
          ),

          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Selamat Datang di ',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Kamus Daerah   ',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Talawi - Indonesia ',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset('gambar/reading.png', width: 300, height: 300,
            ),
          ),
        ],
      ),
    );
  }
}


class SelamatMenikmatiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade300,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('gambar/kamus.png', height: 250, width: 250,),
            SizedBox(height: 30),
            Text(
              'Selamat Menikmati',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 30),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageListKosaKata()),
                );
              },
              color: Colors.white,
              textColor: Colors.black,
              child: Text('Mulai'),
            ),
          ],
        ),
      ),
    );
  }
}


