import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:task/constants/constants.dart';
import 'package:task/constants/size_extention.dart';
import 'package:task/view/screens/verify_email.dart';
import 'package:task/view/screens/verify_phone.dart';
import 'package:task/view/styles/colors.dart';
import 'package:task/view/widgets/reuseable.dart';

class VerificaionScreen extends StatelessWidget {
  VerificaionScreen({super.key});
  final TextEditingController phoneController = TextEditingController();

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
                  child: Image.asset('assets/images/padlock.png'),
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.rSp, vertical: 20.rSp),
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
                              'برجاء تحديد واحد من الخيارات التالية لإرسال كود التحقق',
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
                        GestureDetector(
                          onTap: () {
                            navigateTo(context, PhoneScreen());
                          },
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            color: kText1Color,
                            radius:  Radius.circular(12.rSp),
                            padding:  EdgeInsets.all(6.rSp),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(12)),
                              child: Container(
                                padding: EdgeInsets.all(16.rSp),
                                height: 100,
                                width: double.infinity,
                                color: kInputFieldColor,
                                child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'رقم الجوال',
                                            style: TextStyle(
                                              color: kText1Color,
                                              fontFamily: 'Kharbet',
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.rh,
                                          ),
                                          const Text(
                                            '.أدخل رقم الجوال لإرسال كود التحقق الخاص  بك',
                                            style:
                                                TextStyle(color: Colors.black54,
                                                fontFamily: 'Kharbet',
                                                ),
                                                
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: 15.rw,
                                      ),
                                      Expanded(
                                          child: Image.asset(
                                              'assets/images/maobileapp.png'))
                                    ]),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.rh,
                        ),
                        GestureDetector(
                        onTap: (){
                            navigateTo(context, EmailScreen());
                          },
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            color: kText1Color,
                            radius:  Radius.circular(12.rSp),
                            padding:  EdgeInsets.all(6.rSp),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(12)),
                              child: Container(
                                padding: EdgeInsets.all(16.rSp),
                                height: 100.rSp,
                                width: double.infinity,
                                color: kInputFieldColor,
                                child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'البريد الإلكتروني',
                                            style: TextStyle(
                                              color: kText1Color,
                                              fontFamily: 'Kharbet',
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.rh,
                                          ),
                                          const Text(
                                            '.أدخل البريد الإلكتروني لإرسال كود التحقق الخاص  بك',
                                            style: TextStyle(color: Colors.black54,
                                            fontFamily: 'Kharbet',
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: 15.rw,
                                      ),
                                      Expanded(
                                          child: Image.asset(
                                              'assets/images/email2.png'))
                                    ]),
                              ),
                            ),
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
