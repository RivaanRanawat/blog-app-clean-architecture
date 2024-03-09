import 'dart:io' show File;

import 'package:fpdart/fpdart.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/connection_checker.dart';
import '../../../../core/network/connection_checker_mixin.dart';
import '../../../../core/typedefs/functional_typedefs.dart';
import '../../domain/repositories/blog_repository.dart';
import '../datasources/blog_local_data_source.dart';
import '../datasources/blog_remote_data_source.dart';
import '../models/blog_model.dart';

class BlogRepositoryImpl with ConnectionCheckerMixin implements BlogRepository {
  @override
  final ConnectionChecker connectionChecker;

  final BlogRemoteDataSource blogRemoteDataSource;
  final BlogLocalDataSource blogLocalDataSource;

  const BlogRepositoryImpl({
    required this.blogRemoteDataSource,
    required this.blogLocalDataSource,
    required this.connectionChecker,
  });

  @override
  FutureEither<BlogModel> uploadBlog({
    required File image,
    required String title,
    required String content,
    required String posterId,
    required List<String> topics,
  }) {
    return validateConnection(() async {
      try {
        final BlogModel blogModel = BlogModel(
          id: const Uuid().v1(),
          posterId: posterId,
          title: title,
          content: content,
          imageUrl: '',
          topics: topics,
          updatedAt: DateTime.now(),
        );

        final String imageUrl = await blogRemoteDataSource.uploadBlogImage(
          image: image,
          blog: blogModel,
        );
        final BlogModel uploadedBlog = await blogRemoteDataSource
            .uploadBlog(blogModel.copyWith(imageUrl: imageUrl));
        return right(uploadedBlog);
      } on ServerException catch (e) {
        return left(Failure(e.message));
      }
    });
  }

  @override
  FutureEither<List<BlogModel>> getAllBlogs() async {
    try {
      if (!await isConnected()) {
        final List<BlogModel> blogs = blogLocalDataSource.loadBlogs();
        return right(blogs);
      }
      final List<BlogModel> blogs = await blogRemoteDataSource.getAllBlogs();
      blogLocalDataSource.uploadLocalBlogs(blogs: blogs);
      return right(blogs);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
