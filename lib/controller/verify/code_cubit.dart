import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/constants/shared/remote/dio_helper.dart';
import 'package:task/constants/shared/remote/end_points.dart';
import 'package:task/controller/verify/code_states.dart';
import '../../model/success_model.dart';

class CodeCubit extends Cubit<CodeStates>{

  CodeCubit() : super(CodeInitState());

  static CodeCubit get(context) => BlocProvider.of(context);
  
    SuccessModel? successModel;

    userCodeEmail({
    required String email,
    required String? code,
    required String? type
})
   async {
     emit(CodeEmailLoadingState());
     DioHelper.postData(url: CODE, data: {
      'phone_or_email':email,
      'code':code,
      'type':type,
    },).then((value)  {
      successModel = SuccessModel.fromJson(value!.data);
      emit(CodeEmailSuccessState(successModel!));
    }).catchError((error){
      if(error is DioError){

      print(error.response!.data['message'],);
      emit(CodeEmailErrorState(error.response!.data['message']));
      }
    });




  }


  


}