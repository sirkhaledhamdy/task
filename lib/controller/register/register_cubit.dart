import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/constants/constants.dart';
import 'package:task/constants/shared/remote/dio_helper.dart';
import 'package:task/constants/shared/remote/end_points.dart';
import 'package:task/controller/register/register_states.dart';
import 'package:task/model/register_model.dart';


class RegisterCubit extends Cubit<RegisterStates>{

  RegisterCubit() : super(RegisterInitState());

  static RegisterCubit get(context) => BlocProvider.of(context);
  


  RegisterModel? registerModel;
  userRegister({
    required String email,
    required String password,
    required String confirm_password,
    required String name,
    required String phone,

  })
  async {
    emit(RegisterLoadingState());
     DioHelper.postData(url: SIGNUP, data: {
      'email':email,
      'password':password,
      'confirm_password':confirm_password,
      'name' : name,
      'phone':phone,
      'token_firebase':getRandomString(10),
      'device_id':getRandomString(10),


    },).then((value)  {
      registerModel = RegisterModel.fromJson(value!.data);

      emit(RegisterSuccessState(registerModel!));
    }).catchError((error){
      if(error is DioError){

        print(error.response!.data['message'],);
        emit(RegisterErrorState(error.response!.data['message']));
      }
    });
  }
}