import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/gallery_provider.dart';
import '../models/media_item.dart';
import 'media_thumbnail.dart';
import 'package:intl/intl.dart';

class RecentSection extends StatelessWidget {
  const RecentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GalleryProvider>(
      builder: (context, provider, child) {
        final recentGroups = _groupRecentMedia(provider.recentMedia);
        
        if (recentGroups.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Text(
                    'Recent Days',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      // TODO: Show all recent photos
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
            
            // Recent items horizontal scroll
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: recentGroups.length > 3 ? 3 : recentGroups.length,
                itemBuilder: (context, index) {
                  final group = recentGroups[index];
                  return Container(
                    width: 140,
                    margin: const EdgeInsets.only(right: 12),
                    child: _RecentGroupCard(
                      date: group['date'] as DateTime,
                      media: group['media'] as List<MediaItem>,
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  List<Map<String, dynamic>> _groupRecentMedia(List<MediaItem> media) {
    final Map<String, List<MediaItem>> groups = {};
    
    for (final item in media) {
      final dateKey = DateFormat('yyyy-MM-dd').format(item.createdTime);
      groups[dateKey] = groups[dateKey] ?? [];
      groups[dateKey]!.add(item);
    }

    final List<Map<String, dynamic>> result = [];
    final sortedKeys = groups.keys.toList()
      ..sort((a, b) => b.compareTo(a));

    for (final key in sortedKeys) {
      result.add({
        'date': DateTime.parse(key),
        'media': groups[key]!,
      });
    }

    return result;
  }
}

class _RecentGroupCard extends StatelessWidget {
  final DateTime date;
  final List<MediaItem> media;

  const _RecentGroupCard({
    required this.date,
    required this.media,
  });

  @override
  Widget build(BuildContext context) {
    final primaryItem = media.first;
    
    return GestureDetector(
      onTap: () {
        // TODO: Open recent group view
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey[900],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              // Background image
              Positioned.fill(
                child: MediaThumbnail(
                  mediaItem: primaryItem,
                  fit: BoxFit.cover,
                ),
              ),
              
              // Gradient overlay
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                  ),
                ),
              ),
              
              // Date label
              Positioned(
                bottom: 12,
                left: 12,
                right: 12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _formatDate(date),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (media.length > 1)
                      Text(
                        '${media.length} items',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                  ],
                ),
              ),
              
              // Play icon for videos
              if (primaryItem.isVideo)
                const Positioned(
                  top: 12,
                  right: 12,
                  child: Icon(
                    Icons.play_circle_filled,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date).inDays;
    
    if (difference == 0) {
      return 'Today';
    } else if (difference == 1) {
      return 'Yesterday';
    } else if (difference < 7) {
      return DateFormat('EEEE').format(date);
    } else {
      return DateFormat('MMM d').format(date);
    }
  }
}