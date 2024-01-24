class UserModel {
  final String? displayName;
  final String? email;
  final bool? emailVerified;
  final bool? isAnonymous;
  final String? phoneNumber;
  final String? photoURL;
  final String? refreshToken;
  final String? uid;

  UserModel(
    this.displayName,
    this.email,
    this.emailVerified,
    this.isAnonymous,
    this.phoneNumber,
    this.photoURL,
    this.refreshToken,
    this.uid,
  );

factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      data["displayName"],
      data["email"],
      data["emailVerified"],
      data["isAnonymous"],
      data["phoneNumber"],
      data["photoURL"],
      data["refreshToken"],
      data["uid"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "displayName": displayName,
      "email": email,
      "emailVerified": emailVerified,
      "isAnonymous": isAnonymous,
      "photoURL": photoURL,
      "phoneNumber": phoneNumber,
    };
  }
}
