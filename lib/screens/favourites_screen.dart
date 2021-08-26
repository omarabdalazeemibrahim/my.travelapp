import 'package:apptravel/models/trip.dart';
import 'package:apptravel/widgets/trip_item.dart';
import 'package:flutter/material.dart';

class FavouritesScreen extends StatelessWidget {
  List<Trip> favouriteTrips;

  FavouritesScreen(this.favouriteTrips);

  @override
  Widget build(BuildContext context) {
    body:
    if (favouriteTrips.isEmpty) {
      return Center(
        child: Text("المفضلة"),
      );
    } else {
      return ListView.builder(
          itemCount: favouriteTrips.length,
          itemBuilder: (context, item) {
            return TripItem(
              id: favouriteTrips[item].id,
              title: favouriteTrips[item].title,
              imageUrl: favouriteTrips[item].imageUrl,
              duration: favouriteTrips[item].duration,
              tripType: favouriteTrips[item].tripType,
              season: favouriteTrips[item].season, //removeItem: null,
              // removeItem: removeTrip
            );
          });
    }
  }
}
