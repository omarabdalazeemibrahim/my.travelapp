import 'package:apptravel/app_data.dart';
import 'package:apptravel/models/trip.dart';
import 'package:apptravel/screens/categories_screen.dart';
import 'package:apptravel/screens/category_trips_screen.dart';
import 'package:apptravel/screens/filters_screen.dart';
import 'package:apptravel/screens/tabs_screen.dart';
import 'package:apptravel/screens/trip_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {

  Map<String, bool> _filters = {
    "summer": false,
    "winter": false,
    "family": false
  };
  List<Trip> _availableTrips =Trips_data;
   List<Trip> favouriteTrips=[] ;
  void _changeFilters( Map<String, bool> filterData){
       setState(() {
         _filters = filterData;
         _availableTrips = Trips_data.where((element){
           if(_filters["summer"]==true && element.isInSummer != true){
             return false;
           }
           if(_filters["winter"]==true && element.isInWinter != true){
             return false;
           }
           if(_filters["family"]==true && element.isForFamilies != true){
             return false;
           }
           return true;
         }).toList();

       });
  }





  bool isFavourite(String id) {
    return  favouriteTrips.any((favTrip) => favTrip.id == id);
  }

  void manageFavourite(String id) {
    final existIndex =  favouriteTrips.indexWhere((trip) => trip.id== id);
    if(existIndex >= 0 ) {
      setState(() {
        favouriteTrips.removeAt(existIndex);
      });
    }
    else {
      setState(() {
        favouriteTrips.add(Trips_data.firstWhere((trip) => trip.id==id));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', 'AE'),
      ],
      title: 'Travel App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.amber,
          fontFamily: 'ElMessiri',
          textTheme: ThemeData
              .light()
              .textTheme
              .copyWith(
              headline5: TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                  fontFamily: 'ElMessiri',
                  fontWeight: FontWeight.bold),
              headline6: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontFamily: 'ElMessiri',
                  fontWeight: FontWeight.bold))),
      //home: CategoriesScreen(),
      routes: {
        '/': (ctx) => TabsScreen(favouriteTrips),
        CategoryTripsScreen.routingName: (ctx) => CategoryTripsScreen(_availableTrips),
        TripDetailScreen.routeName: (ctx) => TripDetailScreen(isFavourite,manageFavourite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters,_changeFilters),
      },
    );
  }
}
