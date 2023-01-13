class Author {
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

  final String name;
  final int workCount;

  @override
  String toString() => 'Author(name: $name, workCount: $workCount)';
}
