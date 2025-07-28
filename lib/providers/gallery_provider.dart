import 'package:flutter/foundation.dart';
import 'package:photo_manager/photo_manager.dart';
import '../models/media_item.dart';

class GalleryProvider with ChangeNotifier {
  List<MediaItem> _allMedia = [];
  List<MediaItem> _recentMedia = [];
  bool _isLoading = false;
  bool _hasPermission = false;
  String _selectedView = 'all'; // 'all', 'recent', 'people'

  List<MediaItem> get allMedia => _allMedia;
  List<MediaItem> get recentMedia => _recentMedia;
  bool get isLoading => _isLoading;
  bool get hasPermission => _hasPermission;
  String get selectedView => _selectedView;

  Future<void> initialize() async {
    _isLoading = true;
    notifyListeners();

    final permission = await PhotoManager.requestPermissionExtend();
    _hasPermission = permission.isAuth;

    if (_hasPermission) {
      await loadMedia();
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> loadMedia() async {
    try {
      final albums = await PhotoManager.getAssetPathList(
        type: RequestType.common,
        hasAll: true,
      );

      if (albums.isNotEmpty) {
        final recentAlbum = albums.first;
        final assets = await recentAlbum.getAssetListRange(
          start: 0,
          end: 1000, // Load first 1000 items
        );

        _allMedia = await Future.wait(
          assets.map((asset) => MediaItem.fromAsset(asset)),
        );

        // Get recent media (last 30 days)
        final now = DateTime.now();
        final thirtyDaysAgo = now.subtract(const Duration(days: 30));
        
        _recentMedia = _allMedia.where((item) {
          return item.createdTime.isAfter(thirtyDaysAgo);
        }).toList();

        notifyListeners();
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error loading media: $e');
      }
    }
  }

  void setSelectedView(String view) {
    _selectedView = view;
    notifyListeners();
  }

  List<MediaItem> getMediaByDateGroup() {
    final Map<String, List<MediaItem>> groupedMedia = {};
    
    for (final item in _allMedia) {
      final dateKey = _formatDateKey(item.createdTime);
      groupedMedia[dateKey] = groupedMedia[dateKey] ?? [];
      groupedMedia[dateKey]!.add(item);
    }

    // Sort by date descending
    final sortedKeys = groupedMedia.keys.toList()
      ..sort((a, b) => b.compareTo(a));

    final List<MediaItem> result = [];
    for (final key in sortedKeys) {
      result.addAll(groupedMedia[key]!);
    }

    return result;
  }

  String _formatDateKey(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}