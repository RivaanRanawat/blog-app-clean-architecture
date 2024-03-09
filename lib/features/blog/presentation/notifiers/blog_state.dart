part of 'blog_notifier.dart';

@immutable
sealed class BlogState extends Equatable {
  const BlogState();
}

final class BlogInitial extends BlogState {
  const BlogInitial();

  @override
  List<Object?> get props => const <Object>[];
}

final class BlogLoading extends BlogState {
  const BlogLoading();

  @override
  List<Object?> get props => const <Object>[];
}

final class BlogFailure extends BlogState {
  final String error;

  const BlogFailure(this.error);

  @override
  List<Object?> get props => <Object?>[error];
}

final class BlogUploadSuccess extends BlogState {
  const BlogUploadSuccess();

  @override
  List<Object?> get props => const <Object>[];
}

final class BlogsDisplaySuccess extends BlogState {
  final List<BlogModel> blogs;

  const BlogsDisplaySuccess(this.blogs);

  @override
  List<Object?> get props => <Object?>[blogs];
}
