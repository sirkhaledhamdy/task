import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/constants/constants.dart';
import 'package:task/constants/size_extention.dart';
import 'package:task/controller/verify/verify_cubit.dart';
import 'package:task/controller/verify/verify_states.dart';
import 'package:task/view/screens/code_screen.dart';
import 'package:task/view/screens/register_screen.dart';
import 'package:task/view/styles/adaptive/adaptive.dart';
import 'package:task/view/styles/colors.dart';
import 'package:task/view/widgets/reuseable.dart';

class EmailScreen extends StatelessWidget {
  EmailScreen({super.key});
    var formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenSizes.screenWidth = size.width;
    ScreenSizes.screenHeight = size.height;

    return BlocProvider(
      create: (context) => VerifyCubit(),
      child: BlocConsumer<VerifyCubit , VerifyStates>(
        listener: (context, state) {
                    if(state is VerifyEmailSuccessState) {

                print(state.verificationModel.data.code);
                navigateAndFinish(context, CodeScreen(user: emailController.text, type: 'email',));
                showToast(text: state.verificationModel.message, state: ToastStates.success);



          } else if(state is VerifyEmailErrorState){
           showToast(text: state.error, state: ToastStates.error);
          }
        },
        builder: (context, state) {
          var cubit = VerifyCubit.get(context);
          return Scaffold(
        backgroundColor: Colors.white,
        extendBody: true,
        body: Form(
          key: formKey,
          child: SafeArea(
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/shapes/background.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Visibility(
                  visible: MediaQuery.of(context).viewInsets.bottom == 0,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Image.asset(
                      'assets/shapes/corner.png',
                    ),
                  ),
                ),
                Visibility(
                  visible: MediaQuery.of(context).viewInsets.bottom == 0,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Image.asset('assets/images/emailmarket.png'),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16.rSp, vertical: 20.rSp),
                  child: SizedBox(
                    height: 66.h,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                              '! مرحباً ${userName}',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: kText2Color,
                              fontFamily: 'Kharbet',
                              fontSize: 18.rSp,
                            ),
                          ),
                          SizedBox(
                            height: 15.rh,
                          ),
                          Text(
                            'تأكيد التسجيل بالتطبيق',
                            style: TextStyle(
                              fontFamily: 'Kharbet',
                              fontSize: 18.rSp,
                              color: kText1Color,
                            ),
                          ),
                          SizedBox(
                            height: 60.rh,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'برجاء إدخال البريد الإلكتروني لإرسال كود التحقق',
                                style: TextStyle(
                                  color: kText2Color,
                                  fontFamily: 'Kharbet',
                                  fontSize: 12.rSp,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.rh,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30.rSp),
                            child: Container(
                              height: 55.rh,
                              color: kInputFieldColor,
                              child: defaultFormField(
                                controller: emailController,
                                type: TextInputType.text,
                                  validate: (String value){
                                        if(value.isEmpty) {
                                          return 'User Must Input Data';
                                          }
                                          return null;
                                  },
                                suffix: Icon(
                                  Icons.mail_outline,
                                  size: 20.rSp,
                                  color: Colors.grey.withOpacity(.4),
                                ),
                                hint: 'البريد الالكتروني',
                                hintStyle: TextStyle(
                                  color: Colors.grey.withOpacity(.5),
                                ),
                                isPass: false,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.rh,
                          ),
                          SizedBox(
                            height: 20.rh,
                          ),
                          Center(
                            child: (state is VerifyEmailLoadingState)?  Center(child: AdaptiveIndicator( os: getOS(),),) : defaultButton(
                              onPressed: () {
                                cubit.userVerifyEmail(email: emailController.text);
                              },
                              text: 'إرسال',
                              width: 150.rSp,
                              minWidth: 150.rSp,
                            ),
                          ),
                          SizedBox(
                            height: 20.rh,
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    navigateTo(context, RegisterScreen());
                                  },
                                  child: const Text(
                                    'إعادة المحاولة',
                                    style: TextStyle(
                                      fontFamily: 'Kharbet',
                                        color: kText1Color,
                                        decoration: TextDecoration.underline),
                                  ),
                                ),
                                const Text(
                                  
                                  '- لم يتم الإرسال',
                                  style: TextStyle(
                                    fontFamily: 'Kharbet',
                                    color: kText2Color,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
        },
      ),
    );
  }
}
