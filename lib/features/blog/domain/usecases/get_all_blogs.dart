import '../../../../core/typedefs/functional_typedefs.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/blog_model.dart';
import '../repositories/blog_repository.dart';

class GetAllBlogs implements UseCase<List<BlogModel>, NoParams> {
  final BlogRepository blogRepository;

  const GetAllBlogs(this.blogRepository);

  @override
  FutureEither<List<BlogModel>> call(NoParams params) {
    return blogRepository.getAllBlogs();
  }
}
