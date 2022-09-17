import 'package:task/model/success_model.dart';

abstract class CodeStates{}

class CodeInitState extends CodeStates{}

class CodeEmailLoadingState extends CodeStates{}

class CodeEmailSuccessState extends CodeStates{
SuccessModel successModel;

CodeEmailSuccessState(this.successModel);
}

class CodeEmailErrorState extends CodeStates{
final String error;

  CodeEmailErrorState(this.error);

}


class CodePhoneLoadingState extends CodeStates{}

class CodePhoneSuccessState extends CodeStates{
SuccessModel successModel;

CodePhoneSuccessState(this.successModel);
}

class CodePhoneErrorState extends CodeStates{
final String error;

  CodePhoneErrorState(this.error);

}

