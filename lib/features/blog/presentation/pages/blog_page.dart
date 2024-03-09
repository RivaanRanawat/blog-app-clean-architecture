import '../../../../core/common/widgets/loader.dart';
import '../../../../core/extensions/context_ext.dart';
import '../../../../core/theme/app_pallete.dart';
import '../notifiers/blog_notifier.dart';
import 'add_new_blog_page.dart';
import '../widgets/blog_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/models/blog_model.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog App'),
        actions: <IconButton>[
          IconButton(
            onPressed: () => context.push(const AddNewBlogPage()),
            icon: const Icon(CupertinoIcons.add_circled),
          ),
        ],
      ),
      body: Consumer(
        child: const Loader(),
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          ref.listen(blogNotifierProvider, (_, BlogState next) {
            if (next is BlogFailure) {
              context.showSnackBar(next.error);
            }
          });
          return switch (ref.watch(blogNotifierProvider)) {
            BlogLoading() => child!,
            BlogsDisplaySuccess(:final List<BlogModel> blogs) =>
              ListView.builder(
                itemCount: blogs.length,
                itemBuilder: (BuildContext context, int index) {
                  final BlogModel blog = blogs[index];
                  return BlogCard(
                    blog: blog,
                    color: index % 2 == 0
                        ? AppPallete.gradient1
                        : AppPallete.gradient2,
                  );
                },
              ),
            _ => const SizedBox()
          };
        },
      ),
    );
  }
}
