import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/core/shared_provider/shared_providers.dart';

import '../data/api/api.dart';
import '../data/model/hive_blog.dart';
import '../data/repository/repository.dart';
import 'hive_blog_state_provider.dart';

final hiveBlogApiProvider = Provider<HiveBlogApi>(
  (ref) {
    return HiveBlogApi(
      ref.read(dioClientProvider),
    );
  },
);

final hiveBlogRepositoryProvider = Provider<HiveBlogRepository>(
  (ref) {
    return HiveBlogRepository(
      ref.read(hiveBlogApiProvider),
    );
  },
);

final hiveBlogDataProvider = StateNotifierProvider<HiveBlogDataNotifier, HiveBlogState>(
  (ref) {
    return HiveBlogDataNotifier(
      ref.read(hiveBlogRepositoryProvider),
    );
  },
);
