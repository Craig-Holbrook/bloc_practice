class Author {
  final String name;
  final int workCount;

  Author({
    required this.name,
    required this.workCount,
  });

  factory Author.fromMap(Map<String, dynamic> map) {
    return Author(
      name: map['name'] as String,
      workCount: map['work_count'] as int,
    );
  }

  @override
  String toString() => 'Author(name: $name, workCount: $workCount)';
}
