class TajwidRule {
  final String title;
  final String description;
  final List<String> examples;
  final String nadhom;
  final String nadhomMeaning;

  TajwidRule({
    required this.title,
    required this.description,
    required this.examples,
    required this.nadhom,
    required this.nadhomMeaning,
  });

  factory TajwidRule.fromJson(Map<String, dynamic> json) {
    return TajwidRule(
      title: json['title'],
      description: json['description'],
      examples: List<String>.from(json['examples']),
      nadhom: json['nadhom'],
      nadhomMeaning: json['nadhomMeaning'],
    );
  }
}
