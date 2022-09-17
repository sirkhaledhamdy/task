import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/constants/constants.dart';
import 'package:task/constants/size_extention.dart';
import 'package:task/controller/login/login_cubit.dart';
import 'package:task/controller/login/login_states.dart';
import 'package:task/view/screens/choose_verification.dart';
import 'package:task/view/screens/home_screen.dart';
import 'package:task/view/screens/register_screen.dart';
import 'package:task/view/styles/colors.dart';
import 'package:task/view/widgets/reuseable.dart';

import '../../constants/shared/local/cache_helper.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
     var formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenSizes.screenWidth = size.width;
    ScreenSizes.screenHeight = size.height;

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context , state){
           if(state is LoginSuccessState){
            if(state.loginModel.message == 'تم تسجيل الدخول بنجاح'){
              CacheHelper.saveData(key: 'accessToken', value: state.loginModel.data.user.id).then((value) {
                accessToken = CacheHelper.getData(key: "accessToken");
                print(accessToken);

                navigateAndFinish(context, HomeScreen());
                // Make it show only if he didn't claim his seed after every login.

              });


            } else {}
        }else if (state is LoginErrorState) {
          if (state.error == 'الحساب غير مفعل') {
              navigateAndFinish(context, VerificaionScreen());

            }
            
        }
        },
        builder: (context , state){
          var cubit = LoginCubit.get(context);
          return Scaffold(
          backgroundColor: Colors.white,
          extendBody: true,
          body: Form(
            key: formKey,
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
                    child: Image.asset('assets/shapes/corner.png',
                    ),
                  ),
                ),
                Visibility(
                  visible: MediaQuery.of(context).viewInsets.bottom == 0,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Image.asset('assets/images/clean.png'),
                  ),
                ),
                SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    child: SizedBox(
                      height: 66.h,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('! مرحباً بعودتك',
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
                            Text('تسجيل الدخول للمتابعة',
                              style: TextStyle(
                                fontFamily: 'Kharbet',
                                fontSize: 18.rSp,
                                color: kText1Color,
                              ),
                            ),
                            SizedBox(height: 60.rh,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('تسجيل الدخول',
                                  style: TextStyle(
                                    color: kText2Color,
                                    fontFamily: 'Kharbet',
                                    fontSize: 18.rSp,
                                  ),
                                ),
                                SizedBox(width: 10.rh,),
                                Container(
                                  width: 10.rSp,
                                  height: 1.rSp,
                                  color: kButtonColor,
                                ),
                              ],
                            ),
                            SizedBox(height: 20.rh,),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30.rSp),
                              child: Container(
                                height: 55.rh,
                                color: kInputFieldColor,
                                child: defaultFormField(
                                  controller: emailController,
                                  type: TextInputType.text  ,
                                  validate: (){},
                                  suffix: Icon(Icons.mail_outline,
                                  size: 20,
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
                            SizedBox(height: 10.rh, ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30.rSp),
                              child: Container(
                                height: 55.rh,
                                color: kInputFieldColor,
                                child: defaultFormField(
                                  controller: passwordController,
                                  type: TextInputType.text,
                                  validate: (){},
                                  suffix: Image(image: AssetImage('assets/Icons/lock.png',),),
                                  hint: 'كلمة المرور',
                                  hintStyle: TextStyle(
                                    color: Colors.grey.withOpacity(.5),
                                  ),
                                  isPass: true,
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            
                            SizedBox(height: 20.rh,),
                            Center(
                              child: defaultButton(onPressed: (){
                                cubit.userLogin(email: emailController.text, password: passwordController.text);
                              }, text: 'دخول',
                              width: 150.rSp,
                              minWidth: 150.rSp,
                              ),
                            ),
                            SizedBox(height: 20.rh,),
                            Center(child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(onPressed: (){
                                  navigateTo(context, RegisterScreen());
                                }, child: Text('حساب جديد',
                                style: TextStyle(
                                  color: kText1Color,
                                  decoration: TextDecoration.underline
                                ),
                                ),
                                ),
                                Text('- ليس لدي حساب',
                                style: TextStyle(
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
                ),
              ],
            ),
          ),
        );
        },
      ),
    );
  }
}