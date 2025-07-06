import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:onestopshop/constents.dart';
import 'package:onestopshop/core/utils/widgets/custom_loading_indicator.dart';
import 'package:onestopshop/features/Acount/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:onestopshop/features/Acount/presentation/view_models/auth_cubit/auth_state.dart';
import 'package:onestopshop/features/Acount/presentation/views/login_view.dart';
import 'package:onestopshop/features/Acount/presentation/views/widgets/text_field_email.dart';
import 'package:onestopshop/features/Acount/presentation/views/widgets/text_field_password.dart';
import 'package:onestopshop/features/main/presentation/views/main_view.dart';
import 'package:onestopshop/services/notification_service.dart';

class SiginViewBody extends StatelessWidget {
  SiginViewBody({super.key});
  final usernameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final firstNameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthAuthenticated) {
              Get.to(() => MainView(), duration: kTranstionDuration);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return CustomLoadingIndicator();
            }

            return SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 40),
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        const Text(
                          'Sign up',
                          style: TextStyle(fontSize: 35, color: Colors.black),
                        ),
                        const SizedBox(height: 5),
                        SvgPicture.asset(
                          'assets/images/icons/signup.svg',
                          height: 200,
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          height: 200,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView(
                              children: [
                                TextFieldEmail(
                                  controller: firstNameCtrl,
                                  label: 'First Name',
                                ),
                                TextFieldEmail(
                                  controller: lastNameCtrl,
                                  label: 'Last tName',
                                ),
                                TextFieldEmail(
                                  controller: usernameCtrl,
                                  label: 'User Name',
                                ),

                                TextFieldPassword(
                                  controller: passwordCtrl,
                                  label: 'PassWord',
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 5),
                        ElevatedButton(
                          onPressed: () async {
                            context.read<AuthCubit>().register(
                              username: usernameCtrl.text,
                              password: passwordCtrl.text,
                              firstName: firstNameCtrl.text,
                              lastName: lastNameCtrl.text,
                            );
                             await NotificationService().showNotification(
                              id: 1,
                              title: 'Sigin up',
                              body: 'You already have an account with us —welcome',
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
                            'Sign up',
                            style: TextStyle(fontSize: 19, color: kTextColor),
                          ),
                        ),
                        if (state is AuthError)
                          Text(
                            state.errmessage,
                            style: TextStyle(color: Colors.red),
                          ),

                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(" Already have an account ?"),
                            GestureDetector(
                              onTap: () {
                                Get.off(
                                  () => LoginView(),
                                  //    transition: Transition.rightToLeft,
                                  duration: kTranstionDuration,
                                );
                              },
                              child: const Text(
                                " Log in",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const SizedBox(
                          width: 299,
                          child: Row(
                            children: [
                              // ignore: prefer_const_constructors
                              Expanded(
                                child: Divider(
                                  height: 9,
                                  thickness: 5,
                                  color: kButtonColor,
                                ),
                              ),
                              Text('OR', style: TextStyle(color: kButtonColor)),
                              Expanded(
                                child: Divider(
                                  height: 9,
                                  thickness: 5,
                                  color: kButtonColor,
                                ),
                              ),
                            ],
                          ),
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
                  Positioned(
                    bottom: 10,
                    right: 120,
                    width: 111,
                    child: Container(
                      height: 42,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade500,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: SvgPicture.asset(
                          'assets/images/icons/facebook.svg',
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 190,
                    width: 111,
                    child: Container(
                      height: 42,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: SvgPicture.asset(
                          'assets/images/icons/google-plus.svg',
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 50,
                    width: 111,
                    child: Container(
                      height: 42,
                      decoration: BoxDecoration(
                        color: Colors.cyanAccent,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: SvgPicture.asset(
                          'assets/images/icons/twitter.svg',
                        ),
                      ),
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
