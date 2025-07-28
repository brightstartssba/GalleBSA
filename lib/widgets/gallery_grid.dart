import 'package:flutter/material.dart';
import '../models/media_item.dart';
import 'media_thumbnail.dart';

class GalleryGrid extends StatelessWidget {
  final List<MediaItem> media;

  const GalleryGrid({
    super.key,
    required this.media,
  });

  @override
  Widget build(BuildContext context) {
    if (media.isEmpty) {
      return const SizedBox(
        height: 300,
        child: Center(
          child: Text(
            'No photos or videos found',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Item count
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Text(
              '${media.length} Items',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 16),
          
          // Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 2),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              childAspectRatio: 1.0,
            ),
            itemCount: media.length,
            itemBuilder: (context, index) {
              final item = media[index];
              return MediaThumbnail(
                mediaItem: item,
                onTap: () => _openMediaViewer(context, item, index),
              );
            },
          ),
        ],
      ),
    );
  }

  void _openMediaViewer(BuildContext context, MediaItem item, int index) {
    // TODO: Implement full-screen media viewer
    showDialog(
      context: context,
      barrierColor: Colors.black,
      builder: (context) => Dialog.fullscreen(
        backgroundColor: Colors.black,
        child: Stack(
          children: [
            Center(
              child: MediaThumbnail(
                mediaItem: item,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              top: 50,
              right: 16,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}