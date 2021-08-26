import 'package:apptravel/screens/filters_screen.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Theme.of(context).accentColor,
            child: Text(
              "دليلك السياحي",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(Icons.card_travel,"الرحلات",(){Navigator.of(context).pushReplacementNamed("/"); }),
          buildListTile(Icons.filter_list, "الفلترة", (){Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);})

        ],
      ),
    );
  }

  ListTile buildListTile(IconData icon , String title ,Function onItemTap) {
    return ListTile(
          leading: Icon(
            icon,
            size: 30,
            color: Colors.blue,
          ),
          title: Text(title, style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "ElMessiri",
            fontSize: 24,
          ),),
          onTap:()=> onItemTap(),
        );
  }
}
