import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../custom_loader.dart';
import '../data/model/hive_blog.dart';
import '../data/model/request.dart';
import '../data/repository/repository.dart';

class HiveBlogDataNotifier extends StateNotifier<HiveBlogState> {
  HiveBlogDataNotifier(this.hiveBlogRepository) : super(HiveBlogState());

  HiveBlogRepository hiveBlogRepository;

  Future<void> hiveBlog(
    HiveBlogRequest requestModel,
  ) async {
    LoaderHelper.showLoader();
    try {
      state = state.copyWith(isLoading: true);
      final data = await hiveBlogRepository.hiveBlogRepo(requestModel);
      state = state.copyWith(
        hiveBlogResponse: data,
        isLoading: false,
      );
    } catch (error) {
      print("state check ");
      print(error);
    } finally {
      LoaderHelper.hideLoader();
    }
  }
}
