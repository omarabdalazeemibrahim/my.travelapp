enum Season { Winter, Summer, Spring, Autumn }
enum TripType { Exploration, Recovery, Activities, Therapy }

class Trip {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final List<String> categories;
  final List<String> program;
  final List<String> activities;
  final Season season;

  final TripType tripType;
  final bool isInSummer;
  final bool isInWinter;
  final bool isForFamilies;

  const Trip(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.categories,
      required this.program,
      required this.activities,
      required this.season,
      required this.tripType,
      required this.isInSummer,
      required this.isInWinter,
      required this.isForFamilies});
}
