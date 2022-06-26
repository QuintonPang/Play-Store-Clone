import 'package:flutter/material.dart';
import 'package:play_store_clone/services/app.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:play_store_clone/constants/appList.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var tabNames = {
    'For You',
    'Top charts',
    'Children',
    'Categories',
    'Editors\' Choice',
  };
  late SearchBar searchBar;
  // final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  _HomeState(){
    searchBar = SearchBar(
        inBar: false,
        setState: setState,
        onSubmitted: (searchValue){
        //   setState(() => _scaffoldKey.currentState
        // ?.showSnackBar(new SnackBar(content: new Text('You wrote !'))));
          Navigator.pushNamed(context,'/appList',arguments: searchValue);
  },
        buildDefaultAppBar: buildAppBar
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
        actions: [
          Container(
            margin:EdgeInsets.symmetric(vertical:5.0,horizontal: 5.0 ),
            width:MediaQuery.of(context).size.width-60,
            child: TextButton(
              child:Text('Search for apps & games'),
              style: TextButton.styleFrom(
                  shape: StadiumBorder(),
                  backgroundColor: Colors.blue[100]
              ),
              onPressed:(){searchBar.beginSearch(context);},
            ),
          ),
          searchBar.getSearchAction(context),
        ],
        iconTheme: IconThemeData(color:Colors.black),
        backgroundColor: Colors.white,
        bottom: TabBar(
            isScrollable:true,
            tabs:
            tabNames.map((tabName){
              return(
                  Tab(
                    child: Text(
                        tabName,
                        style:TextStyle(
                          color: Colors.grey,
                        )
                    ) ,
                  )
              );
            }).toList()
        )
    );
  }


  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Container(
        child: DefaultTabController(
          length:5,
          child: Scaffold(
            // key: _scaffoldKey,
            appBar:searchBar.build(context),
            body:TabBarView(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children:[
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            Container(
                                  width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(vertical:20.0,horizontal: 10.0 ),
                                child: Text(
                                'Based on your recent activity',
                                style:TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              )
                            ),
                           Container(
                             height:300,
                             child: ListView(
                               scrollDirection: Axis.horizontal,
                               children:recentActivities.map((activity){
                                 return InkWell(
                                   onTap:(){Navigator.pushNamed(context, '/downloadApp',arguments:App(image:activity['image']??'',name:activity['name']??'',rating:activity['rating']??'',details:activity['details']??''));},
                                   child: Container(
                                     margin: EdgeInsets.symmetric(horizontal:20,vertical:0),
                                     child: (
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children:[
                                            Image.network(activity['image']??''),
                                            Text(
                                              activity['name']??'',
                                              style: TextStyle(
                                                color: Colors.grey,
                                              ),

                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                    activity['rating']??'',
                                                  style:TextStyle(
                                                    color: Colors.grey,
                                                  )
                                                ),
                                                Icon(Icons.star),
                                              ],
                                            ),
                                          ]
                                     )
                               ),
                                   ),
                                 );
                               }).toList()
                             ),
                           ),
                          ]
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(vertical:20.0,horizontal: 10.0 ),
                                child: Text(
                                  'Recommended for you',
                                  style:TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                )
                            ),
                            Container(
                              height:300,
                              child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children:recentActivities.map((activity){
                                    return Container(
                                      margin: EdgeInsets.symmetric(horizontal:20,vertical:0),
                                      child: (
                                          Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children:[
                                                Image.network(activity['image']??''),
                                                Text(
                                                  activity['name']??'',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                  ),

                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                        activity['rating']??'',
                                                        style:TextStyle(
                                                          color: Colors.grey,
                                                        )
                                                    ),
                                                    Icon(Icons.star),
                                                  ],
                                                ),
                                              ]
                                          )
                                      ),
                                    );
                                  }).toList()
                              ),
                            ),
                          ]
                      )
                    ]
                  ),
                ),
                Column(

                ),
                Column(

                ),
                Column(

                ),
                Column(

                ),
              ]
            ),
          )
        )
      ),
    );
  }
}
