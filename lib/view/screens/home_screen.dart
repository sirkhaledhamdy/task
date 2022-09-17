import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/constants/constants.dart';
import 'package:task/constants/shared/local/cache_helper.dart';
import 'package:task/constants/size_extention.dart';
import 'package:task/controller/home/home_cubit.dart';
import 'package:task/controller/home/home_states.dart';
import 'package:task/model/service_model.dart';
import 'package:task/view/screens/login_screen.dart';
import 'package:task/view/styles/adaptive/adaptive.dart';
import 'package:task/view/styles/colors.dart';
import '../widgets/reuseable.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenSizes.screenWidth = size.width;
    ScreenSizes.screenHeight = size.height;

    return BlocProvider(
      create: (context) => HomeCubit()..getServices(),
    
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
        },
        builder: (context, state) {
          var cubit = HomeCubit.get(context).serviceModel;
          return Scaffold(
          backgroundColor: Colors.white,
          extendBody: true,
          extendBodyBehindAppBar: true,
          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
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
                  padding:  EdgeInsets.all(20.0.rSp),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                          IconButton(onPressed: (){
                              CacheHelper.removeData(key: 'accessToken').then((value) {
                              navigateAndFinish(context, LoginScreen());
                                 });
                          }, icon: const Icon(Icons.logout,
                          color: Colors.white,
                          ),),
                          const Spacer(),
                           Text('الخدمات الرئيسية',
                          style: TextStyle(
                            fontFamily: 'Kharbet',
                            fontSize: 22.rSp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                          SizedBox(width: 10.rw,),
                          Container(
                            width: 30.rSp,
                            height: 30.rSp,
                            decoration: BoxDecoration(
                            
                              border: Border.all(
                                color: Colors.white,
                                width: 1.rSp,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Icon(Icons.arrow_forward_ios,
                              size: 12.rSp,
                              color: Colors.white,
                              ),
                            ),
                          ),
                        ],),
                        
                        SizedBox(height: 50.rh,),
                        
                        (state is HomeLoadingState) ?  Center(child: AdaptiveIndicator( os: getOS(),),) : Container(
                          child: GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,  
                          crossAxisCount: 2,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                          childAspectRatio: 1,
                          children: List.generate(10, (index) => buildGridItem(cubit!.data[index], state)),
                          
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
        },  ),
    );
  }

  Widget buildGridItem(ServiceData model , state) => Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.5),
          spreadRadius: 3.rSp,
          blurRadius: 7 .rSp,
          offset: const Offset(0,3),
        )
      ],
      color: kServicesColor.withOpacity(.4),
      borderRadius: BorderRadius.circular(10.rSp),
    ),
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          (state is HomeLoadingState) ?  Center(child: AdaptiveIndicator( os: getOS(),),) :
          Expanded(
            child: Container(
              width: 200.rSp,
              height: 200.rSp,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
      
              ),
              child: Image.network(model.image, fit: BoxFit.cover,)),
          ),
          SizedBox(
            height: 10.rh,
          ),
          (state is HomeLoadingState) ?  Center(child: AdaptiveIndicator( os: getOS(),),) : Text(
           model.title,
           maxLines: 1,
          
           overflow: TextOverflow.ellipsis,
            style:  TextStyle(
            fontFamily: 'Kharbet',
              color: Colors.white,
              fontSize: 18.rSp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
  );
}
