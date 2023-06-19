import 'package:mobx/mobx.dart';
import 'package:task_notes/model/note_model.dart';

part 'search_state.g.dart';

// ignore: library_private_types_in_public_api
class SearchState = _SearchState with _$SearchState;

abstract class _SearchState with Store {
  final List<Note> myNotes;

  _SearchState({
    required this.myNotes,
  });

  @observable
  bool typed = false;

  @observable
  ObservableList<Note> searchedNotes = <Note>[].asObservable();

  @action
  void search(String value) {
    print(value);
    for (var i = 0; i < myNotes.length; ++i) {
      if (value == myNotes[i].title) {
        searchedNotes.add(myNotes[i]);
        break;
      }
      else {
        searchedNotes.clear();
      }
    }
  }
}
