import 'package:the_watcher/core/constants.dart';
import 'package:the_watcher/core/widgets/loading_button.dart';
import 'package:the_watcher/feature/auth/forgot/forgot_password_screen.dart';
import 'package:the_watcher/feature/auth/user.dart';

import '../register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with User {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: key,
            child: ListView(
              physics: const ClampingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: Text(
                    'Login',
                    style: CustomTextStyle.outlined(
                        strokeColor: CustomColor.primaryColor,
                        textColor: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                CustomLabeledTextFormField(
                  label: 'Nama',
                  controller: nameCtr,
                  hint: 'John Doe',
                  labelStyle: const TextStyle(
                      fontSize: 21, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                CustomLabeledTextFormField(
                  label: 'Password',
                  controller: passwordCtr,
                  textInputType: TextInputType.visiblePassword,
                  obscureText: true,
                  labelStyle: const TextStyle(
                      fontSize: 21, fontWeight: FontWeight.bold),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => const ForgotPassword(),
                      ),
                    ),
                    child: const Text('Lupa Password?'),
                  ),
                ),
                const SizedBox(height: 98),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => const RegisterScreen(),
                        ),
                      ),
                      child: Text(
                        'Create Account',
                        style: CustomTextStyle.outlined(
                            strokeColor: CustomColor.primaryColor,
                            textColor: Colors.blue,
                            radius: 8),
                      ),
                    ),
                    LoadingButton(
                      loadingColor: Colors.white,
                      onPressed: isLoading
                          ? () {}
                          : () => login(context, _changeIsLoading),
                      text: 'Login',
                      isLoading: isLoading,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Image.asset(
            ImageAssets.personHalf,
            width: 128,
          ),
        ),
      ]),
    );
  }

  _changeIsLoading(bool value) {
    setState(() {
      isLoading = value;
    });
  }
}
