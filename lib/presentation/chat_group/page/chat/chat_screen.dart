import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flight_booking_app/models/group_model.dart';
import 'package:my_flight_booking_app/presentation/auth/widget/input_textfield.dart';
import 'package:my_flight_booking_app/presentation/chat_group/bloc/chat_group_bloc.dart';
import 'package:my_flight_booking_app/presentation/chat_group/page/group_details/group_details_screen.dart';
import 'package:my_flight_booking_app/utils/color_manager.dart';

class ChatScreen extends StatefulWidget {
  final GroupModel groupModel;
  const ChatScreen({super.key, required this.groupModel});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: ColorManager.primary),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            widget.groupModel.name!,
            style: TextStyle(
              color: ColorManager.primary,
              fontWeight: FontWeight.bold,
              fontSize: 22.sp,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.info_outline, color: ColorManager.primary),
              onPressed: () {
                // Navigate to group details
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        GroupDetailsScreen(groupModel: widget.groupModel),
                  ),
                );
              },
            ),
          ],
        ),
        body: BlocBuilder<ChatGroupBloc, ChatGroupState>(
          builder: (context, state) {
            final bloc = context.read<ChatGroupBloc>();

            if (state.isLoadingMessages) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.messageError != null) {
              return Center(child: Text('Error: ${state.messageError}'));
            }
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _scrollToBottom();
            });

            return SafeArea(
              child: Column(
                children: [
                  // ================= Messages List =================
                  Expanded(
                    child: ListView.builder(
                      // reverse: true,
                      itemCount: state.messages?.length ?? 0,
                      controller: _scrollController,
                      itemBuilder: (context, index) {
                        final msg = state.messages![index];

                        final isMe = msg.senderId == state.currentUserId;
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          child: Align(
                            alignment: isMe
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.75,
                              ),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: isMe
                                    ? ColorManager.primary
                                    : ColorManager.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: const Radius.circular(12),
                                  topRight: const Radius.circular(12),
                                  bottomLeft: isMe
                                      ? const Radius.circular(12)
                                      : const Radius.circular(0),
                                  bottomRight: isMe
                                      ? const Radius.circular(0)
                                      : const Radius.circular(12),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: isMe
                                    ? CrossAxisAlignment.end
                                    : CrossAxisAlignment.start,
                                children: [
                                  // ===== Sender Name (only for others) =====
                                  if (!isMe)
                                    Text(
                                      msg.senderName ?? '',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                        color: ColorManager.primary,
                                      ),
                                    ),

                                  // ===== Message =====
                                  Text(
                                    msg.message ?? '',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      color: isMe
                                          ? Colors.white
                                          : ColorManager.black,
                                    ),
                                  ),

                                  const SizedBox(height: 4),

                                  // ===== Time =====
                                  Text(
                                    msg.formattedDateTime,
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      color: isMe
                                          ? Colors.white70
                                          : Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // ================= Send Message Input =================
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: InputTextfield(
                            controller: _messageController,
                            label: 'Type a message...',
                            icon: Icons.textsms_outlined,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.send),
                          onPressed: () {
                            FocusScope.of(context).unfocus();

                            final currentUserId = bloc.state.currentUserId;
                            if (_messageController.text.isNotEmpty &&
                                currentUserId != null) {
                              bloc.add(
                                SendMessageEvent(
                                  groupId: widget.groupModel.id!,
                                  senderId: currentUserId,
                                  message: _messageController.text.trim(),
                                ),
                              );
                              _messageController.clear();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
