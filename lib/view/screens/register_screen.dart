import 'package:flutter/material.dart';
import 'package:task/constants/size_extention.dart';
import 'package:task/view/screens/login_screen.dart';
import 'package:task/view/styles/colors.dart';
import 'package:task/view/widgets/reuseable.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
   final TextEditingController nameController = TextEditingController();
   final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenSizes.screenWidth = size.width;
    ScreenSizes.screenHeight = size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: Stack(

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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
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
                          color:  kInputFieldColor,
                          child: defaultFormField(
                              controller: nameController,
                              type: TextInputType.text,
                              validate: (){},
                            suffix: Image(image: AssetImage('assets/Icons/user.png',),),
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
                            validate: (){},
                            suffix: Image(image: AssetImage('assets/Icons/mobile.png',),),
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
                        child: defaultButton(onPressed: (){}, text: 'تسجيل',
                        width: 100.rSp,
                        minWidth: 100.rSp,
                        ),
                      ),
                      SizedBox(height: 10.rh,),
                      Center(child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(onPressed: (){
                            navigateTo(context, LoginScreen());
                          }, child: Text('تسجيل الدخول',
                          style: TextStyle(
                            color: kText1Color,
                            decoration: TextDecoration.underline
                          ),
                          ),
                          ),
                          Text('- لدي حساب بالفعل',
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
    );
  }
}