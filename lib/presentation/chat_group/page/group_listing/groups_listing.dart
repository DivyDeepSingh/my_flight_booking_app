import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flight_booking_app/presentation/chat_group/bloc/chat_group_bloc.dart';
import 'package:my_flight_booking_app/presentation/chat_group/page/chat/chat_screen.dart';
import 'package:my_flight_booking_app/presentation/chat_group/page/group_details/create_group_screen.dart';
import 'package:my_flight_booking_app/presentation/chat_group/page/group_listing/widget/group_list_tile.dart';
import 'package:my_flight_booking_app/utils/color_manager.dart';

class GroupsListing extends StatefulWidget {
  const GroupsListing({super.key});

  @override
  State<GroupsListing> createState() => _GroupsListingState();
}

class _GroupsListingState extends State<GroupsListing> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatGroupBloc, ChatGroupState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorManager.background,

          appBar: AppBar(
            backgroundColor: ColorManager.background,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: ColorManager.primary),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text(
              'Chat Groups',
              style: TextStyle(
                color: ColorManager.primary,
                fontWeight: FontWeight.bold,
                fontSize: 22.sp,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(Icons.add, size: 28.sp, color: ColorManager.primary),
                onPressed: () {
                  BlocProvider.of<ChatGroupBloc>(
                    context,
                  ).add(OnLoadAllUsersEvent());

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateGroupScreen(),
                    ),
                  );
                },
              ),
            ],
          ),

          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Column(
              children: [
                if (state.isLoadingGroups)
                  const LinearProgressIndicator()
                else if (state.groupError != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Error: ${state.groupError}',
                      style: TextStyle(color: ColorManager.error),
                    ),
                  )
                else if (state.groups.isEmpty)
                  Expanded(
                    child: Center(
                      child: Text(
                        'No groups available, create a new one!',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: ColorManager.black,
                        ),
                      ),
                    ),
                  )
                else
                  Expanded(
                    child: ListView.separated(
                      itemCount: state.groups.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 16.h),
                      itemBuilder: (context, index) {
                        return GroupListTile(groupModel: state.groups![index]);
                      },
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
