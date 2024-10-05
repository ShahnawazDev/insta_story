import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_story/blocs/user/user_bloc.dart';
import 'package:insta_story/core/api_client.dart';
import 'package:insta_story/core/app_constant.dart';
import 'data/repositories/user_repository.dart';
import 'presentation/screens/user_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstant.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: MultiBlocProvider(
        providers: [
         
          BlocProvider(
            create: (context) =>
                UserBloc(userRepository: UserRepository(apiClient: ApiClient()))
                  ..add(FetchUsers()),
          ),
        ],
        child: const UserListScreen(),
      ),
    );
  }
}
