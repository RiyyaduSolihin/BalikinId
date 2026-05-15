import 'package:flutter/material.dart';
import 'home_screen.dart'; // Import halaman Home
import 'profile_screen.dart'; // Import halaman Profile

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final Color primaryTeal = const Color(0xFF0B7B69);

  final TextEditingController _itemController = TextEditingController();
  final TextEditingController _borrowerController = TextEditingController();
  final TextEditingController _borrowedDateController = TextEditingController();
  final TextEditingController _returnDateController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(colorScheme: ColorScheme.light(primary: primaryTeal)),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        controller.text = "${picked.month}/${picked.day}/${picked.year}";
      });
    }
  }

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
                        decoration: BoxDecoration(color: primaryTeal, borderRadius: BorderRadius.circular(10)),
                        child: const Icon(Icons.inventory_2, color: Colors.white, size: 24),
                      ),
                      const SizedBox(width: 12),
                      Text('Pinjem Apa', style: TextStyle(color: primaryTeal, fontSize: 22, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Icon(Icons.notifications_none, color: Colors.grey[800], size: 28),
                ],
              ),
              const SizedBox(height: 24),

              // --- HEADER ---
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  const SizedBox(width: 12),
                  const Text('Track a new borrow', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 36.0, top: 4),
                child: Text('Keep your items organized and ва accountability.', style: TextStyle(color: Colors.grey, fontSize: 13)),
              ),
              const SizedBox(height: 30),

              // --- FORM FIELDS (Foto, Nama, dll) ---
              const Text('Item Photo', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildImageSourceButton(Icons.camera_alt_outlined),
                        const SizedBox(width: 20),
                        _buildImageSourceButton(Icons.image_outlined),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text('Tap to take a photo or select from gallery', style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              _buildLabel('WHAT DID THEY BORROW?'),
              _buildTextField(_itemController, 'e.g. Mechanical Keyboard', Icons.work_outline),

              _buildLabel('WHO BORROWED IT?'),
              _buildTextField(_borrowerController, "Enter friend's name", Icons.person_outline),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel('BORROWED ON'),
                        _buildDateField(_borrowedDateController, 'mm/dd/yyyy', () => _selectDate(context, _borrowedDateController)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel('EXPECTED BACK'),
                        _buildDateField(_returnDateController, 'mm/dd/yyyy', () => _selectDate(context, _returnDateController)),
                      ],
                    ),
                  ),
                ],
              ),

              _buildLabel('ADDITIONAL NOTES'),
              _buildTextField(_notesController, 'Condition, context, etc.', null, maxLines: 3),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.save_outlined, color: Colors.white),
                  label: const Text('Save Item', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryTeal,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),

      // --- BOTTOM NAVIGATION BAR ---
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20, offset: const Offset(0, -5))]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // TOMBOL HOME (SEKARANG SUDAH BISA PINDAH)
            _buildNavItem(Icons.home_outlined, 'Home', false, onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            }),

            _buildNavItem(Icons.add_circle, 'Add', true, onTap: () {}),

            _buildNavItem(Icons.person_outline, 'Profile', false, onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            }),
          ],
        ),
      ),
    );
  }

  // --- HELPERS ---
  Widget _buildImageSourceButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: const Color(0xFFE0F2F1), shape: BoxShape.circle, border: Border.all(color: primaryTeal.withOpacity(0.3))),
      child: Icon(icon, color: primaryTeal, size: 28),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 16.0),
      child: Text(text, style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey.shade700)),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint, IconData? icon, {int maxLines = 1}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
        prefixIcon: icon != null ? Icon(icon, color: Colors.grey.shade400) : null,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade300)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: primaryTeal)),
      ),
    );
  }

  Widget _buildDateField(TextEditingController controller, String hint, VoidCallback onTap) {
    return TextField(
      controller: controller,
      readOnly: true,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
        prefixIcon: Icon(Icons.calendar_today_outlined, color: Colors.grey.shade400, size: 20),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade300)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: primaryTeal)),
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