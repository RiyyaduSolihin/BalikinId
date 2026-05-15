import 'package:flutter/material.dart';
import 'add_item_screen.dart';
import 'item_detail_screen.dart';
import 'reminder_settings_screen.dart';
import 'profile_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final Color primaryTeal = const Color(0xFF0B7B69);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- APP BAR CUSTOM ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: primaryTeal,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.inventory_2, color: Colors.white, size: 24),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Pinjem Apa',
                        style: TextStyle(
                          color: primaryTeal,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.notifications_none, color: Colors.grey[800], size: 28),
                ],
              ),
              const SizedBox(height: 24),

              // --- DASHBOARD CARDS ---
              Row(
                children: [
                  Expanded(
                    child: _buildSummaryCard(
                      title: 'Active Lent',
                      count: '12',
                      icon: Icons.arrow_outward,
                      bgColor: primaryTeal,
                      textColor: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildSummaryCard(
                      title: 'Overdue',
                      count: '3',
                      icon: Icons.error_outline,
                      bgColor: const Color(0xFFEEEEEE),
                      textColor: const Color(0xFFD32F2F),
                      titleColor: Colors.grey[700]!,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // --- SEARCH BAR ---
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search items...',
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
                    suffixIcon: Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.filter_list, color: Colors.black54),
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // --- LENT ITEMS LIST ---
              const Text(
                'Lent Items',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),

              // Item 1: Overdue
              _buildLentItemCard(
                context, // Mengirim context untuk navigasi
                imageUrl: 'https://images.unsplash.com/photo-1504148455328-c376907d081c?auto=format&fit=crop&w=150&q=80',
                title: 'Cordless Drill',
                borrower: 'Alex',
                statusText: 'Overdue',
                isOverdue: true,
                footerWidget: Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                    const SizedBox(width: 6),
                    const Text('Oct 12 — Oct 20', style: TextStyle(color: Colors.grey, fontSize: 12)),
                    const Spacer(),
                    Text('Remind ⋗', style: TextStyle(color: primaryTeal, fontWeight: FontWeight.bold, fontSize: 13)),
                  ],
                ),
              ),

              // Item 2: In Progress (With Progress Bar)
              _buildLentItemCard(
                context,
                imageUrl: 'https://images.unsplash.com/photo-1485965120184-e220f721d03e?auto=format&fit=crop&w=150&q=80',
                title: 'Mountain Bike',
                borrower: 'Jamie',
                statusText: 'In Progress',
                isOverdue: false,
                footerWidget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('4 days left', style: TextStyle(color: Colors.grey, fontSize: 12)),
                        Text('Due Oct 30', style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: 0.6,
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(primaryTeal),
                        minHeight: 6,
                      ),
                    ),
                  ],
                ),
              ),

              // Item 3: In Progress (View Details)
              _buildLentItemCard(
                context,
                imageUrl: 'https://images.unsplash.com/photo-1585202685816-3e0f0c058778?auto=format&fit=crop&w=150&q=80',
                title: 'Coffee Grinder',
                borrower: 'Maria',
                statusText: 'In Progress',
                isOverdue: false,
                footerWidget: Row(
                  children: [
                    const Icon(Icons.history, size: 16, color: Colors.grey),
                    const SizedBox(width: 6),
                    const Text('Lent Oct 25', style: TextStyle(color: Colors.grey, fontSize: 12)),
                    const Spacer(),
                    Text('View Details', style: TextStyle(color: primaryTeal, fontWeight: FontWeight.bold, fontSize: 13)),
                  ],
                ),
              ),

              const SizedBox(height: 80), // Ruang ekstra untuk Bottom Nav & FAB
            ],
          ),
        ),
      ),

      // --- FLOATING ACTION BUTTON ---
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddItemScreen(),
            ),
          );
        },
        backgroundColor: primaryTeal,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 4,
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      // --- BOTTOM NAVIGATION BAR ---
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Menu Home
            _buildNavItem(Icons.home, 'Home', isActive: true, onTap: () {}),

            // Menu Add
            _buildNavItem(Icons.add_circle_outline, 'Add', isActive: false, onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddItemScreen(),
                ),
              );
            }),

            // Menu Profile (SEKARANG SUDAH BISA DITEKAN)
            _buildNavItem(Icons.person_outline, 'Profile', isActive: false, onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileScreen())
              );
            }),
          ],
        ),
      ),
    );
  }

  // --- WIDGET BUILDERS ---

  Widget _buildSummaryCard({
    required String title,
    required String count,
    required IconData icon,
    required Color bgColor,
    required Color textColor,
    Color? titleColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: textColor, size: 24),
          const SizedBox(height: 24),
          Text(
            title,
            style: TextStyle(color: titleColor ?? textColor.withOpacity(0.8), fontSize: 12),
          ),
          const SizedBox(height: 4),
          Text(
            count,
            style: TextStyle(color: textColor, fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // Menambahkan BuildContext agar bisa menggunakan Navigator.push di dalam fungsi ini
  Widget _buildLentItemCard(
      BuildContext context, {
        required String imageUrl,
        required String title,
        required String borrower,
        required String statusText,
        required bool isOverdue,
        required Widget footerWidget,
      }) {
    final statusColor = isOverdue ? const Color(0xFFD32F2F) : primaryTeal;
    final statusBgColor = isOverdue ? const Color(0xFFFFEBEE) : const Color(0xFFE0F2F1);

    return GestureDetector(
      onTap: () {
        // Berpindah ke ItemDetailScreen saat kartu ditekan
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ItemDetailScreen()),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              // Garis penanda di kiri
              Container(
                width: 5,
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Gambar Barang
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              imageUrl,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => Container(
                                width: 60, height: 60, color: Colors.grey[200],
                                child: const Icon(Icons.image, color: Colors.grey),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          // Detail Barang
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title,
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Borrower: $borrower',
                                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                          // Badge Status
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: statusBgColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              statusText,
                              style: TextStyle(color: statusColor, fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Garis pemisah tipis
                      Divider(height: 1, color: Colors.grey[200]),
                      const SizedBox(height: 12),
                      // Bagian Bawah (Footer dinamis)
                      footerWidget,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, {required bool isActive, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: isActive ? const EdgeInsets.symmetric(horizontal: 20, vertical: 8) : const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: isActive
            ? BoxDecoration(
          color: primaryTeal,
          borderRadius: BorderRadius.circular(20),
        )
            : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: isActive ? Colors.white : Colors.grey, size: isActive ? 20 : 24),
            if (isActive) const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                color: isActive ? Colors.white : Colors.grey,
                fontSize: isActive ? 12 : 11,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}