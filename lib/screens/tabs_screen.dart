import 'package:apptravel/models/trip.dart';
import 'package:apptravel/screens/categories_screen.dart';
import 'package:apptravel/screens/favourites_screen.dart';
import 'package:apptravel/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
class TabsScreen extends StatefulWidget {

  List<Trip> favouriteTrips ;
  TabsScreen(this.favouriteTrips);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  void selectedScreen(int index){
  setState(() {
    selectedIndex =index;
  });

  }
  int selectedIndex=0;
  late final List<Map<String,dynamic>> screenList ;
  @override
  void initState() {
    // TODO: implement initState
    screenList = [
      {
        "screen":CategoriesScreen(),
        "title":"تصنيف الرحلات"
      },
      {
        "screen":FavouritesScreen(widget.favouriteTrips),
        "title":"الرحلات المفضلة"
      }
    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        centerTitle: true ,
        title: Text(screenList[selectedIndex]["title"]),
        ),
      drawer: AppDrawer(),
      body: screenList[selectedIndex]["screen"],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap:selectedScreen ,
        backgroundColor: Theme.of(context).primaryColor,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.dashboard),
              label: "التصنيفات" ,
            ),
            BottomNavigationBarItem(icon: Icon(Icons.star),
              label:" المفضلة" ,
            ),

      ]),

    );
  }
}

/* class TabsScreen extends StatelessWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child: Scaffold(
      appBar: AppBar(
        centerTitle: true ,
        title: Text("دليل سياحي"),
        bottom: TabBar(tabs: [
          Tab(
            icon: Icon(Icons.dashboard),
            text: "التصنيفات",
          ),
          Tab(
            icon: Icon(Icons.star),
            text: "المفضلة",
          ),
        ]),
      ),
      body: TabBarView(children: [
        CategoriesScreen(),
        FavouritesScreen(),

      ]),

    )
    );
  }
}
*/