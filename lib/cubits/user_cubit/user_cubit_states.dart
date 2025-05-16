import 'package:equatable/equatable.dart';
import 'package:fit_rush_app/database/app_database.dart';

class UserState extends Equatable {
  final UsersTableData? user;

  const UserState({this.user});

  UserState copyWith({UsersTableData? user}) {
    return UserState(user: user ?? this.user);
  }

  @override
  List<Object?> get props => [user];
}
