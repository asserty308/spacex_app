part of 'all_data_cubit.dart';

abstract class AllDataState {}
class AllDataEmpty extends AllDataState {}
class AllDataLoading extends AllDataState {}
class AllDataStateLoaded extends AllDataState {}
class AllDataError extends AllDataState {}
