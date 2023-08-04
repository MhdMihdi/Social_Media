import 'package:dev_space/shared/components/constants.dart';

import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.color,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        title: const Text(
          'Notifications',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            color: Colors.white,
            iconSize: 30,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Column(
          children: [
            MaterialButton(
              onPressed: () {},
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 30,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'People Talk About Your Shopping post .',
                      style: TextStyle(
                        color: Constants.color,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(height: 10,color: Colors.deepPurple.withOpacity(.2),)
          ],
        ),
      ),
    );
  }
}
