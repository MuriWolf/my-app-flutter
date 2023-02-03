import 'package:flutter/cupertino.dart';

class Tarefa {
  final String _id = UniqueKey().toString();
  String _descricao = "";
  bool _concluido = false;

  Tarefa(this._descricao, this._concluido);

  String get id => _id;

  bool get concluido => _concluido;

  set concluido(bool value) {
    _concluido = value;
  }

  String get descricao => _descricao;

  set descricao(String text) {
    _descricao = text;
  }
}
