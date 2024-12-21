import 'package:dev_space/modules/search/search_cubit.dart';
import 'package:dev_space/shared/components/components.dart';
import 'package:dev_space/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class SearchScreen extends StatelessWidget {

  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit=SearchCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(
                    Icons.arrow_back_ios
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: MyFormField(
                controller: cubit.controller,
                hint: 'Search',
                padding: const EdgeInsets.all(15.0),
              ),
              actions:
              [
                IconButton(
                    onPressed: (){
                      cubit.getSearch(search: cubit.controller.text);
                    },
                    icon: const Icon(Icons.search)
                )
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children:
                [
                  if(state is SearchLoading)
                      ListView.builder(
                        itemCount: 4,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
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
                  if(state is SearchLoaded)
                  Row(
                         children:
                         [
                           if(state.model.data.image == null)
                             const CircleAvatar(
                               radius: 30,
                               //backgroundImage: ,
                             ),
                           if(state.model.data.image != null)
                           CircleAvatar(
                             radius: 30.0,
                             backgroundImage:NetworkImage(
                                 state.model.data.image!.contains('storage')
                                     ? Constants.IP +state.model.data.image!.substring(
                                     state.model.data.image!
                                         .indexOf('storage'))
                                     : Constants.IP+ state.model.data.image!.substring(
                                     state.model.data.image!
                                         .indexOf('media'))
                             ) ,
                           ),
                           Text(
                               state.model.data.name
                           )
                         ],
                       )


                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
