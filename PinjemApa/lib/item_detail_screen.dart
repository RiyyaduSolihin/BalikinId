import 'package:flutter/material.dart';

class ItemDetailScreen extends StatelessWidget {
  const ItemDetailScreen({super.key});

  final Color primaryTeal = const Color(0xFF0B7B69);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9F8),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- APP BAR ---
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Pinjem Apa',
                    style: TextStyle(
                      color: primaryTeal,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Icon(Icons.edit_outlined, color: Colors.grey[700]),
                  const SizedBox(width: 16),
                  Icon(Icons.delete_outline, color: Colors.red[400]),
                ],
              ),
              const SizedBox(height: 24),

              // --- HERO IMAGE CARD ---
              Container(
                height: 220,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    // Menggunakan gambar kamera dari Unsplash sebagai contoh
                    image: NetworkImage('https://images.unsplash.com/photo-1516035069371-29a1b244cc32?auto=format&fit=crop&w=600&q=80'),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 5)),
                  ],
                ),
                child: Container(
                  // Gradient hitam transparan agar teks putih di atasnya terbaca
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                    ),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFEBEE),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          'Lent Out',
                          style: TextStyle(color: Color(0xFFD32F2F), fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Fujifilm X-T4\nCamera',
                        style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold, height: 1.2),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // --- BORROWER CARD ---
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))],
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage('https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=150&q=80'),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('BORROWER', style: TextStyle(color: Colors.grey[500], fontSize: 10, fontWeight: FontWeight.bold)),
                        const Text('Alex Rivera', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.blue.withOpacity(0.1), shape: BoxShape.circle),
                      child: const Icon(Icons.chat_bubble_outline, color: Colors.blue, size: 20),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // --- TRACKING HISTORY ---
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Tracking History', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 20),
                    _buildTimelineStep(
                      color: primaryTeal,
                      title: 'Lent on Oct 12',
                      subtitle: 'Items handed over at Community Hub',
                    ),
                    _buildTimelineStep(
                      color: Colors.orangeAccent,
                      title: 'Reminder sent Oct 18',
                      subtitle: 'Automated push notification delivered',
                    ),
                    _buildTimelineStep(
                      color: const Color(0xFFD32F2F),
                      title: 'Due Oct 20',
                      subtitle: 'Expected return by 5:00 PM',
                      titleColor: const Color(0xFFD32F2F),
                      isLast: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // --- INFO CARDS ---
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE0F2F1), // Light teal
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('DURATION', style: TextStyle(color: primaryTeal.withOpacity(0.7), fontSize: 10, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          Text('8 Days', style: TextStyle(color: primaryTeal, fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF3E0), // Light orange/brown
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('CONDITION', style: TextStyle(color: Colors.orange[800]!.withOpacity(0.7), fontSize: 10, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          Text('Pristine', style: TextStyle(color: Colors.orange[800], fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // --- MARK AS RETURNED BUTTON ---
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.check_circle_outline, color: Colors.white),
                  label: const Text('Mark as Returned', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryTeal,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 5,
                    shadowColor: primaryTeal.withOpacity(0.5),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),

      // --- BOTTOM NAVIGATION BAR ---
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20, offset: const Offset(0, -5))],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home, 'Home', true, onTap: () {
              // Jika ditekan, hapus semua tumpukan halaman dan kembali ke Home paling awal
              Navigator.popUntil(context, (route) => route.isFirst);
            }),
            _buildNavItem(Icons.add_circle_outline, 'Add', false, onTap: () {
              // Optional: Pindah ke AddItemScreen jika dibutuhkan
            }),
            _buildNavItem(Icons.person_outline, 'Profile', false, onTap: () {}),
          ],
        ),
      ),
    );
  }

  // --- WIDGET UNTUK TIMELINE HISTORY ---
  Widget _buildTimelineStep({
    required Color color,
    required String title,
    required String subtitle,
    bool isLast = false,
    Color? titleColor,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 4),
              width: 12,
              height: 12,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
            if (!isLast) Container(width: 2, height: 35, color: Colors.grey[300]),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: titleColor ?? Colors.black87)),
              const SizedBox(height: 4),
              Text(subtitle, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
              if (!isLast) const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }

  // --- WIDGET NAVIGASI BAWAH ---
  Widget _buildNavItem(IconData icon, String label, bool isActive, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: isActive ? const EdgeInsets.symmetric(horizontal: 20, vertical: 8) : const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: isActive ? BoxDecoration(color: primaryTeal, borderRadius: BorderRadius.circular(20)) : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: isActive ? Colors.white : Colors.grey, size: isActive ? 20 : 24),
            if (isActive) const SizedBox(height: 2),
            Text(label, style: TextStyle(color: isActive ? Colors.white : Colors.grey, fontSize: isActive ? 12 : 11, fontWeight: isActive ? FontWeight.bold : FontWeight.normal)),
          ],
        ),
      ),
    );
  }
}