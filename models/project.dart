class Project {
  final String title, desc, codeLink;
  final String? liveLink;
  final List<String> tags;
  final String? imageUrl;
  final String? fullDescription;
  final List<String> features;

  const Project(
    this.title,
    this.desc,
    this.tags,
    this.codeLink, {
    this.liveLink,
    this.imageUrl,
    this.fullDescription,
    this.features = const [],
  });
}

class Experience {
  final String role, company, period;
  final List<String> points;
  const Experience(this.role, this.company, this.period, this.points);
}
