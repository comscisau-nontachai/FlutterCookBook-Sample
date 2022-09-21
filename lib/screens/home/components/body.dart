import 'package:flutter/material.dart';
import 'package:flutter_cookbook/screens/list_cookbook/add_drawer_navigation.dart';
import 'package:flutter_cookbook/screens/list_cookbook/animate_properties_container.dart';
import 'package:flutter_cookbook/screens/list_cookbook/animate_widget_by_physic.dart';
import 'package:flutter_cookbook/screens/list_cookbook/fade_in_out.dart';

import '../../list_cookbook/animate_page_route.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          children: [
            buildElevatedButton(context,"Animate a page route transition (page change)",const AnimatePageRoute()),
            buildElevatedButton(context,"Animate a widget using a physics (drag widget)",const AnimateWidgetByPhysics()),
            buildElevatedButton(context,"Animate the properties of a container (change shape)",const AnimatePropertiesContainer()),
            buildElevatedButton(context,"Fade a widget in and out",const FadeInAndOut()),
            buildElevatedButton(context,"Add a Drawer to a screen",const AddDrawerNav()),
          ],
        ),
      ),
    );
  }

  ElevatedButton buildElevatedButton(BuildContext context,String title,Widget page) {
    return ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => page));
        }, child: Text(title));
  }
}
