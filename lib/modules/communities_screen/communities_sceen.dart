import 'package:dev_space/modules/communities_screen/communities_cubit.dart';
import 'package:dev_space/modules/communities_screen/communities_details.dart';
import 'package:dev_space/shared/components/components.dart';
import 'package:dev_space/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class CommunitiesScreen extends StatelessWidget {
  const CommunitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommunitiesCubit()..getCommuites(),
      child: BlocConsumer<CommunitiesCubit, CommunitiesState>(
        listener: (context, state) {
          if(state is CommunitiesErrorState){
            showScaffoldSnackBar(title: state.error, context: context);
          }
        },
        builder: (context, state) {
          var cubit =CommunitiesCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Communities',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              backgroundColor: Constants.color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
            ),
            body: RefreshIndicator(
              onRefresh: ()async
              {
                await context.read<CommunitiesCubit>().getCommuites();
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                    children: [
                      if(state is GetCommunitiesLoadingState)
                        Expanded(
                          child: ListView.builder(
                            itemCount: 4,
                            itemBuilder:(context,index)=>Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple.shade100.withOpacity(.6),
                                      borderRadius: BorderRadius.circular(10.0)
                                  ),
                                  child: Shimmer(
                                    color: Colors.deepPurple.shade200.withOpacity(.3),
                                    duration: const Duration(milliseconds: 1000),
                                    child: Container(),
                                  ),
                                )
                            ),
                          ),
                        ),
                    if(state is GetCommunitiesLoadedState)
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context,index)=>const SizedBox(height: 10.0,),
                        itemCount: state.communities.data.length,
                        itemBuilder:(context,index)=> Container(
                          decoration: BoxDecoration(
                              color: Constants.color,
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: MaterialButton(
                            onPressed:()
                            {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context)=>
                                      CommunitiesDetailsScreen(id: state.communities.data[index].id),
                                  ),
                              );
                            },
                            child:  Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                fit: FlexFit.loose,
                                child: Text(
                                  state.communities.data[index].name,
                                  style:const TextStyle(
                                    color:Colors.white,
                                    fontSize:20,
                                    fontWeight:FontWeight.bold,
                                  ) ,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional.bottomEnd,
                                  child: Text(
                                      'Subscriber counts : ${state.communities.data[index].subscriberCounts}',
                                    style:const TextStyle(
                                      color:Colors.white,
                                      fontWeight:FontWeight.bold,
                                    ) ,
                                  )
                              )
                            ],
                          ),
                          ),
                        ),
                      ),
                    ),
                ],
                ),
              ),
            ),
          );

        },
      ),
    );
  }
}
