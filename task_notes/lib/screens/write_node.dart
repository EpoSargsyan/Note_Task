import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:task_notes/model/note_model.dart';
import 'package:uuid/uuid.dart';

import '../app_styles/app_colors.dart';
import '../mobx_store/write_node_state/write_node_state.dart';

class WriteNode extends StatefulWidget {
  final void Function(Note) onSave;
  final void Function(Note) discardNote;
  final void Function(Note) editNote;

  const WriteNode({
    super.key,
    required this.onSave,
    required this.discardNote,
    required this.editNote,
  });

  @override
  State<WriteNode> createState() => _WriteNodeState();
}

class _WriteNodeState extends State<WriteNode> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  final _writeNodeState = WriteNodeState();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          const SizedBox(height: kToolbarHeight),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.darkGray,
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.white,
                      size: 20,
                    ),
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.darkGray,
                        ),
                        child: const Icon(
                          Icons.remove_red_eye_outlined,
                          color: AppColors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 21),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                backgroundColor: AppColors.backgroundColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                title: const Icon(Icons.info),
                                content: SizedBox(
                                  width: 262,
                                  height: 33,
                                  child: Observer(builder: (context) {
                                    return Center(
                                      child: _writeNodeState.changeText
                                          ? const Text(
                                        'Are your sure you want discard your changes ?',
                                        style:
                                        TextStyle(color: AppColors.white),
                                      )
                                          : const Text(
                                        'Save changes ?',
                                        style:
                                        TextStyle(color: AppColors.white),
                                      ),
                                    );
                                  }),
                                ),
                                actions: [
                                  Observer(builder: (context) {
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: _writeNodeState.changeText
                                              ? () {
                                            Navigator.popUntil(context,
                                                ModalRoute.withName('/'));
                                          }
                                              : () {
                                            _writeNodeState.changeText = true;
                                          },
                                          child: Container(
                                            width: 112,
                                            height: 39,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(5),
                                              color: AppColors.red,
                                            ),
                                            child: const Center(
                                              child: Text(
                                                'Discard',
                                                style: TextStyle(
                                                    color: AppColors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 35,
                                        ),
                                        GestureDetector(
                                          onTap: _writeNodeState.changeText
                                              ? () {
                                            Navigator.pop(context);
                                          }
                                              : () {
                                            if (_titleController
                                                .text.isNotEmpty) {
                                              widget.onSave(
                                                Note(
                                                  id: const Uuid().v4(),
                                                  title:
                                                  _titleController.text,
                                                  description:
                                                  _descriptionController
                                                      .text,
                                                  color: AppColors
                                                      .getRandomColor(),
                                                ),
                                              );
                                            }
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            width: 112,
                                            height: 39,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(5),
                                              color: Colors.green,
                                            ),
                                            child: Center(
                                              child: _writeNodeState.changeText
                                                  ? const Text(
                                                'Keep',
                                                style: TextStyle(
                                                    color: AppColors.white),
                                              )
                                                  : const Text(
                                                'Save',
                                                style: TextStyle(
                                                  color: AppColors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  })
                                ],
                              );
                            });
                        //                                           actions: [
                        //                                             ElevatedButton(
                        //                                               onPressed: () {
                        //                                                 Navigator.popUntil(
                        //                                                     context,
                        //                                                     ModalRoute.withName(
                        //                                                         '/'));
                        //                                               },
                        //                                               style: ButtonStyle(
                        //                                                   backgroundColor:
                        //                                                       MaterialStateProperty
                        //                                                           .all<Color>(
                        //                                                               AppColors.red),
                        //                                                   padding:
                        //                                                       MaterialStateProperty
                        //                                                           .all<
                        //                                                               EdgeInsetsGeometry>(
                        //                                                     const EdgeInsets.only(
                        //                                                         left: 25,
                        //                                                         right: 26),
                        //                                                   )),
                        //                                               child: const Text(
                        //                                                 'Discard',
                        //                                                 style: TextStyle(
                        //                                                     color: AppColors.white),
                        //                                               ),
                        //                                             ),
                        //                                             const SizedBox(
                        //                                               width: 60,
                        //                                             ),
                        //                                             TextButton(
                        //                                               onPressed: () {
                        //                                                 Navigator.pop(context);
                        //                                               },
                        //                                               style: ButtonStyle(
                        //                                                 backgroundColor:
                        //                                                     MaterialStateProperty
                        //                                                         .all<Color>(
                        //                                                             Colors.green),
                        //                                                 padding:
                        //                                                     MaterialStateProperty.all<
                        //                                                         EdgeInsetsGeometry>(
                        //                                                   const EdgeInsets.only(
                        //                                                       left: 35,
                        //                                                       right: 37),
                        //                                                 ),
                        //                                               ),
                        //                                               child: const Text(
                        //                                                 'Keep',
                        //                                                 style: TextStyle(
                        //                                                     color: AppColors.white),
                        //                                               ),
                        //                                             ),
                        //                                           ],
                        //                                         );
                        //                                       });
                        //                                 },
                        //                                 style: ButtonStyle(
                        //                                     backgroundColor:
                        //                                         MaterialStateProperty.all<Color>(
                        //                                            AppColors.red),
                        //                                     padding: MaterialStateProperty.all<
                        //                                         EdgeInsetsGeometry>(
                        //                                       const EdgeInsets.only(
                        //                                           left: 25, right: 26),
                        //                                     )),
                        //                                 child: const Text(
                        //                                   'Discard',
                        //                                   style: TextStyle(color: AppColors.white),
                        //                                 ),
                        //                               ),
                        //                               const SizedBox(
                        //                                 width: 40,
                        //                               ),
                        //                               TextButton(
                        //                                 onPressed: () {
                        //                                   if (_titleController.text.isNotEmpty) {
                        //                                     widget.onSave(
                        //                                       Note(
                        //                                         id: const Uuid().v4(),
                        //                                         title: _titleController.text,
                        //                                         description:
                        //                                             _descriptionController.text,
                        //                                         color: AppColors.getRandomColor(),
                        //                                       ),
                        //                                     );
                        //                                     Navigator.pop(context);
                        //                                   } else {
                        //                                     Navigator.pop(context);
                        //                                   }
                        //                                 },
                        //                                 style: ButtonStyle(
                        //                                   backgroundColor:
                        //                                       MaterialStateProperty.all<Color>(
                        //                                           Colors.green),
                        //                                   padding: MaterialStateProperty.all<
                        //                                       EdgeInsetsGeometry>(
                        //                                     const EdgeInsets.only(
                        //                                         left: 35, right: 37),
                        //                                   ),
                        //                                 ),
                        //                                 child: const Text(
                        //                                   'Save',
                        //                                   style: TextStyle(color: AppColors.white),
                        //                                 ),
                        //                               ),
                        //                             ],
                        //                           ),
                        //                         ],
                        //                       );
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.darkGray,
                        ),
                        child: const Icon(
                          Icons.save,
                          color: AppColors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                TextField(
                  cursorColor: AppColors.gray,
                  controller: _titleController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Title',
                    hintStyle: TextStyle(
                      color: Color(0xff9a9a9a),
                      fontSize: 48,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .30,
                  child: TextField(
                    cursorColor: AppColors.gray,
                    controller: _descriptionController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Type something...',
                      hintStyle: TextStyle(
                        color: Color(0xff9a9a9a),
                        fontSize: 23,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    style: const TextStyle(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
