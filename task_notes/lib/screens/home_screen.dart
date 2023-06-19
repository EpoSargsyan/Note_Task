import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:task_notes/app_styles/app_colors.dart';
import 'package:task_notes/screens/search_screen.dart';
import 'package:task_notes/screens/write_node.dart';

import '../mobx_store/home_state/home_state.dart';
import 'note_edit_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _homeState = HomeState();

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
                  const Text(
                    'Notes',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: AppColors.white,
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return SearchScreen(
                                  myNotes: _homeState.notes,
                                  editNote: _homeState.editNote,
                                );
                              },
                            ),
                          );
                        },
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.darkGray,
                          ),
                          child: const Icon(
                            Icons.search,
                            color: AppColors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      GestureDetector(
                        onTap: () {
                          onTapInfo(context);
                        },
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.darkGray,
                          ),
                          child: const Icon(
                            Icons.info_outline,
                            size: 20,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
          Observer(
            builder: (_) => _homeState.notes.isEmpty
                ? Center(
                    child: Container(
                      width: 500,
                      height: 700,
                      padding: const EdgeInsets.only(bottom: 150),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/empty_home_page.png',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Create your first note!',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.only(top: 24),
                      itemBuilder: (_, index) {
                        final itemDelete = _homeState.notes[index];
                        return Dismissible(
                          background: const Card(color: Colors.red),
                          key: Key(itemDelete.id),
                          onDismissed: (direction) {
                            _homeState.notes.removeAt(index);
                          },
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NoteEditPage(
                                    noteModel: _homeState.notes[index],
                                    editNote: _homeState.editNote,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: _homeState.notes[index].color,
                              ),
                              margin: const EdgeInsets.only(
                                right: 24,
                                left: 24,
                                bottom: 25,
                              ),
                              padding: const EdgeInsets.only(
                                left: 45,
                                top: 27,
                                bottom: 27,
                                right: 24,
                              ),
                              child: Text(
                                _homeState.notes[index].title,
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: _homeState.notes.length,
                    ),
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WriteNode(
                onSave: _homeState.addNotes,
                discardNote: _homeState.deleteNote,
                editNote: _homeState.editNote,
              ),
            ),
          );
        },
        backgroundColor: Colors.grey[800],
        tooltip: 'Add Note',
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  void onTapInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Designed by - '
              'Illustrations - '
              'Icons - '
              'Font - ',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
