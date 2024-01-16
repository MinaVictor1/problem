part of 'changepage_cubit.dart';

@immutable
sealed class ChangepageState {}

final class ChangepageInitial extends ChangepageState {}

final class ChangepageForward extends ChangepageState {}
