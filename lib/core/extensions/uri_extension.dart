extension UriExtension on Uri {
  /// Returns new Uri with added segments at the end in the given order
  Uri withSegments(List<String> segments) {
    return copyWith(pathSegments: [...pathSegments, ...segments]);
  }

  Uri copyWith({
    String? scheme,
    String? userInfo,
    String? host,
    int? port,
    Iterable<String>? pathSegments,
    Map<String, dynamic>? queryParameters,
    String? fragment,
  }) {
    return Uri(
      scheme: scheme ?? this.scheme,
      userInfo: userInfo ?? this.userInfo,
      host: host ?? this.host,
      port: port ?? this.port,
      pathSegments: pathSegments ?? this.pathSegments,
      queryParameters: queryParameters ?? this.queryParameters,
      fragment: fragment ?? this.fragment,
    );
  }
}
