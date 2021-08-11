import 'package:equatable/equatable.dart';

abstract class SettingState extends Equatable {
  @override
  List<Object> get props => [];
}

class Init extends SettingState {}

class Idle extends SettingState {}
