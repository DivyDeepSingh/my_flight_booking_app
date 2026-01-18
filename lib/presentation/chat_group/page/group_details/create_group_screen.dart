import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flight_booking_app/presentation/auth/widget/input_textfield.dart';
import 'package:my_flight_booking_app/presentation/chat_group/bloc/chat_group_bloc.dart';
import 'package:my_flight_booking_app/presentation/chat_group/page/group_details/widget/user_card_with_selection.dart';
import 'package:my_flight_booking_app/utils/color_manager.dart';

class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({super.key});

  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  final TextEditingController _groupNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _groupNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          'Create New Group',
          style: TextStyle(
            color: ColorManager.primary,
            fontWeight: FontWeight.bold,
            fontSize: 22.sp,
          ),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              InputTextfield(
                controller: _groupNameController,
                label: 'Group Name',
                icon: Icons.group,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Group name is required";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.h),

              Expanded(
                child: BlocBuilder<ChatGroupBloc, ChatGroupState>(
                  builder: (context, state) {
                    if (state.isLoadingUsers) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state.usersError != null) {
                      return Center(
                        child: Text(
                          'Error: ${state.usersError}',
                          style: TextStyle(color: ColorManager.error),
                        ),
                      );
                    }

                    if (state.users.isEmpty) {
                      return const Center(child: Text('No users found'));
                    }

                    return ListView.separated(
                      itemCount: state.users
                          .where((element) => element.id != state.currentUserId)
                          .length,
                      separatorBuilder: (_, __) => SizedBox(height: 12.h),
                      itemBuilder: (context, index) {
                        final user = state.users[index];
                        final isSelected = state.selectedUserIds.contains(
                          user.id,
                        );

                        return UserCardWithSelection(
                          isSelected: isSelected,
                          user: user,
                        );
                      },
                    );
                  },
                ),
              ),

              SizedBox(height: 16.h),

              BlocListener<ChatGroupBloc, ChatGroupState>(
                listener: (context, state) {
                  if (state.lastCreatedGroupId != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text(
                          "Your group has been created successful!",
                        ),
                        backgroundColor: ColorManager.primary,
                      ),
                    );

                    Navigator.pop(context);
                  }
                },
                child: BlocBuilder<ChatGroupBloc, ChatGroupState>(
                  builder: (context, state) {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          backgroundColor: ColorManager.primary,
                        ),
                        onPressed:
                            state.isCreatingGroup ||
                                state.selectedUserIds.isEmpty
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<ChatGroupBloc>().add(
                                    CreateGroupEvent(
                                      name: _groupNameController.text.trim(),
                                    ),
                                  );
                                }
                              },
                        child: state.isCreatingGroup
                            ? CircularProgressIndicator(
                                color: ColorManager.white,
                              )
                            : Text(
                                "Create Group",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.white,
                                ),
                              ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
