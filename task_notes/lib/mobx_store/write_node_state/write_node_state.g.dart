// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'write_node_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WriteNodeState on _WriteNodeState, Store {
  late final _$changeTextAtom =
      Atom(name: '_WriteNodeState.changeText', context: context);

  @override
  bool get changeText {
    _$changeTextAtom.reportRead();
    return super.changeText;
  }

  @override
  set changeText(bool value) {
    _$changeTextAtom.reportWrite(value, super.changeText, () {
      super.changeText = value;
    });
  }

  @override
  String toString() {
    return '''
changeText: ${changeText}
    ''';
  }
}
