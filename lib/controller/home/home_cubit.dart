import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/constants/shared/remote/dio_helper.dart';
import 'package:task/constants/shared/remote/end_points.dart';
import 'package:task/controller/home/home_states.dart';
import 'package:task/model/service_model.dart';

class HomeCubit extends Cubit<HomeStates>{

  HomeCubit() : super(HomeInitState());

  static HomeCubit get(context) => BlocProvider.of(context);
  
    ServiceModel? serviceModel;

    getServices() async {
    emit(HomeLoadingState());
    await DioHelper.getData(
      url: SERVICE,
    ).then((value) {
      serviceModel = ServiceModel.fromJson(value!.data);
      print(serviceModel!.data[0].id);
      emit(HomeSuccessState(serviceModel!));
    }).catchError((error) {
      print(error.toString());
      if (error is DioError) {
        print(error.toString());
        emit(HomeErrorState(error.response!.data['message']));
      }
    });
  }

}