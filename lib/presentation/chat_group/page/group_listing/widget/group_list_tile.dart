import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flight_booking_app/models/group_model.dart';
import 'package:my_flight_booking_app/presentation/chat_group/bloc/chat_group_bloc.dart';
import 'package:my_flight_booking_app/presentation/chat_group/page/chat/chat_screen.dart';
import 'package:my_flight_booking_app/utils/color_manager.dart';

class GroupListTile extends StatelessWidget {
  final GroupModel groupModel;
  const GroupListTile({super.key, required this.groupModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<ChatGroupBloc>(
          context,
        ).add(LoadGroupMessagesEvent(groupId: groupModel.id!));

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(groupModel: groupModel),
          ),
        );
      },
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: ColorManager.white,
        shadowColor: ColorManager.primary.withOpacity(0.3),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: ColorManager.primary.withOpacity(0.1),
                child: Icon(
                  Icons.group,
                  size: 30.sp,
                  color: ColorManager.primary,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      groupModel.name ?? "Unnamed",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                        color: ColorManager.black,
                      ),
                    ),

                    Text(
                      "${groupModel.members.length} members",
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: ColorManager.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward, color: ColorManager.grey),
            ],
          ),
        ),
      ),
    );
  }
}
