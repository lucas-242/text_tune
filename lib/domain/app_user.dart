class AppUser {
  const AppUser({
    required this.uid,
    required this.email,
    this.displayName,
    this.photoURL,
    this.phoneNumber,
    required this.emailVerified,
    this.createdAt,
    this.lastSignIn,
  });

  factory AppUser.fromFirebaseUser(dynamic firebaseUser) => AppUser(
        uid: firebaseUser.uid,
        email: firebaseUser.email ?? '',
        displayName: firebaseUser.displayName,
        photoURL: firebaseUser.photoURL,
        phoneNumber: firebaseUser.phoneNumber,
        emailVerified: firebaseUser.emailVerified,
        createdAt: firebaseUser.metadata.creationTime,
        lastSignIn: firebaseUser.metadata.lastSignInTime,
      );

  factory AppUser.fromMap(Map<String, dynamic> map) => AppUser(
        uid: map['uid'] ?? '',
        email: map['email'] ?? '',
        displayName: map['displayName'],
        photoURL: map['photoURL'],
        phoneNumber: map['phoneNumber'],
        emailVerified: map['emailVerified'] ?? false,
        createdAt: map['createdAt'] != null
            ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'])
            : null,
        lastSignIn: map['lastSignIn'] != null
            ? DateTime.fromMillisecondsSinceEpoch(map['lastSignIn'])
            : null,
      );

  final String uid;
  final String email;
  final String? displayName;
  final String? photoURL;
  final String? phoneNumber;
  final bool emailVerified;
  final DateTime? createdAt;
  final DateTime? lastSignIn;

  Map<String, dynamic> toMap() => {
        'uid': uid,
        'email': email,
        'displayName': displayName,
        'photoURL': photoURL,
        'phoneNumber': phoneNumber,
        'emailVerified': emailVerified,
        'createdAt': createdAt?.millisecondsSinceEpoch,
        'lastSignIn': lastSignIn?.millisecondsSinceEpoch,
      };

  AppUser copyWith({
    String? uid,
    String? email,
    String? displayName,
    String? photoURL,
    String? phoneNumber,
    bool? emailVerified,
    DateTime? createdAt,
    DateTime? lastSignIn,
  }) =>
      AppUser(
        uid: uid ?? this.uid,
        email: email ?? this.email,
        displayName: displayName ?? this.displayName,
        photoURL: photoURL ?? this.photoURL,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        emailVerified: emailVerified ?? this.emailVerified,
        createdAt: createdAt ?? this.createdAt,
        lastSignIn: lastSignIn ?? this.lastSignIn,
      );

  @override
  String toString() =>
      'AppUser(uid: $uid, email: $email, displayName: $displayName)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppUser && other.uid == uid;
  }

  @override
  int get hashCode => uid.hashCode;
}
