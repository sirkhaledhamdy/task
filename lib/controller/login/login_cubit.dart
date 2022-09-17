import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/constants/shared/remote/dio_helper.dart';
import 'package:task/constants/shared/remote/end_points.dart';
import 'package:task/model/login_model.dart';

import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates>{

  LoginCubit() : super(LoginInitState());

  static LoginCubit get(context) => BlocProvider.of(context);
  
    LoginModel? loginModel;

    userLogin({
    required String email,
    required String password,

})
   async {
     emit(LoginLoadingState());
     DioHelper.postData(url: LOGIN, data: {
      'email':email,
      'password':password,
      'token_firebase':'token',
      'device_id':'id',
    },).then((value)  {
      loginModel = LoginModel.fromJson(value!.data);
      emit(LoginSuccessState(loginModel!));
    }).catchError((error){
      if(error is DioError){

      print(error.response!.data['message'],);
      emit(LoginErrorState(error.response!.data['message']));
      }
    });
  }


}