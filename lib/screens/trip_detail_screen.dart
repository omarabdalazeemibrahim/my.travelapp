import 'package:apptravel/app_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TripDetailScreen extends StatelessWidget {
  static const routeName = "/trip_detail_screen";

  final Function manageFavourite;
  final Function isFavourite;

  TripDetailScreen(this.isFavourite,this.manageFavourite
  );

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedTrip =
        Trips_data.firstWhere((element) => element.id == tripId);

    return Scaffold(
      appBar: AppBar(
        title: Text("${selectedTrip.title}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  gradient: LinearGradient(colors: [
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(0.8),
                  ], stops: [
                    0.6,
                    1
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              height: 300,
              width: double.infinity,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  child: Image.network(
                    selectedTrip.imageUrl,
                    height: 300,
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            buildContainer(context, "الأنشطة"),
            buildContainer2(
              ListView.builder(
                  itemCount: selectedTrip.activities.length,
                  itemBuilder: (ctx, item) {
                    return Card(
                      elevation: 0.5,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: Text(selectedTrip.activities[item])),
                    );
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            buildContainer(context, "البرنامج اليومي"),
            buildContainer2(ListView.builder(
                itemCount: selectedTrip.program.length,
                itemBuilder: (ctx1, item1) => Column(children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text(" يوم ${item1 + 1}"),
                          radius: 30,
                        ),
                        title: Text(selectedTrip.program[item1]),
                      ),
                      Divider()
                    ]))),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
     floatingActionButton: FloatingActionButton(
          child: Icon(isFavourite(tripId)?Icons.star:Icons.star_border),
         onPressed:()=>manageFavourite(tripId)
   ),
    );
  }

  Container buildContainer(BuildContext context, String title) {
    return Container(
      alignment: Alignment.topRight,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}

Container buildContainer2(Widget child) {
  return Container(
    height: 200,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(10),
    ),
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.symmetric(horizontal: 15),
    child: child,
  );
}
