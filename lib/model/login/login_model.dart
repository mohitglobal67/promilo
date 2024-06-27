import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  Status? status;
  Response? response;

  LoginModel({
    this.status,
    this.response,
  });

  LoginModel copyWith({
    Status? status,
    Response? response,
  }) =>
      LoginModel(
        status: status ?? this.status,
        response: response ?? this.response,
      );

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        response: json["response"] == null
            ? null
            : Response.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status?.toJson(),
        "response": response?.toJson(),
      };
}

class Response {
  String? accessToken;
  String? tokenType;
  String? refreshToken;
  int? expiresIn;
  String? scope;
  List<dynamic>? userRole;
  String? tenantName;
  String? userType;
  String? userId;
  String? userName;
  dynamic primary;

  Response({
    this.accessToken,
    this.tokenType,
    this.refreshToken,
    this.expiresIn,
    this.scope,
    this.userRole,
    this.tenantName,
    this.userType,
    this.userId,
    this.userName,
    this.primary,
  });

  Response copyWith({
    String? accessToken,
    String? tokenType,
    String? refreshToken,
    int? expiresIn,
    String? scope,
    List<dynamic>? userRole,
    String? tenantName,
    String? userType,
    String? userId,
    String? userName,
    dynamic primary,
  }) =>
      Response(
        accessToken: accessToken ?? this.accessToken,
        tokenType: tokenType ?? this.tokenType,
        refreshToken: refreshToken ?? this.refreshToken,
        expiresIn: expiresIn ?? this.expiresIn,
        scope: scope ?? this.scope,
        userRole: userRole ?? this.userRole,
        tenantName: tenantName ?? this.tenantName,
        userType: userType ?? this.userType,
        userId: userId ?? this.userId,
        userName: userName ?? this.userName,
        primary: primary ?? this.primary,
      );

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        refreshToken: json["refresh_token"],
        expiresIn: json["expires_in"],
        scope: json["scope"],
        userRole: json["user_role"] == null
            ? []
            : List<dynamic>.from(json["user_role"]!.map((x) => x)),
        tenantName: json["tenant_name"],
        userType: json["user_type"],
        userId: json["user_id"],
        userName: json["user_name"],
        primary: json["primary"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "refresh_token": refreshToken,
        "expires_in": expiresIn,
        "scope": scope,
        "user_role":
            userRole == null ? [] : List<dynamic>.from(userRole!.map((x) => x)),
        "tenant_name": tenantName,
        "user_type": userType,
        "user_id": userId,
        "user_name": userName,
        "primary": primary,
      };
}

class Status {
  int? code;
  dynamic message;

  Status({
    this.code,
    this.message,
  });

  Status copyWith({
    int? code,
    dynamic message,
  }) =>
      Status(
        code: code ?? this.code,
        message: message ?? this.message,
      );

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
