import 'package:task/model/service_model.dart';

abstract class HomeStates{}

class HomeInitState extends HomeStates{}

class HomeLoadingState extends HomeStates{}

class HomeSuccessState extends HomeStates{
  final ServiceModel serviceModel ;

  HomeSuccessState(this.serviceModel);
}

class HomeErrorState extends HomeStates{
final String error;

  HomeErrorState(this.error);

}

