import 'package:flutter/material.dart';

class PeopleSection extends StatelessWidget {
  const PeopleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              const Text(
                'People & Pets',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  // TODO: Show all people
                },
                child: const Icon(
                  Icons.chevron_right,
                  color: Colors.white70,
                  size: 24,
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 16),
        
        // People grid (placeholder)
        Container(
          height: 120,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              // Add people placeholder
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.white70,
                      size: 32,
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Add People',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(width: 12),
              
              // Pet detection placeholder
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.pets,
                      color: Colors.white70,
                      size: 32,
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Pets',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}