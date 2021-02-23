import 'package:equatable/equatable.dart';

abstract class AddEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class TaskFetch extends AddEvent {}
