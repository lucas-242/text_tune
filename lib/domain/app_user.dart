class AppUser {
  const AppUser({
    required this.id,
    required this.email,
    this.name,
    this.photoURL,
    this.phoneNumber,
    this.createdAt,
    this.lastSignIn,
  });

  factory AppUser.fromFirebaseUser(dynamic firebaseUser) => AppUser(
        id: firebaseUser.uid,
        email: firebaseUser.email ?? '',
        name: firebaseUser.displayName,
        photoURL: firebaseUser.photoURL,
        phoneNumber: firebaseUser.phoneNumber,
        createdAt: firebaseUser.metadata.creationTime,
        lastSignIn: firebaseUser.metadata.lastSignInTime,
      );

  factory AppUser.fromMap(Map<String, dynamic> map) => AppUser(
        id: map['uid'] ?? '',
        email: map['email'] ?? '',
        name: map['displayName'],
        photoURL: map['photoURL'],
        phoneNumber: map['phoneNumber'],
        createdAt: map['createdAt'] != null
            ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'])
            : null,
        lastSignIn: map['lastSignIn'] != null
            ? DateTime.fromMillisecondsSinceEpoch(map['lastSignIn'])
            : null,
      );

  final String id;
  final String email;
  final String? name;
  final String? photoURL;
  final String? phoneNumber;
  final DateTime? createdAt;
  final DateTime? lastSignIn;

  Map<String, dynamic> toMap() => {
        'uid': id,
        'email': email,
        'displayName': name,
        'photoURL': photoURL,
        'phoneNumber': phoneNumber,
        'createdAt': createdAt?.millisecondsSinceEpoch,
        'lastSignIn': lastSignIn?.millisecondsSinceEpoch,
      };

  AppUser copyWith({
    String? id,
    String? email,
    String? name,
    String? photoURL,
    String? phoneNumber,
    DateTime? createdAt,
    DateTime? lastSignIn,
  }) =>
      AppUser(
        id: id ?? this.id,
        email: email ?? this.email,
        name: name ?? this.name,
        photoURL: photoURL ?? this.photoURL,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        createdAt: createdAt ?? this.createdAt,
        lastSignIn: lastSignIn ?? this.lastSignIn,
      );

  @override
  String toString() => 'AppUser(id: $id, email: $email, displayName: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppUser && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
