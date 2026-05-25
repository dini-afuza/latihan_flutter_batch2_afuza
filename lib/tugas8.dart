import 'package:flutter/material.dart';

class ScoreGGApp extends StatelessWidget {
  const ScoreGGApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SCORE-GG Navigasi Tab',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F1014),
        primaryColor: Colors.deepOrangeAccent,
        colorScheme: const ColorScheme.dark(primary: Colors.deepOrangeAccent),
      ),
      home: const MainPageNavigator(),
    );
  }
}

// =============================================================================
// MAIN NAVIGATOR (MENGATUR BOTTOM NAVIGATION BAR & LOGIKA DRAWER)
// =============================================================================
class MainPageNavigator extends StatefulWidget {
  const MainPageNavigator({super.key});

  @override
  State<MainPageNavigator> createState() => _MainPageNavigatorState();
}

class _MainPageNavigatorState extends State<MainPageNavigator> {
  int _currentIndex = 0;
  bool _isDarkMode = true;

  // Global Key untuk kebutuhan fungsi scroll di HomeTab
  final GlobalKey _keySyarat = GlobalKey();
  final GlobalKey _keyMode = GlobalKey();
  final GlobalKey _keyKategori = GlobalKey();
  final GlobalKey _keyTanggal = GlobalKey();
  final GlobalKey _keyPengingat = GlobalKey();
  final ScrollController _scrollController = ScrollController();

  // Fungsi callback untuk mengubah mode gelap/terang dari dalam HomeTab
  void _toggleTheme(bool value) {
    setState(() {
      _isDarkMode = value;
    });
  }

  // Fungsi helper untuk scroll komponen dari Drawer
  void _scrollToComponent(GlobalKey key) {
    Navigator.pop(context); // Tutup Drawer
    final contextKey = key.currentContext;
    if (contextKey != null) {
      Scrollable.ensureVisible(
        contextKey,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // List Halaman berdasarkan Spesifikasi Tugas
    final List<Widget> pages = [
      HomeTab(
        isDarkMode: _isDarkMode,
        onThemeChanged: _toggleTheme,
        scrollController: _scrollController,
        keySyarat: _keySyarat,
        keyMode: _keyMode,
        keyKategori: _keyKategori,
        keyTanggal: _keyTanggal,
        keyPengingat: _keyPengingat,
      ),
      AboutTab(isDarkMode: _isDarkMode),
    ];

    return Scaffold(
      backgroundColor: _isDarkMode
          ? const Color(0xFF0F1014)
          : const Color(0xFFF4F6F9),

      // 1. APP BAR: Judul berubah dinamis sesuai tab aktif
      appBar: AppBar(
        backgroundColor: _isDarkMode ? const Color(0xFF1E1E26) : Colors.white,
        elevation: 1,
        iconTheme: IconThemeData(
          color: _isDarkMode ? Colors.white : Colors.black87,
        ),
        title: Text(
          _currentIndex == 0 ? "SCORE-GG: Halaman Utama" : "Tentang Aplikasi",
          style: TextStyle(
            color: _isDarkMode ? Colors.white : Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      // 2. LOGIKA DRAWER: Hanya muncul jika berada di Tab 1 (Index 0)
      drawer: _currentIndex == 0
          ? Drawer(
              backgroundColor: const Color(0xFF14161D),
              child: Column(
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Color(0xFF1E1E26),
                      border: Border(
                        bottom: BorderSide(color: Colors.white, width: 1),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.sports_esports,
                          color: Colors.deepOrangeAccent,
                          size: 40,
                        ),
                        SizedBox(width: 12),
                        Text(
                          "SCORE-GG\nPanel Menu",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.gavel,
                      color: Colors.deepOrangeAccent,
                    ),
                    title: const Text(
                      "Syarat & Ketentuan",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () => _scrollToComponent(_keySyarat),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.palette,
                      color: Colors.deepOrangeAccent,
                    ),
                    title: const Text(
                      "Mode Tampilan",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () => _scrollToComponent(_keyMode),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.category,
                      color: Colors.deepOrangeAccent,
                    ),
                    title: const Text(
                      "Kategori Produk Game",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () => _scrollToComponent(_keyKategori),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.calendar_today,
                      color: Colors.deepOrangeAccent,
                    ),
                    title: const Text(
                      "Pilih Tanggal Lahir",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () => _scrollToComponent(_keyTanggal),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.access_time,
                      color: Colors.deepOrangeAccent,
                    ),
                    title: const Text(
                      "Atur Pengingat Scrim",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () => _scrollToComponent(_keyPengingat),
                  ),
                ],
              ),
            )
          : null, // Mengembalikan null (Drawer tersembunyi) di Tab 2
      // 3. BODY SWITCHING
      body: pages[_currentIndex],

      // 4. BOTTOM NAVIGATION BAR
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: _isDarkMode ? const Color(0xFF1E1E26) : Colors.white,
        selectedItemColor: Colors.deepOrangeAccent,
        unselectedItemColor: _isDarkMode ? Colors.white60 : Colors.black45,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Tentang'),
        ],
      ),
    );
  }
}

// =============================================================================
// TAB 1: HOME TAB (FORM INTERAKTIF DARI TUGAS 7)
// =============================================================================
class HomeTab extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;
  final ScrollController scrollController;
  final GlobalKey keySyarat;
  final GlobalKey keyMode;
  final GlobalKey keyKategori;
  final GlobalKey keyTanggal;
  final GlobalKey keyPengingat;

  const HomeTab({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
    required this.scrollController,
    required this.keySyarat,
    required this.keyMode,
    required this.keyKategori,
    required this.keyTanggal,
    required this.keyPengingat,
  });

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  bool _isApproved = false;
  final List<String> _categories = ['MOBA', 'FPS', 'RPG', 'Sports', 'Lainnya'];
  String _selectedCategory = 'MOBA';
  String _selectedDateText = "Belum Memilih Tanggal";
  String _selectedTimeText = "Belum Mengatur Pengingat";

  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Colors.deepOrangeAccent,
              onPrimary: Colors.black,
              surface: Color(0xFF1E1E26),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _selectedDateText =
            "${picked.day.toString().padLeft(2, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.year}";
      });
    }
  }

  Future<void> _pickTime() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Colors.deepOrangeAccent,
              surface: Color(0xFF1E1E26),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _selectedTimeText =
            "${picked.hour.toString().padLeft(2, '0')}:${picked.minute.toString().padLeft(2, '0')}";
      });
    }
  }

  BoxDecoration boxStyle() {
    return BoxDecoration(
      color: widget.isDarkMode ? const Color(0xFF1E1E26) : Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 4),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: widget.scrollController,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            key: widget.keySyarat,
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: boxStyle(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "1. Syarat & Ketentuan Turnamen",
                  style: TextStyle(
                    color: widget.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                CheckboxListTile(
                  title: const Text(
                    "Saya menyetujui persyaratan turnamen SCORE-GG",
                  ),
                  value: _isApproved,
                  activeColor: Colors.green,
                  checkColor: Colors.white,
                  contentPadding: EdgeInsets.zero,
                  onChanged: (bool? value) {
                    setState(() {
                      _isApproved = value ?? false;
                    });
                  },
                ),
                Text(
                  _isApproved
                      ? "✅ Pendaftaran diperbolehkan"
                      : "❌ Pendaftaran belum tersedia",
                  style: TextStyle(
                    color: _isApproved ? Colors.greenAccent : Colors.redAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            key: widget.keyMode,
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: boxStyle(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "2. Mode Tampilan Hub",
                  style: TextStyle(
                    color: widget.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                SwitchListTile(
                  title: const Text("Aktifkan Mode Gelap"),
                  value: widget.isDarkMode,
                  activeTrackColor: Colors.deepOrangeAccent,
                  contentPadding: EdgeInsets.zero,
                  onChanged: widget.onThemeChanged,
                ),
              ],
            ),
          ),
          Container(
            key: widget.keyKategori,
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: boxStyle(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "3. Kategori Utama Game",
                  style: TextStyle(
                    color: widget.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  initialValue: _selectedCategory,
                  dropdownColor: widget.isDarkMode
                      ? const Color(0xFF1E1E26)
                      : Colors.white,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: widget.isDarkMode
                            ? Colors.grey
                            : Colors.grey.shade400,
                      ),
                    ),
                  ),
                  items: _categories.map((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(
                        category,
                        style: TextStyle(
                          color: widget.isDarkMode
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedCategory = newValue!;
                    });
                  },
                ),
                const SizedBox(height: 10),
                Text(
                  "Anda memilih kategori: $_selectedCategory",
                  style: TextStyle(
                    color: widget.isDarkMode ? Colors.white70 : Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            key: widget.keyTanggal,
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: boxStyle(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "4. Konfirmasi Tanggal Lahir",
                  style: TextStyle(
                    color: widget.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.isDarkMode
                        ? Colors.deepOrangeAccent
                        : const Color(0xFF1A73E8),
                    foregroundColor: widget.isDarkMode
                        ? Colors.black
                        : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: _pickDate,
                  icon: const Icon(Icons.date_range),
                  label: const Text(
                    "Buka Kalender",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Tanggal Lahir: $_selectedDateText",
                  style: TextStyle(
                    color: widget.isDarkMode ? Colors.white70 : Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          Container(
            key: widget.keyPengingat,
            margin: const EdgeInsets.only(bottom: 24),
            padding: const EdgeInsets.all(16),
            decoration: boxStyle(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "5. Atur Jadwal Pengingat Scrim",
                  style: TextStyle(
                    color: widget.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.isDarkMode
                        ? Colors.deepOrangeAccent
                        : const Color(0xFF1A73E8),
                    foregroundColor: widget.isDarkMode
                        ? Colors.black
                        : Colors.white,
                    elevation: widget.isDarkMode ? 0 : 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: _pickTime,
                  icon: const Icon(Icons.alarm),
                  label: const Text(
                    "Atur Jam",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Pengingat diatur pukul: $_selectedTimeText",
                  style: TextStyle(
                    color: widget.isDarkMode ? Colors.white70 : Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 24),
            padding: const EdgeInsets.all(16),
            decoration: boxStyle(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.analytics,
                      color: widget.isDarkMode
                          ? Colors.deepOrangeAccent
                          : const Color(0xFF1A73E8),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "📊 LIVE RESULT AREA (RINGKASAN STATUS)",
                      style: TextStyle(
                        color: widget.isDarkMode
                            ? Colors.white
                            : const Color.fromARGB(255, 13, 13, 14),
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: widget.isDarkMode
                      ? Colors.white
                      : const Color.fromARGB(255, 2, 2, 2),
                  thickness: 1,
                  height: 20,
                ),
                _buildResultRow(
                  "Status Validasi",
                  _isApproved
                      ? "Pendaftaran Diperbolehkan"
                      : "Pendaftaran Belum Tersedia",
                ),
                _buildResultRow(
                  "Mode Tampilan Active",
                  widget.isDarkMode ? "Dark Theme Mode" : "Light Theme Mode",
                ),
                _buildResultRow("Kategori Pilihan", _selectedCategory),
                _buildResultRow("Data Tanggal Lahir", _selectedDateText),
                _buildResultRow("Waktu Pengingat", _selectedTimeText),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            color: widget.isDarkMode ? Colors.white70 : Colors.black87,
            fontSize: 13,
          ),
          children: [
            TextSpan(
              text: "$label: ",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: value,
              style: TextStyle(
                color: widget.isDarkMode
                    ? Colors.cyanAccent
                    : const Color(0xFF1A73E8),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =============================================================================
// TAB 2: ABOUT TAB (HALAMAN INFORMASI STATIS)
// =============================================================================
class AboutTab extends StatelessWidget {
  final bool isDarkMode;
  const AboutTab({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    final textColor = isDarkMode ? Colors.white : Colors.black87;
    final subColor = isDarkMode ? Colors.white70 : Colors.black54;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: isDarkMode ? const Color(0xFF1E1E26) : Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.sports_esports,
                size: 80,
                color: Colors.deepOrangeAccent,
              ),
              const SizedBox(height: 16),
              Text(
                "SCORE-GG Hub",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Aplikasi manajemen interaktif untuk kebutuhan turnamen, manajemen tim esports, pendaftaran scrim, serta pengingat jadwal kompetisi secara real-time.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: subColor, height: 1.4),
              ),
              const Divider(height: 32, thickness: 1),
              _buildInfoRow(
                "Nama Pembuat",
                "SCORE-GG Developer Team",
                isDarkMode,
              ),
              _buildInfoRow("Versi Aplikasi", "v2.0.0 (Tugas 8)", isDarkMode),
              _buildInfoRow("Teknologi", "Flutter & Material 3", isDarkMode),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, bool dark) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: dark ? Colors.white60 : Colors.black54,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.deepOrangeAccent,
            ),
          ),
        ],
      ),
    );
  }
}
