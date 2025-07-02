import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:onestopshop/constents.dart';
import 'package:onestopshop/core/utils/widgets/custom_loading_indicator.dart';
import 'package:onestopshop/features/Acount/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:onestopshop/features/Acount/presentation/view_models/auth_cubit/auth_state.dart';
import 'package:onestopshop/features/Acount/presentation/views/sigin_view.dart';
import 'package:onestopshop/features/Acount/presentation/views/widgets/text_field_email.dart';
import 'package:onestopshop/features/Acount/presentation/views/widgets/text_field_password.dart';
import 'package:onestopshop/features/main/presentation/views/main_view.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});
  final usernameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if(state is AuthAuthenticated){
              Get.to(()=>MainView(),duration: kTranstionDuration,);
            }
          },
          builder: (context, state) {
            if(state is AuthLoading){
              return CustomLoadingIndicator();
            }
            
          return SizedBox(
    height: double.infinity,
    width: double.infinity,
    child: Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 30),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 5),
              const Text(
                'Login',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              const SizedBox(height: 5),
              SvgPicture.asset('assets/images/icons/login.svg'),
              const SizedBox(height: 24),
  
              SizedBox(
                height: 200,
                child: ListView(
                  children: [
                    TextFieldEmail(controller: usernameCtrl, label: 'User Name',),
                    TextFieldPassword(controller: passwordCtrl, label: 'PassWord',),
                  ],
                ),
              ),
  
              const SizedBox(height: 5),
              ElevatedButton(
                onPressed: () {
              context.read<AuthCubit>().login(
              usernameCtrl.text,
              passwordCtrl.text,
    );
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    kButtonColor,
                  ),
                  padding: WidgetStateProperty.all(
                    const EdgeInsets.symmetric(
                      horizontal: 99,
                      vertical: 14,
                    ),
                  ),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(66),
                    ),
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 19, color: kTextColor),
                ),
              ),
             if(state is AuthError)
                Text(state.errmessage,style: TextStyle(color: Colors.red),),
                
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(" Don't have an account ?"),
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        () => SiginView(),
                      //  transition: Transition.leftToRight,
                        duration: kTranstionDuration,
                      );
                    },
                    child: const Text(
                      " Sign up",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
               
            ],
          ),
        ),
        Positioned(
          left: 0,
          width: 111,
          child: Image.asset('assets/images/images1/main_top.png'),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          width: 111,
          child: Image.asset(
            'assets/images/images1/login_bottom.png',
          ),
        ),
      ],
    ),
  );



          },
        ),
      ),
    );
  }
}
