import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/constants/constants.dart';
import 'package:task/constants/shared/local/cache_helper.dart';
import 'package:task/constants/size_extention.dart';
import 'package:task/controller/register/register_cubit.dart';
import 'package:task/controller/register/register_states.dart';
import 'package:task/view/screens/choose_verification.dart';
import 'package:task/view/screens/login_screen.dart';
import 'package:task/view/styles/colors.dart';
import 'package:task/view/widgets/reuseable.dart';
import 'package:task/view/styles/adaptive/adaptive.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});
        var formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController = TextEditingController();
   final TextEditingController nameController = TextEditingController();
   final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenSizes.screenWidth = size.width;
    ScreenSizes.screenHeight = size.height;

    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context , state){
          if(state is RegisterSuccessState) {
            CacheHelper.saveData(key: 'isVerified', value: false);
            CacheHelper.saveData(key: 'name', value: state.registerModel.data.name);
            CacheHelper.saveData(key: 'accessToken', value: state.registerModel.data.id).then((value) {
                accessToken = CacheHelper.getData(key: "accessToken");
                isVerified = CacheHelper.getData(key: "isVerified");
                userName = CacheHelper.getData(key: "name");
                showToast(text: state.registerModel.message, state: ToastStates.success);

                navigateAndFinish(context, VerificaionScreen());

              });
          }else if (state is RegisterErrorState) {
           showToast(text: state.error, state: ToastStates.error);

          }
        },
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
          return  Scaffold(
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
                  child: Positioned(
                    left: -30.rSp,
                    bottom: -30.rSp,
                    child: Image.asset('assets/shapes/corner.png',
                    ),
                  ),
                ),
                Visibility(
                  visible: MediaQuery.of(context).viewInsets.bottom == 0,
                  child: Positioned(
                    left: -30.rSp,
                    bottom: -30.rSp,
                    child: Image.asset('assets/images/man.png'),
                  ),
                ),
                SafeArea(
                  bottom: false,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 16.rSp, vertical: 20.rSp),
                    child: SizedBox(
                      height: 75.h,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('! مرحباً بك',
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
                            Text('إنشاء حساب لبدء التطبيق',
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
                                Text('تسجيل جديد',
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
                                color:  kInputFieldColor,
                                child: defaultFormField(
                                    controller: nameController,
                                    type: TextInputType.text,
                                  validate: (String value){
                                        if(value.isEmpty) {
                                          return 'User Must Input Data';
                                          }
                                          return null;
                                  },
                                  suffix: const Image(image: AssetImage('assets/Icons/user.png',),),
                                  hint: ' اسم المستخدم ',
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
                                  controller: phoneController,
                                  type: TextInputType.phone,
                                  validate: (String value){
                                        if(value.isEmpty) {
                                          return 'User Must Input Data';
                                          }
                                          return null;
                                  },
                                  suffix: const Image(image: AssetImage('assets/Icons/mobile.png',),),
                                  hint: 'رقم الجوال',
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
                                  ),
                                  isPass: true,
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
                                  controller: confirmPasswordController,
                                  type: TextInputType.text,
                                  validate: (String value){
                                        if(value.isEmpty) {
                                          return 'User Must Input Data';
                                          }
                                          return null;
                                  },
                                  suffix: const Image(image: AssetImage('assets/Icons/lock.png',),),
                                  hint: 'تأكيد كلمة المرور',
                                  hintStyle: TextStyle(
                                    color: Colors.grey.withOpacity(.5),
                                  ),
                                  isPass: true,
                                ),
                              ),
                            ),
                            SizedBox(height: 20.rh,),
                            Center(
                              child: (state is RegisterLoadingState)?  Center(child: AdaptiveIndicator( os: getOS(),),) : defaultButton(onPressed: (){
                                cubit.userRegister(
                                  email: emailController.text, 
                                  password: passwordController.text, 
                                  confirm_password: confirmPasswordController.text, 
                                  name: nameController.text, 
                                  phone: phoneController.text);
                              }, text: 'تسجيل',
                              width: 150.rSp,
                              minWidth: 150.rSp,
                              
                              ),
                            ),
                            SizedBox(height: 10.rh,),
                            Center(child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(onPressed: (){
                                  navigateTo(context, LoginScreen());
                                }, child: const Text('تسجيل الدخول',
                                style: TextStyle(
                                  fontFamily: 'Kharbet',
                                  color: kText1Color,
                                  decoration: TextDecoration.underline
                                ),
                                ),
                                ),
                                const Text('- لدي حساب بالفعل',
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