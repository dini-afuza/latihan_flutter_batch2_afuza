import 'package:flutter/material.dart';

class ScoreGGApp extends StatelessWidget {
  const ScoreGGApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SCORE-GG Input Interaktif',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F1014),
        primaryColor: Colors.deepOrangeAccent,
        colorScheme: const ColorScheme.dark(primary: Colors.deepOrangeAccent),
      ),
      home: const MainInputPage(),
    );
  }
}

class MainInputPage extends StatefulWidget {
  const MainInputPage({super.key});

  @override
  State<MainInputPage> createState() => _MainInputPageState();
}

class _MainInputPageState extends State<MainInputPage> {
  // Global Key & Scroll Controller untuk Navigasi Drawer ke Body
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _keySyarat = GlobalKey();
  final GlobalKey _keyMode = GlobalKey();
  final GlobalKey _keyKategori = GlobalKey();
  final GlobalKey _keyTanggal = GlobalKey();
  final GlobalKey _keyPengingat = GlobalKey();

  // 1. State untuk Syarat & Ketentuan (Checkbox)
  bool _isApproved = false;

  // 2. State untuk Mode Tampilan (Switch)
  bool _isDarkMode = true;

  // 3. State untuk Kategori Game (DropdownButton)
  final List<String> _categories = ['MOBA', 'FPS', 'RPG', 'Sports', 'Lainnya'];
  String _selectedCategory = 'MOBA';

  // 4. State untuk Pilih Tanggal (showDatePicker)
  String _selectedDateText = "Belum Memilih Tanggal";

  // 5. State untuk Atur Pengingat (showTimePicker)
  String _selectedTimeText = "Belum Mengatur Pengingat";

  // Fungsi Helper untuk Scroll ke Widget Spesifik saat ListTile diklik
  void _scrollToComponent(GlobalKey key) {
    Navigator.pop(context); // Tutup Drawer terlebih dahulu
    final contextKey = key.currentContext;
    if (contextKey != null) {
      Scrollable.ensureVisible(
        contextKey,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  // Fungsi untuk Membuka Date Picker
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

  // Fungsi untuk Membuka Time Picker
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Sinkronisasi background Scaffold dengan Status Switch Mode Gelap
      backgroundColor: _isDarkMode
          ? const Color(0xFF0F1014)
          : const Color(0xFFF4F6F9),

      // =======================================================================
      // APP BAR
      // =======================================================================
      appBar: AppBar(
        backgroundColor: _isDarkMode ? const Color(0xFF1E1E26) : Colors.white,
        elevation: 1,
        iconTheme: IconThemeData(
          color: _isDarkMode ? Colors.white : Colors.black87,
        ),
        title: Text(
          "SCORE-GG: Input Interaktif",
          style: TextStyle(
            color: _isDarkMode ? Colors.white : Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      // =======================================================================
      // DRAWER (NAVIGASI SAMPING)
      // =======================================================================
      drawer: Drawer(
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
              leading: const Icon(Icons.gavel, color: Colors.deepOrangeAccent),
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
      ),

      // =======================================================================
      // BODY UTAMA (FORM KOMPONEN BERDERET VERTIKAL)
      // =======================================================================
      body: SingleChildScrollView(
        controller: _scrollController,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CONTAINER 1: Syarat & Ketentuan (Checkbox)
            Container(
              key: _keySyarat,
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16),
              decoration: boxStyle(),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "1. Syarat & Ketentuan Turnamen",
                    style: TextStyle(
                      color: _isDarkMode ? Colors.white : Colors.black,
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
                      color: _isApproved
                          ? Colors.greenAccent
                          : Colors.redAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // CONTAINER 2: Mode Tampilan (Switch)
            Container(
              key: _keyMode,
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16),
              decoration: boxStyle(),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "2. Mode Tampilan Hub",
                    style: TextStyle(
                      color: _isDarkMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SwitchListTile(
                    title: const Text("Aktifkan Mode Gelap"),
                    value: _isDarkMode,
                    activeTrackColor: Colors.deepOrangeAccent,
                    contentPadding: EdgeInsets.zero,
                    onChanged: (bool value) {
                      setState(() {
                        _isDarkMode = value;
                      });
                    },
                  ),
                ],
              ),
            ),

            // CONTAINER 3: Kategori Game (DropdownButton)
            Container(
              key: _keyKategori,
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16),
              decoration: boxStyle(),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "3. Kategori Utama Game",
                    style: TextStyle(
                      color: _isDarkMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    initialValue: _selectedCategory,
                    dropdownColor: _isDarkMode
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
                          color: _isDarkMode
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
                            color: _isDarkMode ? Colors.white : Colors.black,
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
                      color: _isDarkMode ? Colors.white70 : Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            // CONTAINER 4: Pilih Tanggal (showDatePicker)
            Container(
              key: _keyTanggal,
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16),
              decoration: boxStyle(),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "4. Konfirmasi Tanggal Lahir",
                    style: TextStyle(
                      color: _isDarkMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      // PERBAIKAN: Warna tombol dinamis (Cyan gelap saat gelap, Biru Elegan saat terang)
                      backgroundColor: _isDarkMode
                          ? Colors.deepOrangeAccent
                          : const Color(0xFF1A73E8),
                      foregroundColor: _isDarkMode
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
                      color: _isDarkMode ? Colors.white70 : Colors.black87,
                    ),
                  ),
                ],
              ),
            ),

            // CONTAINER 5: Atur Pengingat (showTimePicker)
            Container(
              key: _keyPengingat,
              margin: const EdgeInsets.only(bottom: 24),
              padding: const EdgeInsets.all(16),
              decoration: boxStyle(),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "5. Atur Jadwal Pengingat Scrim",
                    style: TextStyle(
                      color: _isDarkMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      // PERBAIKAN: Warna tombol dinamis agar konsisten
                      backgroundColor: _isDarkMode
                          ? Colors.deepOrangeAccent
                          : const Color(0xFF1A73E8),
                      foregroundColor: _isDarkMode
                          ? Colors.black
                          : Colors.white,
                      elevation: _isDarkMode ? 0 : 2,
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
                      color: _isDarkMode ? Colors.white70 : Colors.black87,
                    ),
                  ),
                ],
              ),
            ),

            // =================================================================
            // RESULT AREA (RINGKASAN STATUS DI BAGIAN BAWAH BODY)
            // =================================================================
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
                        color: _isDarkMode
                            ? Colors.deepOrangeAccent
                            : const Color(0xFF1A73E8),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "📊 LIVE RESULT AREA (RINGKASAN STATUS)",
                        style: TextStyle(
                          color: _isDarkMode
                              ? Colors.white
                              : const Color.fromARGB(255, 13, 13, 14),
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: _isDarkMode
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
                    _isDarkMode ? "Dark Theme Mode" : "Light Theme Mode",
                  ),
                  _buildResultRow("Kategori Pilihan", _selectedCategory),
                  _buildResultRow("Data Tanggal Lahir", _selectedDateText),
                  _buildResultRow("Waktu Pengingat", _selectedTimeText),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration boxStyle() {
    return BoxDecoration(
      color: _isDarkMode ? const Color(0xFF1E1E26) : Colors.white,
      borderRadius: BorderRadius.circular(12),
      // border: Border.all(),
      boxShadow: [
        BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 4),
      ],
    );
  }

  // Widget Helper ringkas untuk baris rangkuman hasil
  Widget _buildResultRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      // Memastikan teks beradaptasi dengan baik saat mode terang/gelap
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            color: _isDarkMode ? Colors.white70 : Colors.black87,
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
                color: _isDarkMode
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
