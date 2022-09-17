import 'package:task/model/verification_model.dart';

abstract class VerifyStates{}

class VerifyInitState extends VerifyStates{}

class VerifyEmailLoadingState extends VerifyStates{}

class VerifyEmailSuccessState extends VerifyStates{
VerificationModel verificationModel;

VerifyEmailSuccessState(this.verificationModel);
}

class VerifyEmailErrorState extends VerifyStates{
final String error;

  VerifyEmailErrorState(this.error);

}


class VerifyPhoneLoadingState extends VerifyStates{}

class VerifyPhoneSuccessState extends VerifyStates{
VerificationModel verificationModel;

VerifyPhoneSuccessState(this.verificationModel);
}

class VerifyPhoneErrorState extends VerifyStates{
final String error;

  VerifyPhoneErrorState(this.error);

}

