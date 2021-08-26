
import 'package:apptravel/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {


  static const routeName = "/filtersScreen";

  final Function saveFilters;
  final Map<String,bool>currentFilters;

   FiltersScreen(this.currentFilters,this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  bool summer = false;
  bool winter = false;
  bool family = false;
  @override
  void initState() {
    // TODO: implement initState
    summer = widget.currentFilters["summer"] as bool;
    winter = widget.currentFilters["winter"] as bool;
    family = widget.currentFilters["family"] as bool;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: Text("الفلترة"),
          actions: [
            IconButton(onPressed:(){
              final selectedFilters = {
                "summer": summer,
                "winter": winter,
                "family": family
              };
              widget.saveFilters(selectedFilters);}, icon: Icon(Icons.save))
          ],
        ),
        body: Column(
          children: [
            Expanded(child: ListView(
              children: [
                SizedBox(height: 50,),
                buildSwitchListTile(
                  "الرحلات الصيفية", "إظهار الرحلات في فصل الصيف فقط ",
                  summer, (newValue) {
                  setState(() {
                    summer = newValue;
                  });
                },
                ),
                buildSwitchListTile(
                  "الرحلات الشتوية", "إظهار الرحلات في فصل الشتاء فقط ",
                  winter, (newValue) {
                  setState(() {
                    winter = newValue;
                  });
                },
                ),
                buildSwitchListTile(
                  "الرحلات العائلية", "إظهار الرحلات للعائلات فقط ",
                  family, (newValue) {
                  setState(() {
                    family = newValue;
                  });
                },
                ),

              ],
            ),
            )
          ],
        )
    );
  }

  SwitchListTile buildSwitchListTile(String title, String subtitle, bool value,
      Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
      onChanged:(value)=> updateValue(value),
    );
  }

}