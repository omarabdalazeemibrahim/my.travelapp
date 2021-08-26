import 'package:apptravel/app_data.dart';
import 'package:apptravel/models/trip.dart';
import 'package:apptravel/widgets/trip_item.dart';
import 'package:flutter/material.dart';

class CategoryTripsScreen extends StatefulWidget {
  /* final String categoryID;
  final String categoryTitle;

   CategoryTripsScreen({ required this.categoryID,  required this.categoryTitle}) ;*/
  static const routingName = "/categories_tips_screen";
  List<Trip> availableTrips;
  CategoryTripsScreen(this.availableTrips);

  @override
  _CategoryTripsScreenState createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
  late String categoryTitle;
  late List<Trip> displayTrips;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    final routeArguments =
    ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String categoryId = routeArguments["id"] as String;
    categoryTitle = routeArguments["title"] as String;
    displayTrips =widget.availableTrips.where((element) {
      return element.categories.contains(categoryId);
    }).toList();

    super.didChangeDependencies();

  }
  void removeTrip(String tripId){
    setState(() {
      displayTrips.removeWhere((element) => element.id==tripId);
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
            itemCount: displayTrips.length,
            itemBuilder: (context, item) {
              return TripItem(
                  id: displayTrips[item].id,
                  title: displayTrips[item].title,
                  imageUrl: displayTrips[item].imageUrl,
                  duration: displayTrips[item].duration,
                  tripType: displayTrips[item].tripType,
                  season: displayTrips[item].season,
                  //removeItem: removeTrip
                  );
            }));
  }
}
