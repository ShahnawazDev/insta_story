import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_story/data/models/user_model.dart';
import 'package:insta_story/data/repositories/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserInitial()) {
    on<FetchUsers>((event, emit) async {
      emit(UserLoading());
      try {
        final users = await userRepository.fetchUsers();
        emit(UserLoaded(users: users));
      } catch (e) {
        emit(UserError(message: e.toString()));
      }
    });
  }
}
