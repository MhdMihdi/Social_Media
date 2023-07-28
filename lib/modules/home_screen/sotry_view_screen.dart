
import 'package:dev_space/database/models/home_models/story_model.dart';
import 'package:dev_space/shared/components/components.dart';
import 'package:dev_space/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:story/story_page_view.dart';

class StoryViewScreen extends StatelessWidget {
  const StoryViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        StoryPageView(

          itemBuilder: (context, pageIndex, storyIndex) {
            var user = dataUsers[pageIndex];
            var story = user.stories[storyIndex];
            return Stack(
              children: [

                Positioned.fill(
                    child: Container(
                      color: Constants.color,
                    )
                ),
                Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: NetworkImage(story.imageUrl),
                          )
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 42.0,left: 16),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(user.profileUrl)
                            )
                        ),
                      ),
                      const SizedBox(width: 14),
                      Text(
                        user.name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 16
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 40,
                  left:20,
                  child: Row(
                    children:
                    [
                      MyButton(
                        onPressed: (){},
                        title: 'Like',
                        titleColor: Colors.white,
                        titleSize: 20.0,
                        side: Constants.color,
                        width: 80,

                      ),
                      Container(
                        width:1 ,
                        height: 10,
                        color: Colors.white,
                      ),
                      MyButton(
                        onPressed: (){},
                        title: 'DisLike',
                        titleColor: Colors.white,
                        titleSize: 20.0,
                        side: Constants.color,
                        width: 100,
                      ),
                      MyButton(
                        onPressed: (){},
                        title: 'Comment',
                        titleColor: Colors.white,
                        titleSize: 20.0,
                        side: Constants.color,

                      ),

                    ],
                  ),
                ),
              ],
            );
          },
          pageLength: dataUsers.length,
          storyLength: (pageIndex) => dataUsers[pageIndex].stories.length,
        ));
  }
}