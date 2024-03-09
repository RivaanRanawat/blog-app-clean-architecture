import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../usecases/get_all_blogs.dart';
import '../usecases/upload_blog.dart';
import 'blog_domain_providers.dart';

part 'blog_usecase_providers.g.dart';

@riverpod
UploadBlog uploadBlogUseCase(UploadBlogUseCaseRef ref) =>
    UploadBlog(ref.read(blogRepositoryProvider));

@riverpod
GetAllBlogs getAllBlogsUseCase(GetAllBlogsUseCaseRef ref) =>
    GetAllBlogs(ref.read(blogRepositoryProvider));
