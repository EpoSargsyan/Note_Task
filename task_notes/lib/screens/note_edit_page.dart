import 'package:flutter/material.dart';

import '../app_styles/app_colors.dart';
import '../model/note_model.dart';

class NoteEditPage extends StatefulWidget {
  const NoteEditPage({
    super.key,
    required this.noteModel,
    required this.editNote,
  });

  final Note noteModel;
  final void Function(Note) editNote;

  @override
  State<NoteEditPage> createState() => _NoteEditPageState();
}

class _NoteEditPageState extends State<NoteEditPage> {

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.noteModel.title;
    _descriptionController.text = widget.noteModel.description!;
  }

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 141, left: 24),
            child: Column(
              children: [
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Title',
                  ),
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: _descriptionController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Type something...',
                    ),
                    style: const TextStyle(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Padding(
                    padding: const EdgeInsets.only(top: 51, left: 22),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            AppColors.darkGray),
                        elevation: MaterialStateProperty.all<double>(8),
                      ),
                      child: const Icon(Icons.arrow_back_ios),
                    )),
              ),
              const SizedBox(
                width: 150,
              ),
              Container(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 51),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(AppColors.darkGray),
                      elevation: MaterialStateProperty.all<double>(8),
                    ),
                    child: const Icon(Icons.remove_red_eye_outlined),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 51),
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              backgroundColor: AppColors.backgroundColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              title: const Icon(Icons.info),
                              content: const Padding(
                                padding: EdgeInsets.only(left: 60, right: 30),
                                child: Text(
                                  'Save changes ?',
                                  style: TextStyle(color: AppColors.white),
                                ),
                              ),
                              actions: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        showDialog(
                                            context: context,
                                            builder: (_) {
                                              return AlertDialog(
                                                backgroundColor:
                                                    AppColors.backgroundColor,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                title: const Icon(Icons.info),
                                                content: const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 60, right: 30),
                                                  child: Text(
                                                    'Are you sure you want discard your changes ?',
                                                    style: TextStyle(
                                                        color: AppColors.white),
                                                  ),
                                                ),
                                                actions: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.popUntil(
                                                          context,
                                                          ModalRoute.withName(
                                                              '/'));
                                                    },
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all<Color>(
                                                                    AppColors
                                                                        .red),
                                                        padding:
                                                            MaterialStateProperty
                                                                .all<
                                                                    EdgeInsetsGeometry>(
                                                          const EdgeInsets.only(
                                                              left: 25,
                                                              right: 26),
                                                        )),
                                                    child: const Text(
                                                      'Discard',
                                                      style: TextStyle(
                                                          color:
                                                              AppColors.white),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 60,
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all<Color>(
                                                                  Colors.green),
                                                      padding:
                                                          MaterialStateProperty.all<
                                                              EdgeInsetsGeometry>(
                                                        const EdgeInsets.only(
                                                            left: 35,
                                                            right: 37),
                                                      ),
                                                    ),
                                                    child: const Text(
                                                      'Keep',
                                                      style: TextStyle(
                                                          color:
                                                              AppColors.white),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            });
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  AppColors.red),
                                          padding: MaterialStateProperty.all<
                                              EdgeInsetsGeometry>(
                                            const EdgeInsets.only(
                                                left: 25, right: 26),
                                          )),
                                      child: const Text(
                                        'Discard',
                                        style:
                                            TextStyle(color: AppColors.white),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 40,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        if (_titleController.text.isNotEmpty) {
                                          widget.editNote(
                                            Note(
                                              id: widget.noteModel.id,
                                              title: _titleController.text,
                                              description:
                                                  _descriptionController.text,
                                              color: AppColors.getRandomColor(),
                                            ),
                                          );
                                          Navigator.pop(context);
                                        } else {
                                          Navigator.pop(context);
                                        }
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.green),
                                        padding: MaterialStateProperty.all<
                                            EdgeInsetsGeometry>(
                                          const EdgeInsets.only(
                                              left: 35, right: 37),
                                        ),
                                      ),
                                      child: const Text(
                                        'Save',
                                        style:
                                            TextStyle(color: AppColors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          });
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(AppColors.darkGray),
                      elevation: MaterialStateProperty.all<double>(8),
                    ),
                    child: const Icon(Icons.save),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
