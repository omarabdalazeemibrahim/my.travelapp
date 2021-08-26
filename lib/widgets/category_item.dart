
import 'package:apptravel/screens/categories_screen.dart';
import 'package:apptravel/screens/category_trips_screen.dart';
import 'package:flutter/material.dart';
class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

   CategoryItem({required this.id, required this.title,required this.imageUrl});

void selectCategory(BuildContext ctx){
  Navigator.of(ctx).pushNamed(CategoryTripsScreen.routingName,arguments: {
    "id":id,"title":title
  });
}
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius:  BorderRadius.circular(15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
              child: Image.network(imageUrl,height: 250,fit: BoxFit.cover,)),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black.withOpacity(0.4),
            ),
            alignment: Alignment.center,
            child: Text(title , style: Theme.of(context).textTheme.headline6,),
          )

        ],
      ),
    );
  }
}
