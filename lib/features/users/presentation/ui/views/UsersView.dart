import 'package:admin_dashboard/features/users/logic/user_cubit/user_cubit.dart';
import 'package:admin_dashboard/features/users/logic/user_cubit/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../dashboard/data/services/dashboard_service.dart';
import '../../../data/services/user_service.dart';
class UsersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => UserCubit(UserService())..getUserData(),
    child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          else if (state is UserSuccess) {
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                final user = state.users[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(user.name[0]),
                    ),
                    title: Text(user.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user.email),
                        Text(user.phone),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {},
                    ),
                  ),
                );
              },
            );
          }
          else if (state is UserError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text("No Data"));
        }
    )
    );
  }
}