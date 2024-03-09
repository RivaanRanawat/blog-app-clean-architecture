import 'dart:io' show File;

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/common/providers/app_user/app_user_notifier.dart';
import '../../../../core/common/widgets/loader.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/context_ext.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../../../core/utils/pick_image.dart';
import '../notifiers/blog_notifier.dart';
import '../widgets/blog_editor.dart';
import 'blog_page.dart';

class AddNewBlogPage extends ConsumerStatefulWidget {
  const AddNewBlogPage({super.key});

  @override
  ConsumerState<AddNewBlogPage> createState() => _AddNewBlogPageState();
}

class _AddNewBlogPageState extends ConsumerState<AddNewBlogPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<String> selectedTopics = const <String>[];
  File? image;

  Future<void> selectImage() async {
    final File? pickedImage = await pickImage();
    if (pickedImage == null) return;
    setState(() => image = pickedImage);
  }

  void uploadBlog() {
    if (formKey.currentState!.validate() &&
        selectedTopics.isNotEmpty &&
        image != null) {
      final String? posterId = ref.read(appUserNotifierProvider).userIdOrNull;
      if (posterId == null) return;
      ref.read(blogNotifierProvider.notifier).uploadBlog(
            posterId: posterId,
            title: titleController.text.trim(),
            content: contentController.text.trim(),
            image: image!,
            topics: selectedTopics,
          );
    }
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    contentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <IconButton>[
          IconButton(
            onPressed: uploadBlog,
            icon: const Icon(Icons.done_rounded),
          ),
        ],
      ),
      body: Consumer(
        child: const Loader(),
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          ref.listen(blogNotifierProvider, (_, BlogState state) {
            if (state is BlogFailure) {
              context.showSnackBar(state.error);
            } else if (state is BlogUploadSuccess) {
              context.pushAndRemoveUntil(const BlogPage());
            }
          });
          return switch (ref.watch(blogNotifierProvider)) {
            BlogLoading() => child!,
            _ => SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        if (image != null)
                          GestureDetector(
                            onTap: selectImage,
                            child: SizedBox(
                              width: double.infinity,
                              height: 150,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  image!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )
                        else
                          GestureDetector(
                            onTap: selectImage,
                            child: DottedBorder(
                              color: AppPallete.borderColor,
                              dashPattern: const <double>[10, 4],
                              radius: const Radius.circular(10),
                              borderType: BorderType.RRect,
                              strokeCap: StrokeCap.round,
                              child: const SizedBox(
                                height: 150,
                                width: double.infinity,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.folder_open, size: 40),
                                    SizedBox(height: 15),
                                    Text(
                                      'Select your image',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        const SizedBox(height: 20),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: Constants.topics
                                .map(
                                  (String e) => Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        if (selectedTopics.contains(e)) {
                                          selectedTopics.remove(e);
                                        } else {
                                          selectedTopics.add(e);
                                        }
                                        setState(() {});
                                      },
                                      child: Chip(
                                        label: Text(e),
                                        color: selectedTopics.contains(e)
                                            ? const MaterialStatePropertyAll<
                                                Color>(AppPallete.gradient1)
                                            : null,
                                        side: selectedTopics.contains(e)
                                            ? null
                                            : const BorderSide(
                                                color: AppPallete.borderColor,
                                              ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        const SizedBox(height: 10),
                        BlogEditor(
                          controller: titleController,
                          hintText: 'Blog title',
                        ),
                        const SizedBox(height: 10),
                        BlogEditor(
                          controller: contentController,
                          hintText: 'Blog content',
                        ),
                      ],
                    ),
                  ),
                ),
              )
          };
        },
      ),
    );
  }
}
