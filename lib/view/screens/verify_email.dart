import 'package:flutter/material.dart';
import 'package:task/constants/size_extention.dart';
import 'package:task/view/screens/register_screen.dart';
import 'package:task/view/styles/colors.dart';
import 'package:task/view/widgets/reuseable.dart';

class EmailScreen extends StatelessWidget {
  EmailScreen({super.key});
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenSizes.screenWidth = size.width;
    ScreenSizes.screenHeight = size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: SafeArea(
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: SizedBox(
                height: 66.h,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '! مرحباً أحمد',
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
                          SizedBox(
                            width: 10.rh,
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
                            validate: () {},
                            suffix: Icon(
                              Icons.mail_outline,
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
                      SizedBox(
                        height: 10.rh,
                      ),
                      SizedBox(
                        height: 20.rh,
                      ),
                      Center(
                        child: defaultButton(
                          onPressed: () {},
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
                              child: Text(
                                'إعادة المحاولة',
                                style: TextStyle(
                                    color: kText1Color,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                            Text(
                              '- لم يتم الإرسال',
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
          ],
        ),
      ),
    );
  }
}
