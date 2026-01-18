import 'package:dartz/dartz.dart';
import 'package:my_flight_booking_app/core/error/api_failures.dart';
import 'package:my_flight_booking_app/core/error/failure_handler.dart';
import 'package:my_flight_booking_app/models/user_model.dart';
import 'package:my_flight_booking_app/presentation/chat_group/chat_group_repository.dart';

class ChatGroupDataLayer {
  final ChatGroupRepository _repo;

  ChatGroupDataLayer({ChatGroupRepository? repo})
    : _repo = repo ?? ChatGroupRepository();

  Future<Either<ApiFailure, String>> createGroup({
    required String name,
    required String ownerId,
    required List<String> members,
  }) async {
    try {
      final groupId = await _repo.createGroup(
        name: name,
        ownerId: ownerId,
        members: members,
      );
      return Right(groupId);
    } catch (error) {
      final failure = FailureHandler.handleFailure(error);
      return Left(failure);
    }
  }

  Future<Either<ApiFailure, List<UserModel>>> getAllUsers() async {
    try {
      final users = await _repo.getAllUsers();

      List<UserModel> allUsers = List.generate(
        users.length,
        (index) => UserModel.fromJson(users[index]),
      );
      return Right(allUsers);
    } catch (error) {
      final failure = FailureHandler.handleFailure(error);
      return Left(failure);
    }
  }

  Future<Either<ApiFailure, String>> sendMessage({
    required String groupId,
    required String senderId,
    required String message,
    required String senderName,
  }) async {
    try {
      final messageId = await _repo.sendMessage(
        groupId: groupId,
        senderId: senderId,
        message: message,
        senderName: senderName,
      );
      return Right(messageId);
    } catch (error) {
      final failure = FailureHandler.handleFailure(error);
      return Left(failure);
    }
  }

  Future<Either<ApiFailure, bool>> leaveGroup({
    required String groupId,
    required String userId,
  }) async {
    try {
      await _repo.leaveGroup(groupId: groupId, userId: userId);
      return const Right(true);
    } catch (error) {
      final failure = FailureHandler.handleFailure(error);
      return Left(failure);
    }
  }
}
