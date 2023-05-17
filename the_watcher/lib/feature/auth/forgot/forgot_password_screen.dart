import 'package:the_watcher/feature/auth/user.dart';

import '../../../core/constants.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> with User {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppbar.transparent(),
      backgroundColor: Colors.white,
      body: Form(
        key: key,
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ListView(
              physics: const ClampingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 32, top: 16),
                  child: Text(
                    'Account Recovery',
                    textAlign: TextAlign.center,
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
                  label: 'Email / No.Telp',
                  controller: emailCtr,
                  labelStyle: const TextStyle(
                      fontSize: 21, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 86),
                Align(
                  alignment: Alignment.topRight,
                  child: LoadingButton(
                      text: 'Next',
                      onPressed: () =>
                          forgotPassword(context, _changeIsLoading),
                      isLoading: isLoading),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              ImageAssets.personHalf,
              width: 128,
              height: 150,
            ),
          )
        ]),
      ),
    );
  }

  _changeIsLoading(bool value) {
    setState(() {
      isLoading = value;
    });
  }
}
