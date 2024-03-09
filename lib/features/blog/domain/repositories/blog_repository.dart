import 'dart:io' show File;

import '../../../../core/typedefs/functional_typedefs.dart';

import '../../data/models/blog_model.dart';

abstract interface class BlogRepository {
  /// Uploads a blog to the remote server
  FutureEither<BlogModel> uploadBlog({
    required File image,
    required String title,
    required String content,
    required String posterId,
    required List<String> topics,
  });

  /// Gets all the blogs from the remote server
  FutureEither<List<BlogModel>> getAllBlogs();
}
