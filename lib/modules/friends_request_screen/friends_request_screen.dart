import 'package:dev_space/shared/components/constants.dart';
import 'package:flutter/material.dart';

class FriendRequestScreen extends StatelessWidget {
  const FriendRequestScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          MaterialButton(
            onPressed:(){},
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius:40,
                    backgroundImage:AssetImage(
                      '',
                    ),

                  ),
                ),
                Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ibrahim Alnaser',
                      style:TextStyle(
                        color:Constants.color,
                        fontSize:30,

                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          decoration:BoxDecoration(
                            color:Constants.color,
                            borderRadius:BorderRadius.circular(10),
                          ),
                          child: MaterialButton(onPressed: (){},
                            child: const Text(
                              'Confirm',
                              style:TextStyle(
                                color:Colors.white,
                                fontSize:15,

                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width:10,
                        ),
                        Container(
                          decoration:BoxDecoration(
                            color:Constants.color,
                            borderRadius:BorderRadius.circular(10),
                          ),
                          child: MaterialButton(onPressed: (){},
                            child: const Text(
                              'Delete',
                              style:TextStyle(
                                color:Colors.white,
                                fontSize:15,

                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height:20,
          ),
          MaterialButton(
            onPressed:(){},
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius:40,
                    backgroundImage:AssetImage(
                      '',
                    ),

                  ),
                ),
                Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Nissren Ahmed',
                      style:TextStyle(
                        color:Constants.color,
                        fontSize:30,

                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          decoration:BoxDecoration(
                            color:Constants.color,
                            borderRadius:BorderRadius.circular(10),
                          ),
                          child: MaterialButton(onPressed: (){},
                            child: const Text(
                              'Confirm',
                              style:TextStyle(
                                color:Colors.white,
                                fontSize:15,

                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width:10,
                        ),
                        Container(
                          decoration:BoxDecoration(
                            color:Constants.color,
                            borderRadius:BorderRadius.circular(10),
                          ),
                          child: MaterialButton(onPressed: (){},
                            child: const Text(
                              'Delete',
                              style:TextStyle(
                                color:Colors.white,
                                fontSize:15,

                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height:20,
          ),
          MaterialButton(
            onPressed:(){},
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius:40,
                    backgroundImage:AssetImage(
                      '',
                    ),

                  ),
                ),
                Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Leen Nasser',
                      style:TextStyle(
                        color:Constants.color,
                        fontSize:30,

                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          decoration:BoxDecoration(
                            color:Constants.color,
                            borderRadius:BorderRadius.circular(10),
                          ),
                          child: MaterialButton(onPressed: (){},
                            child: const Text(
                              'Confirm',
                              style:TextStyle(
                                color:Colors.white,
                                fontSize:15,

                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width:10,
                        ),
                        Container(
                          decoration:BoxDecoration(
                            color:Constants.color,
                            borderRadius:BorderRadius.circular(10),
                          ),
                          child: MaterialButton(onPressed: (){},
                            child: const Text(
                              'Delete',
                              style:TextStyle(
                                color:Colors.white,
                                fontSize:15,

                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height:20,
          ),
        ]
    );
  }
}

