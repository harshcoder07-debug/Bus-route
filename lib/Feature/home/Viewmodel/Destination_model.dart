class DestinationModel {
  List<DestinationModel> destination = [];
  final String name;
  final String description;
  final String image;
  final double rating;
  final String distance;

  DestinationModel({
    required this.name,
    required this.description,
    required this.image,
    required this.rating,
    required this.distance,
  });
}
