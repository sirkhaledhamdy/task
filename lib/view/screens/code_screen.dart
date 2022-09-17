import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:task/constants/size_extention.dart';
import 'package:task/view/screens/register_screen.dart';
import 'package:task/view/styles/colors.dart';
import 'package:task/view/widgets/reuseable.dart';

class CodeScreen extends StatefulWidget {
   CodeScreen({super.key});

  @override
  State<CodeScreen> createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  bool _onEditing = true;
  String? _code;
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
                child: Image.asset('assets/shapes/corner.png',
                ),
              ),
            ),
            Visibility(
              visible: MediaQuery.of(context).viewInsets.bottom == 0,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset('assets/images/lock3d.png'),
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
                      Text('! مرحباً أحمد',
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
                      Text('تأكيد التسجيل بالتطبيق',
                        style: TextStyle(
                          fontFamily: 'Kharbet',
                          fontSize: 18.rSp,
                          color: kText1Color,
                        ),
                      ),
                      SizedBox(height: 60.rh,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('كود التحقق',
                            style: TextStyle(
                              color: kText2Color,
                              fontFamily: 'Kharbet',
                              fontSize: 12.rSp,
                            ),
                          ),
                          SizedBox(width: 10.rh,),
                        
                        ],
                      ),
                      SizedBox(height: 20.rh,),
                     Center(
                       child: VerificationCode(
                        itemSize: 70.rSp,
                        underlineWidth: 50.rSp,
                        fullBorder: true,
                        autofocus: true,
                        underlineUnfocusedColor: kInputFieldColor,
                    textStyle: TextStyle(fontSize: 20.0, color: kText1Color),
                    keyboardType: TextInputType.number,
                    underlineColor: Colors.white, // If this is null it will use primaryColor: Colors.red from Theme
                    length: 4,
                    cursorColor: kButtonColor, // If this is null it will default to the ambient
            // clearAll is NOT required, you can delete it
            // takes any widget, so you can implement your design
            clearAll: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'clear all',
                style: TextStyle(fontSize: 14.0, decoration: TextDecoration.underline, color: kText1Color),
              ),
            ),
            onCompleted: (String value) {
              setState(() {
                _code = value;
              });
            },
          
            onEditing: (bool value) {
              setState(() {
                _onEditing = value;
              });
              if (!_onEditing) FocusScope.of(context).unfocus();
            },
          ),
                     ),
          
                      SizedBox(height: 10.rh, ),
                      
                      SizedBox(height: 20.rh,),
                      Center(
                        child: defaultButton(onPressed: (){
                        setState(() {
                              });
                        }, text: 'تأكيد',
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
                          }, child: Text('إعادة المحاولة',
                          style: TextStyle(
                            color: kText1Color,
                            decoration: TextDecoration.underline
                          ),
                          ),
                          ),
                         IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: (){}, icon: Image.asset('assets/Icons/refresh.png'))
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