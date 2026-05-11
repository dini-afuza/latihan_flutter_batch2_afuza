import 'package:flutter/material.dart';

class MerchantProfilePage extends StatelessWidget {
  const MerchantProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Merchant"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            const Center(
              child: Text(
                "Score-GG",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.email, color: Colors.blueAccent),
                    SizedBox(width: 15), // Jarak wajib antar Icon & Text
                    Text("afuzadini@gmail.com"),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.email, color: Colors.blueAccent),
                    SizedBox(width: 15), // Jarak wajib antar Icon & Text
                    Text("afuzadini@gmail.com"),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: const [
                  Icon(Icons.phone, size: 20),
                  Text(" 0812-9176-7504"),
                  Spacer(), // Mendorong elemen berikutnya ke rata kanan
                  Text("Jakarta Selatan"),
                  Icon(Icons.location_on, size: 20),
                ],
              ),
            ),

            const SizedBox(height: 25),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  // Box 1
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      color: Colors.blue[50],
                      child: Column(
                        children: const [
                          Text("Terjual", style: TextStyle(color: Colors.grey)),
                          Text("1.2k+", style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),

                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      color: Colors.blue[50],
                      child: Column(
                        children: const [
                          Text("Rating", style: TextStyle(color: Colors.grey)),
                          Text("4.9/5.0",style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20), // Jarak vertikal
            const Padding(
              padding: EdgeInsets.all(20), // Inner spacing agar teks tidak menyentuh tepi
              child: Text(
                "Aplikasi Score-GG yang menyediakan informasi live score esports secara real-time dalam satu platform yang praktis dan mudah digunakan",
                textAlign: TextAlign.justify,
                style: TextStyle(height: 1.5),
              ),
            ),

                Container(
              margin: const EdgeInsets.all(20),
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: AssetImage("assets/images/Gemini_Generated_Image_buf2atbuf2atbuf2.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}