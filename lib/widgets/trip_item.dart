import 'package:apptravel/models/trip.dart';
import 'package:apptravel/screens/trip_detail_screen.dart';
import 'package:flutter/material.dart';

class TripItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final TripType tripType;
  final Season season;
 // final Function removeItem;

  TripItem(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.tripType,
      required this.season,
      //required this.removeItem
  }
   );

  String get seasonText {
    if (season == Season.Winter) {
      return "شتاء";
    }
    if (season == Season.Summer) {
      return "صيف";
    }
    if (season == Season.Spring) {
      return "ربيع";
    }
    if (season == Season.Autumn) {
      return "خريف";
    }
    return "غير معروف";
  }

  String get tripText {
    if (tripType == TripType.Exploration) {
      return "استكشاف";
    }
    if (tripType == TripType.Activities) {
      return "أنشطة";
    }
    if (tripType == TripType.Recovery) {
      return "نقاهة";
    }
    if (tripType == TripType.Therapy) {
      return "علاجية";
    }
    return "غير معروف";
  }

  void selectTrip(BuildContext ct) {
    Navigator.of(ct).pushNamed(TripDetailScreen.routeName, arguments: id).then((value) {
      if(value !=null) {
      //  removeItem(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectTrip(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 7,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 250,
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Colors.black.withOpacity(0),
                      Colors.black.withOpacity(0.8),
                    ], stops: [
                      0.6,
                      1
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headline6,
                    overflow: TextOverflow.fade,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildRowData(Icons.today, "$duration أيام ", context),
                  buildRowData(Icons.wb_sunny, seasonText, context),
                  buildRowData(Icons.family_restroom, tripText, context)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildRowData(IconData data, String text, BuildContext ctx) {
    return Row(
      children: [
        Icon(
          data,
          color: Theme.of(ctx).accentColor,
        ),
        SizedBox(
          width: 6,
        ),
        Text(text),
      ],
    );
  }
}
