// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchState on _SearchState, Store {
  late final _$typedAtom = Atom(name: '_SearchState.typed', context: context);

  @override
  bool get typed {
    _$typedAtom.reportRead();
    return super.typed;
  }

  @override
  set typed(bool value) {
    _$typedAtom.reportWrite(value, super.typed, () {
      super.typed = value;
    });
  }

  late final _$searchedNotesAtom =
      Atom(name: '_SearchState.searchedNotes', context: context);

  @override
  ObservableList<Note> get searchedNotes {
    _$searchedNotesAtom.reportRead();
    return super.searchedNotes;
  }

  @override
  set searchedNotes(ObservableList<Note> value) {
    _$searchedNotesAtom.reportWrite(value, super.searchedNotes, () {
      super.searchedNotes = value;
    });
  }

  late final _$_SearchStateActionController =
      ActionController(name: '_SearchState', context: context);

  @override
  void search(String value) {
    final _$actionInfo =
        _$_SearchStateActionController.startAction(name: '_SearchState.search');
    try {
      return super.search(value);
    } finally {
      _$_SearchStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
typed: ${typed},
searchedNotes: ${searchedNotes}
    ''';
  }
}
