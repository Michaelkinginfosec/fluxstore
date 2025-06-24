class UserEntity {
  final String id;
  final String fullName;
  final String email;
  final String createdAt;
  final String updatedAt;

  UserEntity({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.fullName,
    required this.email,
  });
}

class UserDataEntity {
  final UserEntity user;
  final String token;

  UserDataEntity({required this.user, required this.token});
}
