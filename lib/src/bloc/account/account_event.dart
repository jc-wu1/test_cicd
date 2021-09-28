part of 'account_bloc.dart';

@immutable
abstract class AccountEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PostFetched extends AccountEvent {}
