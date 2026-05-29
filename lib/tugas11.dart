import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SCORE-GG Esports',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF050B18),
      ),
      home: const SplashScreen(),
    );
  }
}

// =============================================================================
// 1. PREFERENCE HANDLER CLASS
// =============================================================================
class PreferenceHandler {
  static SharedPreferences? _preferences;
  static const String _loginKey = 'is_logged_in';

  // Method untuk inisialisasi awal SharedPreferences
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Method untuk mengubah status login
  static Future<void> setLogin(bool value) async {
    await _preferences?.setBool(_loginKey, value);
  }

  // Getter untuk mengambil status login dengan nilai default false
  static bool get isLogin {
    return _preferences?.getBool(_loginKey) ?? false;
  }

  // Method pembantu untuk menghapus atau reset sesi
  static Future<void> clearSession() async {
    await _preferences?.setBool(_loginKey, false);
  }
}

// =============================================================================
// 2. SPLASH SCREEN PAGE
// =============================================================================
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkSessionAndNavigate();
  }

  void _checkSessionAndNavigate() async {
    // Menampilkan Splash Screen selama durasi yang ditentukan (misal 4 detik sesuai spesifikasi fitur baru)
    await Future.delayed(const Duration(seconds: 4));

    if (!mounted) return;

    // Alur Logika Pengecekan Sesi
    bool isLoggedIn = PreferenceHandler.isLogin;

    if (isLoggedIn) {
      // Kondisi Aktif (True): Langsung arahkan ke HomeScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      // Kondisi Kosong (False): Arahkan ke LoginScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF0F1014),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.sports_esports,
              size: 100,
              color: Colors.deepOrangeAccent,
            ),
            SizedBox(height: 20),
            Text(
              "SCORE-GG",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrangeAccent,
                letterSpacing: 3,
              ),
            ),
            Text(
              "Level up your game tracking",
              style: TextStyle(color: Colors.white60, fontSize: 14),
            ),
            SizedBox(height: 50),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.deepOrangeAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =============================================================================
// 3. LOGIN PAGE
// =============================================================================
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = "";

  void _handleLogin() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      setState(() {
        _errorMessage = "❌ Email dan Password tidak boleh kosong!";
      });
      return;
    }

    // Simulasi login sukses tanpa hardcode akun rumit untuk kemudahan testing sesi
    // Mengubah status sesi menjadi true di SharedPreferences
    await PreferenceHandler.setLogin(true);

    if (!mounted) return;

    // Navigasi langsung ke Home menggunakan pushReplacement
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1014),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.sports_esports,
                size: 80,
                color: Colors.deepOrangeAccent,
              ),
              const SizedBox(height: 15),
              const Text(
                "SCORE-GG",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrangeAccent,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 35),

              if (_errorMessage.isNotEmpty) ...[
                Text(
                  _errorMessage,
                  style: const TextStyle(color: Colors.redAccent),
                ),
                const SizedBox(height: 15),
              ],

              TextField(
                controller: _emailController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFF1E1E26),
                  hintText: "Email or Username",
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 15),

              TextField(
                controller: _passwordController,
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFF1E1E26),
                  hintText: "Password",
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: _handleLogin,
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// =============================================================================
// 4. HOME PAGE (MAIN MENU)
// =============================================================================
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF050B18),
        elevation: 0,
        title: const Text(
          "SCORE-GG HOME",
          style: TextStyle(
            color: Colors.deepOrangeAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          // Tombol Logout di AppBar sesuai spesifikasi instruksi teknis
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.redAccent),
            onPressed: () async {
              // 1. Jalankan method ubah sesi menjadi false
              await PreferenceHandler.clearSession();

              if (!context.mounted) return;

              // 2. Kembalikan ke halaman Login menggunakan pushReplacement
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );

              // 3. Tambahkan SnackBar feedback visual "Berhasil Logout" di halaman Login
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("👋 Berhasil Logout dari sesi Anda."),
                  backgroundColor: Colors.blueGrey,
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // PROFILE CARD PRESET
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF1E293B), Color(0xFFFF6B00)],
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.account_circle, size: 60, color: Colors.white),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pro Player Sesi",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Sesi Aktif (SharedPreferences)",
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Esports Menu",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 15),

              // GRID MENU PLACEHOLDER
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                children: [
                  _buildMenuCard(Icons.live_tv, "Live Stream"),
                  _buildMenuCard(Icons.calendar_month, "Jadwal Turnamen"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuCard(IconData icon, String title) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.orange, size: 40),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
