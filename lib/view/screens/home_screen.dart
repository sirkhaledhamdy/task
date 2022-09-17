import 'package:flutter/material.dart';
import 'package:task/constants/size_extention.dart';
import 'package:task/view/screens/login_screen.dart';
import 'package:task/view/styles/colors.dart';
import 'package:task/view/widgets/reuseable.dart';

import '../../constants/shared/local/cache_helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenSizes.screenWidth = size.width;
    ScreenSizes.screenHeight = size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/shapes/backgroundhome.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                      Text('الخدمات الرئيسية',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      SizedBox(width: 10.rw,),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                        
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Icon(Icons.arrow_forward_ios,
                          size: 12.rSp,
                          color: Colors.white,
                          ),
                        ),
                      )
                    ],),
      
                    SizedBox(height: 50.rh,),
      
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: InkWell(
                                onTap: () {
        CacheHelper.removeData(key: 'accessToken').then((value) {
          navigateAndFinish(context, LoginScreen());
      });
                                },
                                child: Container(
                                  width: 40.w,
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                    color: kServicesColor.withOpacity(.4),
                                    borderRadius: BorderRadius.circular(10.rSp),
                                  ),
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/patterns/cleancar.png'),
                                        SizedBox(
                                          height: 20.rh,
                                        ),
                                        Text(
                                          'نظافة سيارات',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.rw,
                            ),
                            Flexible(
                              child: Container(
                                width: 40.w,
                                height: 20.h,
                                decoration: BoxDecoration(
                                  color: kServicesColor.withOpacity(.4),
                                  borderRadius: BorderRadius.circular(10.rSp),
                                ),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset('assets/patterns/building.png'),
                                      SizedBox(
                                        height: 10.rh,
                                      ),
                                      Text(
                                        'نظافة مباني',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.rh,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Container(
                                width: 40.w,
                                height: 20.h,
                                decoration: BoxDecoration(
                                  color: kServicesColor.withOpacity(.4),
                                  borderRadius: BorderRadius.circular(10.rSp),
                                ),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset('assets/patterns/rent.png'),
                                      SizedBox(
                                        height: 20.rh,
                                      ),
                                      Text(
                                        ' إيجار وايتات',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                            SizedBox(
                              width: 10.rw,
                            ),
                            Flexible(
                              child: Container(
                                width: 40.w,
                                height: 20.h,
                                decoration: BoxDecoration(
                                  color: kServicesColor.withOpacity(.4),
                                  borderRadius: BorderRadius.circular(10.rSp),
                                ),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset('assets/patterns/cargo.png'),
                                      SizedBox(
                                        height: 10.rh,
                                      ),
                                      Text(
                                        'تأجير حاويات',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.rh,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Container(
                                width: 40.w,
                                height: 20.h,
                                decoration: BoxDecoration(
                                  color: kServicesColor.withOpacity(.4),
                                  borderRadius: BorderRadius.circular(10.rSp),
                                ),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset('assets/patterns/cargoservice.png'),
                                      SizedBox(
                                        height: 20.rh,
                                      ),
                                      Text(
                                        'خدمات حاويات',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                            SizedBox(
                              width: 10.rw,
                            ),
                            Flexible(
                              child: Container(
                                width: 40.w,
                                height: 20.h,
                                decoration: BoxDecoration(
                                  color: kServicesColor.withOpacity(.4),
                                  borderRadius: BorderRadius.circular(10.rSp),
                                ),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset('assets/patterns/fix.png'),
                                      SizedBox(
                                        height: 10.rh,
                                      ),
                                      Text(
                                        'خدمات صيانة  ',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
