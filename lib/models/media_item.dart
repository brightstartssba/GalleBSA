import 'package:photo_manager/photo_manager.dart';

class MediaItem {
  final String id;
  final String? title;
  final AssetType type;
  final DateTime createdTime;
  final int width;
  final int height;
  final AssetEntity asset;
  final Duration? duration;

  MediaItem({
    required this.id,
    this.title,
    required this.type,
    required this.createdTime,
    required this.width,
    required this.height,
    required this.asset,
    this.duration,
  });

  static Future<MediaItem> fromAsset(AssetEntity asset) async {
    return MediaItem(
      id: asset.id,
      title: asset.title,
      type: asset.type,
      createdTime: asset.createDateTime,
      width: asset.width,
      height: asset.height,
      asset: asset,
      duration: asset.type == AssetType.video 
          ? Duration(seconds: asset.duration)
          : null,
    );
  }

  bool get isVideo => type == AssetType.video;
  bool get isImage => type == AssetType.image;

  String get durationText {
    if (duration == null) return '';
    
    final minutes = duration!.inMinutes;
    final seconds = duration!.inSeconds % 60;
    
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}