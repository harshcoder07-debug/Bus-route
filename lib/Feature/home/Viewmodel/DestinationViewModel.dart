import 'package:busapp/Feature/home/model/Destination_model.dart'
    show DestinationModel;
import 'package:flutter/material.dart';

class DestinationViewModel extends ChangeNotifier {
  final List<DestinationModel> destinations = [
    DestinationModel(
      name: 'Amritsar',
      description: '''The spiritual and cultural center of the
Sikh religion, offering tranquility and the
famous community kitchen (Langar).''',
      image: 'asset/image/golden2.png',
      rating: 4.0,
      distance: '400 Km',
    ),
    DestinationModel(
      name: ' Wagah Border',
      description: '''Experience the electrifying daily Beating Retreat
ceremony.''',
      image: 'asset/image/wagha.png',
      rating: 4.7,
      distance: '20 Km',
    ),
    DestinationModel(
      name: 'Anandpur Sahib',
      description: '''The 'Holy City of Bliss' located at the foot of the
Himalayas.''',
      image: 'asset/image/anand.png',
      rating: 4.7,
      distance: '20 Km',
    ),
    DestinationModel(
      name: 'Rock Garden',
      description: '''Nek Chand's visionary sculpture garden
made entirely from industrial and home
waste.''',
      image: 'asset/image/rock.png',
      rating: 4.7,
      distance: '20 Km',
    ),
  ];
}
