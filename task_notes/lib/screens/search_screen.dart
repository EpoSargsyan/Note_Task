import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../app_styles/app_colors.dart';
import '../mobx_store/search_state/search_state.dart';
import '../model/note_model.dart';
import 'note_edit_page.dart';

class SearchScreen extends StatefulWidget {
  final List<Note> myNotes;
  final void Function(Note) editNote;

  const SearchScreen({
    super.key,
    required this.myNotes,
    required this.editNote,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final SearchState _searchState;
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchState = SearchState(myNotes: widget.myNotes);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: kToolbarHeight,
          ),
          SizedBox(
            width: 360,
            height: 50,
            child: TextField(
              autofocus: true,
              cursorColor: AppColors.gray,
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: () {
                    _searchController.clear();
                    _searchState.searchedNotes.clear();
                  },
                  child: const Icon(
                    Icons.clear,
                    color: AppColors.gray,
                  ),
                ),
                contentPadding: const EdgeInsets.only(left: 35),
                hintText: 'Search by the keyword...',
                hintStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: AppColors.gray,
                ),
                filled: true,
                fillColor: AppColors.darkGray,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(
                color: AppColors.white,
              ),
              controller: _searchController,
              onChanged: _searchState.search,
            ),
          ),
          Observer(
            builder: (_) => SizedBox(
                height: _searchState.searchedNotes.isNotEmpty ? 0 : 190),
          ),
          Observer(
            builder: (_) => _searchState.searchedNotes.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NoteEditPage(
                                  noteModel: _searchState.searchedNotes[index],
                                  editNote: widget.editNote,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: _searchState.searchedNotes[index].color,
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
                              _searchState.searchedNotes[index].title,
                            ),
                          ),
                        );
                      },
                      itemCount: _searchState.searchedNotes.length,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                    ),
                    child: Image.asset('assets/empty_search_page.png'),
                  ),
          ),
        ],
      ),
    );
  }
}
