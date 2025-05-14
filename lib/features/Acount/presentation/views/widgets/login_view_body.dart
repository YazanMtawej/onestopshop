import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onestopshop/constents.dart';
import 'package:onestopshop/features/Acount/presentation/views/widgets/text_field_email.dart';
import 'package:onestopshop/features/Acount/presentation/views/widgets/text_field_password.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: SizedBox(
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
                    const SizedBox(height: 5),
                    const Text(
                      'Login',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    const SizedBox(height: 5),
                    SvgPicture.asset('assets/images/icons/login.svg'),
                    const SizedBox(height: 24),

                    TextFieldEmail(),

                    TextFieldPassword(),

                    const SizedBox(height: 3),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(kButtonColor),
                        padding: WidgetStateProperty.all(
                          const EdgeInsets.symmetric(
                            horizontal: 99,
                            vertical: 20,
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
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(" Don't have an account ?"),
                        GestureDetector(
                          onTap: () {},
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
                child: Image.asset('assets/images/images/main_top.png'),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                width: 111,
                child: Image.asset('assets/images/images/login_bottom.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
