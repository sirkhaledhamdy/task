import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/constants/shared/remote/dio_helper.dart';
import 'package:task/constants/shared/remote/end_points.dart';
import 'package:task/controller/verify/verify_states.dart';
import 'package:task/model/verification_model.dart';

import '../../constants/constants.dart';

class VerifyCubit extends Cubit<VerifyStates>{

  VerifyCubit() : super(VerifyInitState());

  static VerifyCubit get(context) => BlocProvider.of(context);
  
    VerificationModel? verificationModel;

    userVerifyEmail({
    required String email,
})
   async {
     emit(VerifyEmailLoadingState());
     DioHelper.postData(url: VERIFY, data: {
      'email':email,
      'type':'email',
      'token_firebase':getRandomString(10),
      'device_id':getRandomString(10),
    },).then((value)  {
      verificationModel = VerificationModel.fromJson(value!.data);
      emit(VerifyEmailSuccessState(verificationModel!));
    }).catchError((error){
      if(error is DioError){

      print(error.response!.data['message'],);
      emit(VerifyEmailErrorState(error.response!.data['message']));
      }
    });
  }

  userVerifyPhone({
    required String phone,
})
   async {
     emit(VerifyPhoneLoadingState());
     DioHelper.postData(url: VERIFY, data: {
      'phone':phone,
      'type':'phone',
      'token_firebase':getRandomString(10),
      'device_id':getRandomString(10),
    },).then((value)  {
      verificationModel = VerificationModel.fromJson(value!.data);
      emit(VerifyPhoneSuccessState(verificationModel!));
    }).catchError((error){
      if(error is DioError){

      print(error.response!.data['message'],);
      emit(VerifyPhoneErrorState(error.response!.data['message']));
      }
    });
  }


}