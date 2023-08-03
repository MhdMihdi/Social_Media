import 'package:dev_space/shared/components/constants.dart';

import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
          onPressed:(){},
          child: const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius:40,
                  backgroundImage:AssetImage(
                    '',
                  ),

                ),
              ),
              Expanded(
                child: Text(
                  'You Were Mentioned By Mohamed Khair In A Comment In Tecno .'
                  ,
                  style:TextStyle(
                    color:Constants.color,
                    fontSize:20,

                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height:20,
        ),
        MaterialButton(
          onPressed:(){},
          child: const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius:40,
                  backgroundImage:AssetImage(
                    '',
                  ),

                ),
              ),
              Expanded(
                child: Text(
                  'Farah Alazzam And 9 Others Recently Interacted With Your Post On Smile.'
                  ,
                  style:TextStyle(
                    color:Constants.color,
                    fontSize:20,

                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height:20,
        ),
        MaterialButton(
          onPressed:(){},
          child: const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius:40,
                  backgroundImage:AssetImage(
                    '',
                  ),

                ),
              ),
              Expanded(
                child: Text(
                  'A Post Of Yours In The Laptop Group Got Liked By Yasser And 2 Other .'
                  ,
                  style:TextStyle(
                    color:Constants.color,
                    fontSize:20,

                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height:20,
        ),
        MaterialButton(
          onPressed:(){},
          child: const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius:40,
                  backgroundImage:AssetImage(
                    '',
                  ),

                ),
              ),
              Expanded(
                child: Text(
                  'People Talk About Your Shopping post .'
                  ,
                  style:TextStyle(
                    color:Constants.color,
                    fontSize:20,

                  ),
                ),
              ),
            ],
          ),
        ),

      ],
    );

  }
}
