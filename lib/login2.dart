import 'package:flutter/material.dart';

class LoginPage2 extends StatelessWidget {
  const LoginPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. Warna Background Gelap (Sesuai Home Page)
      backgroundColor: const Color(0xFF0F1014), 
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 2. Logo & Judul menggunakan Warna Orange/Gold
              const Icon(Icons.sports_esports, size: 80, color: Color(0xFFFFA500)), // Orange Accent
              const SizedBox(height: 20),
              const Text(
                "SCORE-GG",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFA500), // Warna Orange Gold
                  letterSpacing: 2,
                ),
              ),
              const Text(
                "Level up your game tracking",
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              const SizedBox(height: 50),

              // 3. Input Username (Warna Fill disamakan dengan Card di Home)
              TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFF1E1E26), // Abu-abu gelap kebiruan (Sesuai Card Profil)
                  hintText: "Email or Username",
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.person_outline, color: Color(0xFFFFA500)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // 4. Input Password
              TextField(
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFF1E1E26),
                  hintText: "Password",
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFFFFA500)),
                  suffixIcon: const Icon(Icons.visibility_off, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              // Link Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forgot Password?", 
                    style: TextStyle(color: Color(0xFFFFA500))
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // 5. Tombol LOGIN Warna Orange Dominan
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFA500), // Orange (Sesuai button profil)
                    shape: RoundedRectangleBorder(borderRadius: 
                     BorderRadius.circular(12)
                     ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        color: Colors.black,                        
                      ),
                      SizedBox(width: 10,),
                      Text(
                        "LOGIN",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
                       
              // Footer Register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("New player?", style: TextStyle(color: Colors.white)),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Create Account", 
                      style: TextStyle(
                        color: Color(0xFFFFA500), 
                        fontWeight: FontWeight.bold
                      )
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}