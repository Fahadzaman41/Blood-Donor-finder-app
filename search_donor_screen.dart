import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'blood_group_dropdown.dart';
import 'custom_button.dart';
import 'donor_card.dart';

class SearchDonorScreen extends StatefulWidget {
  const SearchDonorScreen({super.key});

  @override
  State<SearchDonorScreen> createState() =>
      _SearchDonorScreenState();
}

class _SearchDonorScreenState
    extends State<SearchDonorScreen> {
  String blood = 'O+';
  bool showDonors = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Donors'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              Navigator.pushReplacementNamed(context, '/seeker/home');
            }
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: AppColors.border),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Filter Search Parameters',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 16),
                BloodGroupDropdown(
                  value: blood,
                  onChanged: (value) {
                    setState(() {
                      blood = value!;
                    });
                  },
                ),
                const SizedBox(height: 16),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'City / Location',
                    hintText: 'e.g. Islamabad, Rawalpindi',
                    prefixIcon: Icon(Icons.location_on_outlined, color: AppColors.primary),
                  ),
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: 'Search Donors',
                  icon: Icons.search_rounded,
                  onPressed: () {
                    setState(() {
                      showDonors = true;
                    });
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          if (showDonors) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Available Donors Found',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.successBg,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    '3 Active',
                    style: TextStyle(
                      color: AppColors.success,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            DonorCard(
              name: 'Ahmed Khan',
              bloodGroup: blood,
              location: 'Islamabad',
              distanceOrStatus: '2.5 km away',
              onTap: () {
                Navigator.pushNamed(context, '/seeker/donor-detail');
              },
            ),
            DonorCard(
              name: 'Usman Ali',
              bloodGroup: blood,
              location: 'Rawalpindi',
              distanceOrStatus: '5.1 km away',
              onTap: () {
                Navigator.pushNamed(context, '/seeker/donor-detail');
              },
            ),
            DonorCard(
              name: 'Hamza Shah',
              bloodGroup: blood,
              location: 'Taxila',
              distanceOrStatus: '12 km away',
              onTap: () {
                Navigator.pushNamed(context, '/seeker/donor-detail');
              },
            ),
          ],
        ],
      ),
    );
  }
}
