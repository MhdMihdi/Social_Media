import 'package:flutter_bloc/flutter_bloc.dart';


part 'dev_state.dart';


class DevCubit extends Cubit<DevState>
{
  DevCubit() : super(DevInitialState());

  static DevCubit get(context) => BlocProvider.of(context);
}
