class UserEntity {
  UserEntity({required this.id, required this.email, required this.username});

  final String id;
  final String email;
  final String username;

  Map<String, dynamic> toMap() {
    return {'id': id, 'username': username, 'email': email};
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      id: map['uid'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
    );
  }
}
