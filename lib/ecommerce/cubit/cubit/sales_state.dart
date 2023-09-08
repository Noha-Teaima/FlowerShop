part of 'sales_cubit.dart';

@immutable
sealed class SalesState {}

final class SalesInitial extends SalesState {}

final class SalesLoading extends SalesState {}

final class SalesSuccess extends SalesState {}
