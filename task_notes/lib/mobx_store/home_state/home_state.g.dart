// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeState on _HomeState, Store {
  late final _$notesAtom = Atom(name: '_HomeState.notes', context: context);

  @override
  ObservableList<Note> get notes {
    _$notesAtom.reportRead();
    return super.notes;
  }

  @override
  set notes(ObservableList<Note> value) {
    _$notesAtom.reportWrite(value, super.notes, () {
      super.notes = value;
    });
  }

  late final _$searchedItemsAtom =
      Atom(name: '_HomeState.searchedItems', context: context);

  @override
  ObservableList<Note> get searchedItems {
    _$searchedItemsAtom.reportRead();
    return super.searchedItems;
  }

  @override
  set searchedItems(ObservableList<Note> value) {
    _$searchedItemsAtom.reportWrite(value, super.searchedItems, () {
      super.searchedItems = value;
    });
  }

  late final _$_HomeStateActionController =
      ActionController(name: '_HomeState', context: context);

  @override
  void addNotes(Note note) {
    final _$actionInfo =
        _$_HomeStateActionController.startAction(name: '_HomeState.addNotes');
    try {
      return super.addNotes(note);
    } finally {
      _$_HomeStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteNote(Note note) {
    final _$actionInfo =
        _$_HomeStateActionController.startAction(name: '_HomeState.deleteNote');
    try {
      return super.deleteNote(note);
    } finally {
      _$_HomeStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editNote(Note note) {
    final _$actionInfo =
        _$_HomeStateActionController.startAction(name: '_HomeState.editNote');
    try {
      return super.editNote(note);
    } finally {
      _$_HomeStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
notes: ${notes},
searchedItems: ${searchedItems}
    ''';
  }
}
