import 'dart:io' show File;

import '../../../../core/typedefs/functional_typedefs.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/blog_model.dart';
import '../repositories/blog_repository.dart';

class UploadBlog implements UseCase<BlogModel, UploadBlogParams> {
  final BlogRepository blogRepository;
  UploadBlog(this.blogRepository);

  @override
  FutureEither<BlogModel> call(UploadBlogParams params) {
    return blogRepository.uploadBlog(
      image: params.image,
      title: params.title,
      content: params.content,
      posterId: params.posterId,
      topics: params.topics,
    );
  }
}

final class UploadBlogParams extends Params {
  final String posterId;
  final String title;
  final String content;
  final File image;
  final List<String> topics;

  const UploadBlogParams({
    required this.posterId,
    required this.title,
    required this.content,
    required this.image,
    required this.topics,
  });
}
