import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flight_booking_app/models/user_model.dart';
import 'package:my_flight_booking_app/presentation/chat_group/bloc/chat_group_bloc.dart';
import 'package:my_flight_booking_app/utils/color_manager.dart';

class UserCardWithSelection extends StatelessWidget {
  final bool isSelected;

  final UserModel user;
  final bool shouldShowCheckBox;
  const UserCardWithSelection({
    super.key,
    required this.isSelected,
    required this.user,
    this.shouldShowCheckBox = true,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: isSelected ? 4 : 2,
      color: isSelected
          ? ColorManager.primary.withOpacity(0.12)
          : ColorManager.white,
      shadowColor: isSelected
          ? ColorManager.primary.withOpacity(0.2)
          : ColorManager.grey.withOpacity(0.3),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: isSelected
              ? ColorManager.primary.withOpacity(0.2)
              : ColorManager.primary.withOpacity(0.1),
          child: Text(
            user.name[0].toUpperCase(),
            style: TextStyle(
              color: ColorManager.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          user.name,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            color: isSelected ? ColorManager.primary : ColorManager.black,
          ),
        ),
        trailing: shouldShowCheckBox
            ? Checkbox(
                value: isSelected,
                activeColor: ColorManager.primary,
                checkColor: ColorManager.white, // For white check marks
                onChanged: (_) {
                  BlocProvider.of<ChatGroupBloc>(
                    context,
                  ).add(OnToggleUserSelectionEvent(userId: user.id));
                },
              )
            : SizedBox(),
        onTap: () {
          BlocProvider.of<ChatGroupBloc>(
            context,
          ).add(OnToggleUserSelectionEvent(userId: user.id));
        },
      ),
    );
  }
}
