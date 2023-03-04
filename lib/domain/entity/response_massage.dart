class ResponseMassageEntity {
  final String massage;
  const ResponseMassageEntity({
    required this.massage,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ResponseMassageEntity && other.massage == massage;
  }

  @override
  int get hashCode => massage.hashCode;
}
