import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flight_booking_app/models/group_model.dart';
import 'package:my_flight_booking_app/models/user_model.dart';
import 'package:my_flight_booking_app/presentation/chat_group/bloc/chat_group_bloc.dart';
import 'package:my_flight_booking_app/presentation/chat_group/page/group_details/widget/user_card_with_selection.dart';
import 'package:my_flight_booking_app/utils/color_manager.dart';

class GroupDetailsScreen extends StatelessWidget {
  final GroupModel groupModel;

  const GroupDetailsScreen({super.key, required this.groupModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Group Details'),
        backgroundColor: ColorManager.background,
        foregroundColor: ColorManager.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              groupModel.name ?? 'Unnamed Group',
              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.h),

            Text(
              'Created by: ${context.read<ChatGroupBloc>().state.users.where((element) => element.id == groupModel.ownerId).first.name}',
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),

            SizedBox(height: 20.h),

            Expanded(
              child: ListView.builder(
                itemCount: groupModel.members.length,
                padding: EdgeInsets.symmetric(vertical: 4.h),
                itemBuilder: (context, index) {
                  final memberId = groupModel.members[index];
                  final state = context.read<ChatGroupBloc>().state;

                  final user = state.users.firstWhere(
                    (u) => u.id == memberId,
                    orElse: () =>
                        UserModel(email: "", id: "", name: "", phoneNumber: ""),
                  );
                  return UserCardWithSelection(
                    isSelected: true,
                    user: user,
                    shouldShowCheckBox: false,
                  );
                },
              ),
            ),

            SizedBox(height: 10.h),

            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorManager.error,
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                context.read<ChatGroupBloc>().add(
                  LeaveGroupEvent(groupId: groupModel.id!),
                );
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              icon: Icon(Icons.exit_to_app, color: ColorManager.white),
              label: Text(
                'Leave Group',
                style: TextStyle(fontSize: 16.sp, color: ColorManager.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
