import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notebook_app/provider/notebook_provider.dart';
import 'package:notebook_app/screens/add_note.dart';
import 'package:notebook_app/screens/drawer_page.dart';
import 'package:notebook_app/utils/app_name.dart';
import 'package:provider/provider.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}




class _HomePageState extends State<HomePage> {
  String? greetings;




  @override
  void initState() {
    super.initState();
    NoteBookProvider noteBookProvider = Provider.of<NoteBookProvider>(context,listen:false);
    noteBookProvider.getNoteList();
    timeNow();
  }





  void timeNow(){
    dynamic timeOfNow = DateTime.now().hour;
    print(timeOfNow);
    if(timeOfNow >=0 && timeOfNow<=6){
      greetings = "Good Night";
    }
    else if(timeOfNow>6 &&timeOfNow<12)
    {
      greetings = "Good Morning";
    }
    else if(timeOfNow>=12 &&timeOfNow<=15)
    {
      greetings = "Good Noon";
    }
    else if(timeOfNow>15 &&timeOfNow<18)
    {
      greetings = "Good Afternoon";
    }
    else {
      greetings = "Good Evening";
    }
  }




  @override
  Widget build(BuildContext context) {
    return Consumer<NoteBookProvider>(
        builder: (_,provider,___) {
          return Scaffold(
            floatingActionButton: Container(
              margin: EdgeInsets.only(right:20,bottom: 20),
              child:FloatingActionButton(
                backgroundColor: Colors.blue,
                onPressed: () async {
                  // bool isAdded = await Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) {
                  //       return AddNote();
                  //     }
                  //     )
                  // );
                  // if (isAdded == true) {
                  //   provider.getNoteList();
                  // }
                },
                child: Icon(FontAwesomeIcons.plus),
              ),
            ),
            drawer: DrawerPage(),
            appBar: AppBar(
              toolbarHeight: 60,
              title: AppName(),
              centerTitle: true,
            ),

            body: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Icon(
                      FontAwesomeIcons.book,
                      size:30 ,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text.rich(
                      TextSpan(
                          children: [
                            TextSpan(
                              text: "Hi, ",
                              style: TextStyle(
                                fontSize:20,
                              ),
                            ),
                            TextSpan(
                              text: "Fahim Ahmed ",
                              style: TextStyle(
                                fontSize:20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]
                      ),
                    ),
                    SizedBox(
                      height:8,
                    ),
                    greetings != null ?
                    Text("$greetings!!",
                      style: TextStyle(
                        fontSize: 15,

                      ),
                    ):Text(""),
                    SizedBox(
                      height:10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                        onChanged: (value) {

                        },
                        decoration: const InputDecoration(
                          labelText: 'search by title...',
                          prefixIcon: Icon(Icons.search),
                          fillColor: Colors.white30,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueAccent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),

                          contentPadding: EdgeInsets.only(
                              bottom: 10.0, left: 10.0, right: 10.0),
                        ),


                      ),
                    ),


                    provider.notebooklist.isEmpty? Center(child: Text("No Data Available, Add For Yourself"),
                    ):
                    ListView.separated(
                        itemCount: provider.notebooklist.length,
                        separatorBuilder: (context,index)=>
                            SizedBox(
                              height:5,
                            ),
                        shrinkWrap: true,
                        physics:  NeverScrollableScrollPhysics(),
                        itemBuilder: (context,index){
                          return Container(
                            margin: const EdgeInsets.only(
                                left: 20.0, right: 20),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.blue,
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: <Widget>[
                                      Text(
                                        provider.noteBook.title!,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        provider.noteBook.content!,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        provider.noteBook.date!,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  PopupMenuButton(
                                    icon: Icon(Icons.more_vert),
                                    onSelected: (value) {},
                                    itemBuilder: (BuildContext context) =>
                                    [
                                      const PopupMenuItem(
                                          value: 'update',
                                          child: ListTile(
                                              leading: Icon(Icons.edit),
                                              title: Text('Update')
                                          )
                                      ),
                                      const PopupMenuItem(
                                          value: 'delete',
                                          child: ListTile(
                                              leading: Icon(Icons.delete),
                                              title: Text('Delete')
                                          )
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        }
                    ),

                  ],
                ),
              ),
            ),


          );
        }
    );

  }
}

