import 'dart:io' show File;

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/typedefs/functional_typedefs.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/blog_model.dart';
import '../../domain/providers/blog_usecase_providers.dart';
import '../../domain/usecases/upload_blog.dart';

part 'blog_notifier.g.dart';
part 'blog_state.dart';

@riverpod
class BlogNotifier extends _$BlogNotifier {
  @override
  BlogState build() {
    fetchAllBlogs();
    return const BlogLoading();
  }

  Future<void> uploadBlog({
    required String posterId,
    required String title,
    required String content,
    required File image,
    required List<String> topics,
  }) async {
    final EitherFailure<BlogModel> res =
        await ref.read(uploadBlogUseCaseProvider).call(
              UploadBlogParams(
                posterId: posterId,
                title: title,
                content: content,
                image: image,
                topics: topics,
              ),
            );
    state = res.fold(
      (Failure l) => BlogFailure(l.message),
      (BlogModel r) => const BlogUploadSuccess(),
    );
  }

  Future<void> fetchAllBlogs() async {
    final EitherFailure<List<BlogModel>> res =
        await ref.read(getAllBlogsUseCaseProvider).call(NoParams());
    state = res.fold(
      (Failure l) => BlogFailure(l.message),
      BlogsDisplaySuccess.new,
    );
  }
}
