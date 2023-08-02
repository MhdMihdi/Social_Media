import 'package:dev_space/database/models/home_models/story_model.dart';
import 'package:dev_space/layout/cubit/dev_cubit.dart';
import 'package:dev_space/shared/components/components.dart';
import 'package:dev_space/shared/components/constants.dart';
import 'package:dev_space/shared/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<DevCubit, DevState>(
      listener: (context, state) {},
      builder: (context, state) {
       return Scaffold(
          appBar:AppBar(
            backgroundColor:Constants.color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0)
            ),
            title:const Text(
              'DevSpace',
              style:TextStyle(
                fontSize:30,
                color:Colors.white,
                fontWeight:FontWeight.bold,
              ),
            ),
            actions:
            [
              IconButton(
                onPressed: (){},
                icon:const Icon(
                    Icons.search
                ),
                color:Colors.white,
                iconSize:30,
              ),
            ],
          ),
          body:SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
            children:
              [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:
                    [
                      IconButton(
                        onPressed: (){},
                        color: Constants.color,
                        icon:const Icon(Icons.account_circle_outlined),
                        iconSize:45,
                      ),
                      Expanded(
                        child: MyFormField(
                          label:'Whats on your mind ? ',
                          padding: const EdgeInsets.all(10.0),
                          radius: 70.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height:10 ,
                  color: Colors.deepPurple.shade200,
                ),
                //add story & story view
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      MaterialButton(
                        onPressed:()
                        {
                          Navigator.pushNamed(
                            context,
                            NamedRoutes.storyAddScreen,
                          );
                        },
                        child: const CircleAvatar(
                          radius: 30.0,
                          backgroundColor: Constants.color,
                           child: Icon(
                             Icons.add,
                             color: Colors.white,
                             size: 30.0,
                             ),
                           ),
                        ),
                      Expanded(
                        child: SizedBox(
                          height: 90.0,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context,index)=> MaterialButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context,
                                      NamedRoutes.storyViewScreen
                                  );
                                },
                                child:  CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(
                                   dataUsers[index].profileUrl
                                  ),
                                ),
                              ),
                              itemCount: dataUsers.length,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height:10 ,
                  color: Colors.deepPurple.shade200,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                //post
                Post(),
                const SizedBox(
                  height: 10.0,
                ),
                //shared post
                Container(
                  width: 350,
                  height:390,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Constants.color,
                  ),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                          [
                            const CircleAvatar(
                              //backgroundImage: ,
                              radius: 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                              [
                                Text(
                                  'dasdkasl is shared a post',
                                  style: TextStyle(
                                    color: Colors.white,

                                  ),
                                ),
                                Text(
                                  '14 minutes ago',
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),

                              ],
                            ),
                            const SizedBox(
                          width: 80.0,
                        ),
                            InkWell(
                              onTap: (){},
                              splashColor: Colors.white,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical:  8.0
                                ),
                                child: Row(
                                  //crossAxisAlignment: CrossAxisAlignment.start,
                                  children:
                                  [
                                    CircleAvatar(
                                      radius: 4,
                                    ),
                                    SizedBox(
                                      width:1 ,
                                    ),
                                    CircleAvatar(
                                      radius: 4,
                                    ),
                                    SizedBox(
                                      width:1 ,
                                    ),
                                    CircleAvatar(
                                      radius: 4,
                                    ),
                                  ],
                                ),
                              )
                            ),

                        ]
                        )
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0
                        ),
                        child: Divider(
                          height: 1,
                          color: Colors.white,
                        ),
                      ),
                      InkWell(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    //backgroundImage: ,
                                    radius: 20,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Mohammad Mihdi',
                                        style: TextStyle(
                                            color: Colors.white
                                        ),
                                      ),
                                      Text(
                                        '14 minutes ago',
                                        style: TextStyle(
                                            color: Colors.white
                                        ),
                                      ),

                                    ],
                                  ),

                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Flexible(
                              child:  Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:   8.0
                                ),
                                child: Text(
                                  'On Fire',
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 350,
                              height: 150,
                              child: Stack(
                                children:[
                                  PageView(

                                      onPageChanged: (index)
                                      {
                                        setState(() {
                                          currentPage = index;
                                        });
                                      },
                                      children:media
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 30,
                                        height: 20,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20.0),
                                          color: Colors.black54,
                                        ),
                                        child: Text(
                                          '${currentPage+1}/${media.length}',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 8.0
                        ),
                        child: Divider(
                          height: 1,
                          color: Colors.white,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.0,
                        ),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children:
                          [
                            Text(
                              '55 Likes',
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              '55 DisLikes',
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyButton(
                            onPressed: (){},
                            title: 'Like',
                            titleColor: Colors.white,
                            side: Constants.color,
                            width: 60,
                          ),
                          Container(
                            width:2 ,
                            height: 10,
                            color: Colors.white,
                          ),
                          MyButton(
                            onPressed: (){},
                            title: 'DisLike',
                            titleColor: Colors.white,
                            side: Constants.color,
                            width: 80,
                          ),
                          MyButton(
                            onPressed: (){},
                            title: 'Comment',
                            titleColor: Colors.white,
                            side: Constants.color,
                            width: 95,
                          ),
                          MyButton(
                            onPressed: (){},
                            title: 'Share',
                            titleColor: Colors.white,
                            side: Constants.color,
                            width: 95,
                          ),
                        ],
                      ),
                    ]
                  )
                ),
              ]
            )
          )
       );
  },
);
  }
}

