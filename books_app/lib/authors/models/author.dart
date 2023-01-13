/// A model representing authors returned from openlibrary.org api
class Author {
  /// constructor
  Author({
    required this.name,
    required this.workCount,
  });

  /// Converts [Map] to [Author]
  factory Author.fromMap(Map<String, dynamic> map) {
    return Author(
      name: map['name'] as String,
      workCount: map['work_count'] as int,
    );
  }

  /// name for [Author]
  final String name;

  /// amount of works published for [Author]
  final int workCount;

  @override
  String toString() => 'Author(name: $name, workCount: $workCount)';
}
