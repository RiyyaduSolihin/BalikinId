import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'add_item_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final Color primaryTeal = const Color(0xFF0B7B69);
  bool isDarkMode = false;

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
                        style: TextStyle(color: primaryTeal, fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Icon(Icons.notifications_none, color: Colors.grey[800], size: 28),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(color: Color(0xFFD32F2F), shape: BoxShape.circle),
                          constraints: const BoxConstraints(minWidth: 10, minHeight: 10),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),

              const Text('Profile & Settings', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              const Text('Review your preferences and manage your account.', style: TextStyle(color: Colors.grey, fontSize: 13)),
              const SizedBox(height: 30),

              // --- INFO PENGGUNA ---
              Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage('https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=150&q=80'),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Alex Rivera', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      const SizedBox(height: 4),
                      Text('arivera@gmail.com', style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // --- DARK MODE TOGGLE ---
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.grey[100], shape: BoxShape.circle),
                      child: Icon(Icons.dark_mode_outlined, color: Colors.grey[700], size: 20),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Dark Mode', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                          Text('Adjust visual preference', style: TextStyle(color: Colors.grey, fontSize: 12)),
                        ],
                      ),
                    ),
                    Switch(
                      value: isDarkMode,
                      onChanged: (val) => setState(() => isDarkMode = val),
                      activeColor: primaryTeal,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // --- PREMIUM CARD (EMAS) ---
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFFD54F), Color(0xFFD89B00)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(color: Colors.orange.withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 8))],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.rocket_launch, color: Colors.white, size: 24),
                        const SizedBox(width: 10),
                        const Text('Pinjem Apa Pro', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text('Unlock the full borrowing experience', style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 13)),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(child: _buildProFeature(Icons.block, 'Ad-free', 'Focus on sharing')),
                        Expanded(child: _buildProFeature(Icons.all_inclusive, 'Unlimited', 'Track every item')),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: _buildProFeature(Icons.cloud_sync, 'Cloud sync', 'Sync all devices')),
                        Expanded(child: _buildProFeature(Icons.notifications_active, 'Advanced notif', 'Custom alerts')),
                      ],
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.workspace_premium, color: Color(0xFFD89B00)),
                        label: const Text('Upgrade to Premium', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.black87, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              _buildMenuItem(Icons.security, 'Privacy & Security'),
              _buildMenuItem(Icons.help_outline, 'Help Center'),
              _buildMenuItem(Icons.logout, 'Logout', isDestructive: true),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),

      // --- BOTTOM NAVIGATION BAR ---
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20, offset: const Offset(0, -5))
            ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Menu Home (Kembali ke halaman Home)
            _buildNavItem(Icons.home_outlined, 'Home', false, onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            }),

            // Menu Add (Pindah ke halaman Add Item)
            _buildNavItem(Icons.add_circle_outline, 'Add', false, onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const AddItemScreen()),
              );
            }),

            // Menu Profile (Halaman saat ini, jadi tombolnya aktif)
            _buildNavItem(Icons.person_outline, 'Profile', true, onTap: () {}),
          ],
        ),
      ),
    );
  }

  // --- HELPERS ---
  Widget _buildProFeature(IconData icon, String title, String subtitle) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.white, size: 18),
        const SizedBox(width: 8),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white)),
          Text(subtitle, style: const TextStyle(fontSize: 10, color: Colors.white70)),
        ])),
      ],
    );
  }

  Widget _buildMenuItem(IconData icon, String title, {bool isDestructive = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Icon(icon, color: isDestructive ? Colors.red[400] : Colors.grey[700]),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: isDestructive ? Colors.red[400] : Colors.black87)),
        trailing: isDestructive ? null : const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: () {},
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: isActive ? const EdgeInsets.symmetric(horizontal: 24, vertical: 8) : const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: isActive ? BoxDecoration(color: primaryTeal, borderRadius: BorderRadius.circular(20)) : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: isActive ? Colors.white : Colors.blueGrey[400], size: isActive ? 22 : 26),
            if (isActive) const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                  color: isActive ? Colors.white : Colors.blueGrey[400],
                  fontSize: isActive ? 12 : 11,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.normal
              ),
            ),
          ],
        ),
      ),
    );
  }
}