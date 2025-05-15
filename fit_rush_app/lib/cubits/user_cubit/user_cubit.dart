import 'package:fit_rush_app/cubits/user_cubit/user_cubit_states.dart';
import 'package:fit_rush_app/database/app_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(const UserState());

  void setUser(UsersTableData user) {
    emit(UserState(user: user));
  }

  void clearUser() {
    emit(UserState(user: null));
  }
}
