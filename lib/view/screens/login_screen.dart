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
import 'package:task/view/styles/adaptive/adaptive.dart';
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
              CacheHelper.saveData(key: 'isVerified', value: true);
              CacheHelper.saveData(key: 'accessToken', value: state.loginModel.data.user.id).then((value) {
                accessToken = CacheHelper.getData(key: "accessToken");
                isVerified = CacheHelper.getData(key: 'isVerified');
                print(accessToken);
                showToast(text: state.loginModel.message, state: ToastStates.success);

                navigateAndFinish(context, const HomeScreen());

              });


            } else {}
        }else if (state is LoginErrorState) {
          showToast(text: state.error, state: ToastStates.error);

          if (state.error == 'الحساب غير مفعل') {
              navigateAndFinish(context, VerificaionScreen());
              isVerified =false;
              showToast(text: state.error, state: ToastStates.error);


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
                    padding:  EdgeInsets.symmetric(horizontal: 16.rSp, vertical: 20.rSp),
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
                                SizedBox(width: 10.rw,),
                                Container(
                                  width: 20.rSp,
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
                                  validate: (String value){
                                        if(value.isEmpty) {
                                          return 'User Must Input Data';
                                          }
                                          return null;
                                  },
                                  suffix: Icon(Icons.mail_outline,
                                  size: 20.rSp,
                                  color: Colors.grey.withOpacity(.4),
                                  ),
                                  hint: 'البريد الالكتروني',
                                  hintStyle: TextStyle(
                                   fontFamily: 'Kharbet',

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
                                  validate: (String value){
                                        if(value.isEmpty) {
                                          return 'User Must Input Data';
                                          }
                                          return null;
                                  },
                                  suffix: const Image(image: AssetImage('assets/Icons/lock.png',),),
                                  hint: 'كلمة المرور',
                                  hintStyle: TextStyle(
                                    color: Colors.grey.withOpacity(.5),
                                  fontFamily: 'Kharbet',

                                  ),
                                  isPass: true,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Padding(
                              padding:  EdgeInsets.all(8.0.rSp),
                              child: Row(children: const [
                                Text('نسيت كلمة المرور؟',
                                style: TextStyle(
                                  color: kText2Color,
                                ),
                                ),
                              ],),
                            ),
                            SizedBox(height: 20.rh,),
                            Center(
                              child: (state is LoginLoadingState) ? Center(child: AdaptiveIndicator( os: getOS(),)) : defaultButton(onPressed: (){
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
                                }, child: const Text('تسجيل جديد',
                                style: TextStyle(
                                  fontFamily: 'Kharbet',
                                  color: kText1Color,
                                  decoration: TextDecoration.underline
                                ),
                                ),
                                ),
                                const Text('- ليس لدي حساب',
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