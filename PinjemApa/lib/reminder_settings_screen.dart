import 'package:flutter/material.dart';
import 'add_item_screen.dart';
import 'home_screen.dart';

class ReminderSettingsScreen extends StatefulWidget {
  const ReminderSettingsScreen({super.key});

  @override
  State<ReminderSettingsScreen> createState() => _ReminderSettingsScreenState();
}

class _ReminderSettingsScreenState extends State<ReminderSettingsScreen> {
  final Color primaryTeal = const Color(0xFF0B7B69);

  // State untuk menyimpan pilihan pengguna
  bool _enableReminders = true;
  bool _emailNotifications = false;
  bool _smsAlerts = false;
  String _selectedReminderTime = "1 day before";

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

              // --- TITLE & SUBTITLE ---
              const Text(
                'Reminder Settings',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              const Text(
                'Manage how and when you want to be notified about borrowed items.',
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
              const SizedBox(height: 24),

              // --- ILLUSTRATION ---
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  'https://images.unsplash.com/photo-1579389083046-e3df9c2b3325?auto=format&fit=crop&w=600&q=80',
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 24),

              // --- ENABLE REMINDERS TOGGLE ---
              _buildSettingTile(
                icon: Icons.notifications_active_outlined,
                iconColor: Colors.blue,
                title: 'Enable Reminders',
                subtitle: 'Get push notifications for due dates',
                trailing: Switch(
                  value: _enableReminders,
                  activeColor: primaryTeal,
                  onChanged: (value) {
                    setState(() => _enableReminders = value);
                  },
                ),
              ),
              const SizedBox(height: 30),

              // --- REMINDER TIME SECTION ---
              Row(
                children: [
                  Icon(Icons.access_time, color: Colors.grey[400], size: 22),
                  const SizedBox(width: 12),
                  const Text(
                    'Reminder Time',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 34, top: 4),
                child: Text('When should we alert you?', style: TextStyle(color: Colors.grey, fontSize: 12)),
              ),
              const SizedBox(height: 16),

              // Daftar Pilihan Waktu
              _buildTimeOption("1 day before"),
              _buildTimeOption("On the day"),
              _buildTimeOption("2 days before"),
              _buildTimeOption("1 week before"),

              const SizedBox(height: 30),

              // --- COMMUNICATION CHANNELS ---
              const Text(
                'Communication Channels',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 16),
              _buildChannelToggle(Icons.email_outlined, 'Email Notifications', _emailNotifications, (val) => setState(() => _emailNotifications = val)),
              _buildChannelToggle(Icons.sms_outlined, 'SMS Alerts', _smsAlerts, (val) => setState(() => _smsAlerts = val)),

              const SizedBox(height: 32),

              // --- ACTION BUTTONS ---
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        side: BorderSide(color: primaryTeal),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: Text('Cancel', style: TextStyle(color: primaryTeal, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Logika simpan di sini
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryTeal,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text('Save Changes', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 80),
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
            _buildNavItem(Icons.home_outlined, 'Home', false, onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
            }),
            _buildNavItem(Icons.add_circle_outline, 'Add', false, onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AddItemScreen()));
            }),
            _buildNavItem(Icons.person, 'Profile', true, onTap: () {}),
          ],
        ),
      ),
    );
  }

  // --- HELPER WIDGETS ---

  Widget _buildSettingTile({required IconData icon, required Color iconColor, required String title, required String subtitle, required Widget trailing}) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: iconColor, size: 24),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ),
        trailing,
      ],
    );
  }

  Widget _buildTimeOption(String label) {
    bool isSelected = _selectedReminderTime == label;
    return GestureDetector(
      onTap: () => setState(() => _selectedReminderTime = label),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12, left: 34),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? primaryTeal : Colors.grey.shade200,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                color: isSelected ? primaryTeal : Colors.black87,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            if (isSelected)
              Icon(Icons.check_circle, color: primaryTeal, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildChannelToggle(IconData icon, String label, bool value, Function(bool) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey.shade400, size: 20),
          const SizedBox(width: 12),
          Text(label, style: TextStyle(color: Colors.grey.shade700, fontSize: 14)),
          const Spacer(),
          Transform.scale(
            scale: 0.8,
            child: Switch(
              value: value,
              onChanged: onChanged,
              activeColor: primaryTeal,
            ),
          ),
        ],
      ),
    );
  }

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