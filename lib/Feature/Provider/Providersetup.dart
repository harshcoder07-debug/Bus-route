// lib/providers/provider_setup.dart
import 'package:busapp/Data/Repository/repository.dart' show AuthRepository;
import 'package:busapp/Feature/Auth/Viewmodel/Auth_viewmodel.dart';
import 'package:busapp/Feature/Search/viewmodel/Bus%20Search_Viewmodel.dart';
import 'package:busapp/Feature/home/Viewmodel/DestinationViewModel.dart';
import 'package:busapp/Feature/home/Viewmodel/homeviewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> buildProviders() {
  // Repositories (singletons — created once)
  final authRepo = AuthRepository();
  

  return [
    Provider.value(value: authRepo),
   

    ChangeNotifierProvider(
      create: (ctx) => AuthViewmodel(ctx.read<AuthRepository>()),
    ),
    
    ChangeNotifierProvider(
      create: (ctx) => Homeviewmodel(),
    ),
    ChangeNotifierProvider(
      create: (ctx) => DestinationViewModel(),
    ),
    ChangeNotifierProvider(
      create: (ctx) => Bussearchviewmodel(),
    ),
    
  ];
}