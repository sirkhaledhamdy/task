import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:task/constants/constants.dart';
import 'package:task/constants/shared/local/cache_helper.dart';
import 'package:task/constants/size_extention.dart';
import 'package:task/controller/verify/code_cubit.dart';
import 'package:task/controller/verify/code_states.dart';
import 'package:task/view/screens/home_screen.dart';
import 'package:task/view/screens/register_screen.dart';
import 'package:task/view/styles/colors.dart';
import 'package:task/view/widgets/reuseable.dart';

class CodeScreen extends StatefulWidget {
    final String user;
    final String type;
   const CodeScreen({super.key, required this.user, required this.type});

  @override
  State<CodeScreen> createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  
  bool _onEditing = true;
  String? _code;



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenSizes.screenWidth = size.width;
    ScreenSizes.screenHeight = size.height;

    return BlocProvider(
      create: (context) => CodeCubit(),
      child: BlocConsumer<CodeCubit , CodeStates>(
        listener: (context, state) {
          if(state is CodeEmailSuccessState) {
          CacheHelper.saveData(key: 'isVerified', value: true);
                CacheHelper.saveData(key: 'accessToken', value: state.successModel.data.user.id).then((value) {
                accessToken = CacheHelper.getData(key: "accessToken");
                isVerified = CacheHelper.getData(key: 'isVerified');
                showToast(text: state.successModel.message, state: ToastStates.success);

                

                navigateAndFinish(context, const HomeScreen());

              });

          }else if(state is CodeEmailErrorState){
                 showToast(text: state.error, state: ToastStates.error);
          }
        },
        builder: (context, state) {
          var cubit = CodeCubit.get(context);
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
                  padding:  EdgeInsets.symmetric(horizontal: 16.rSp, vertical: 20.rSp),
                  child: SizedBox(
                    height: 66.h,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('! ???????????? ????????',
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
                          Text('?????????? ?????????????? ????????????????',
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
                              Text('?????? ????????????',
                                style: TextStyle(
                                  color: kText2Color,
                                  fontFamily: 'Kharbet',
                                  fontSize: 12.rSp,
                                ),
                              ),
                              SizedBox(width: 10.rw,),
                            
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
                        textStyle:  TextStyle(fontSize: 20.0.rSp, color: kText1Color),
                        keyboardType: TextInputType.number,
                        underlineColor: Colors.white, // If this is null it will use primaryColor: Colors.red from Theme
                        length: 4,
                        cursorColor: kButtonColor, 
                clearAll:  Padding(
                  padding: EdgeInsets.all(8.0.rSp),
                  child: Text(
                    'clear all',
                    style: TextStyle(fontSize: 14.0.rSp, decoration: TextDecoration.underline, color: kText1Color),
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
                              cubit.userCodeEmail(email: widget.user, code: _code , type: widget.type);
                            }, text: '??????????',
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
                              }, child: const Text('?????????? ????????????????',
                              style: TextStyle(
                                fontFamily: 'Kharbet',
                                color: kText1Color,
                                decoration: TextDecoration.underline
                              ),
                              ),
                              ),
                             IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: (){
                                
                              }, icon: Image.asset('assets/Icons/refresh.png'))
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
        },
      ),
    );
  }
}