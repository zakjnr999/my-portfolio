class Recommendation {
  final String? name, source, text;

  Recommendation({this.name, this.source, this.text});
}

final List<Recommendation> demo_recommendations = [
  Recommendation(
    name: "Dr. Emmanuel Mensah",
    source: "LinkedIn",
    text:
        "I had the privilege of collaborating with Muktar on the Departmental Mobile App project. His technical expertise in Flutter development and ability to translate complex requirements into intuitive user interfaces is exceptional. Muktar consistently delivers high-quality code and demonstrates strong problem-solving skills. A true professional who would be an asset to any development team.",
  ),
  Recommendation(
    name: "Sarah Osei-Tutu",
    source: "LinkedIn",
    text:
        "Working with Muktar on the GrabGo Foods platform was an outstanding experience. His full-stack capabilities, particularly with Flutter and Node.js, enabled us to build a robust and scalable food delivery system. He's not just a skilled developer but also an excellent communicator who understands business needs and delivers solutions that exceed expectations.",
  ),
  Recommendation(
    name: "Michael Adjei",
    source: "GitHub",
    text:
        "Muktar's contribution to our hostel booking project was invaluable. His attention to detail, clean code architecture, and commitment to best practices made the development process smooth and efficient. He has a rare combination of technical prowess and creative problem-solving that makes him stand out. Highly recommended for any Flutter development work.",
  ),
  Recommendation(
    name: "Jennifer Boateng",
    source: "LinkedIn",
    text:
        "I've worked with many developers, but Muktar's dedication and skill level are truly impressive. His work on the UTAG Welfare app showcased his ability to understand user needs and create meaningful solutions. He's reliable, innovative, and always goes the extra mile to ensure project success. Any team would be lucky to have him.",
  ),
];
