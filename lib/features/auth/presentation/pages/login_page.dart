import "package:blog_project/core/theme/app_pallete.dart";
import "package:blog_project/features/auth/presentation/pages/signup_page.dart";
import "package:blog_project/features/auth/presentation/widgets/auth_gradient_button.dart";
import "package:flutter/material.dart";

import "../widgets/auth_field.dart";

class LoginPage extends StatefulWidget {

  const LoginPage({super.key});
  static route() => MaterialPageRoute(builder: (context) => const SignupPage());
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Sign In.', style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold
              ),
              ),
              const SizedBox(height: 30,),
              AuthField(hintText: "Email", controller: emailController,),
              const SizedBox(height: 15,),
              AuthField(hintText: "Password", controller: passwordController,isObscureText: true,),
              const SizedBox(height: 20,),
              const AuthGradientButton(buttonText: 'Sign In',),
              const SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, SignupPage.route());
                },
                child: RichText(text: TextSpan(
                    text: "Don't have an account? ",
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: 'Sign Up',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppPallete.gradient2,
                            fontWeight: FontWeight.bold
                        ),
                      )
                    ]
                ),

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
