import 'package:mobx/mobx.dart';
import 'package:task_notes/model/note_model.dart';

part 'write_node_state.g.dart';

class WriteNodeState = _WriteNodeState with _$WriteNodeState;

abstract class _WriteNodeState with Store {
  @observable
  bool changeText = false;


}