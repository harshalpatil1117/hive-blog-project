import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:network/hive_blog/data/model/response.dart';

part 'hive_blog.freezed.dart';

@freezed
class HiveBlogState with _$HiveBlogState {
  factory HiveBlogState({
    @Default(HiveBlogResponse()) HiveBlogResponse hiveBlogResponse,
    @Default(true) bool isLoading,
  }) = _HiveBlogState;
}
