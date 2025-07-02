class AuthResponse {
  final String access;
  final String refresh;
  final String username;
  final String email;
  AuthResponse({
    required this.access,
    required this.refresh,
    required this.username,
    required this.email,
  });
  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      access: json['access'],
      refresh: json['refresh'],
      username: json['user']['username'],
      email: json['user']['email'],
    );
  }
}
