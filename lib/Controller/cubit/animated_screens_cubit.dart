import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


class AnimatedScreensCubit extends Cubit<bool> {
  AnimatedScreensCubit(bool initialState) : super(initialState);

  getLoginScreen({required myState}){

    emit(myState);
  }



}
