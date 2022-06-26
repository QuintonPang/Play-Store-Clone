import 'package:flutter/material.dart';
import 'package:play_store_clone/services/app.dart';

class DownloadApp extends StatefulWidget {
  const DownloadApp({Key? key}) : super(key: key);

  @override
  State<DownloadApp> createState() => _DownloadAppState();
}

class _DownloadAppState extends State<DownloadApp> {

  @override
  Widget build(BuildContext context) {

    App app = ModalRoute.of(context)!.settings.arguments as App;
    return SafeArea(
      child:Scaffold(
        appBar:AppBar(
          iconTheme: IconThemeData(color:Colors.black),
          backgroundColor: Colors.white,
        ),
        body:SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children:[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: Image.network(
                        app.image,
                      width:50,
                      height:50
                    ),
                  ),
                  Column(
                    children:[
                      Text(
                          app.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                        ),
                      ),
                    ]
                  )
                ]
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(app.rating),
                    Icon(Icons.star),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width:MediaQuery.of(context).size.width,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:MaterialStateProperty.all(Colors.green),
                    ),
                    child:Text(
                        'Install',
                      style: TextStyle(
                          color:Colors.white
                      ),
                    ),
                    onPressed: (){},
                  ),
                ),
              ),
              Container(
                height:300,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Image.network(app.image),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                            'About this app',
                                style:TextStyle(
                                  color:Colors.black,
                                      fontSize: 20,
                                )
                        ),
                      ),
                      Text(
                        app.details,
                      )
                    ]

                  ),
                ),
              ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                 width: MediaQuery.of(context).size.width,
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children:[
                     Text('Ratings'),
                     Row(
                       children: [
                         Container(
                              width:MediaQuery.of(context).size.width/2,
                             child: Center(child: Text(app.rating))
                         ),
                         Column(
                          children:[
                            Row(children:[Text('5')]),
                            Row(children:[Text('4')]),
                            Row(children:[Text('3')]),
                            Row(children:[Text('2')]),
                            Row(children:[Text('1')]),
                          ]
                          )
                       ],
                     ),
                   ]
                 ),
               ),
             ),
            ],
          ),
        )
      )
    );
  }
}
