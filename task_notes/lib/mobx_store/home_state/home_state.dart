import 'package:mobx/mobx.dart';
import 'package:task_notes/model/note_model.dart';
part 'home_state.g.dart';

// ignore: library_private_types_in_public_api
class HomeState = _HomeState with _$HomeState;

abstract class _HomeState with Store {

  @observable
  ObservableList<Note> notes = <Note>[].asObservable();

  @observable
  ObservableList<Note> searchedItems = <Note>[].asObservable();

  @action
  void addNotes(Note note) {
    notes.insert(0, note);
  }

  @action
  void deleteNote(Note note){
    final index = notes.indexWhere((element) => note.id == element.id);

    if (index != -1) {
      notes.removeAt(index);
    }
  }

  @action
  void editNote(Note note){

    final index = notes.indexWhere((element) => note.id == element.id);

    if(index != -1){
      notes[index] = note;
    }
  }




}
