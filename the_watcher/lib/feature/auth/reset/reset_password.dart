import 'package:the_watcher/feature/auth/user.dart';

import '../../../core/constants.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String userId;

  const ResetPasswordScreen({super.key, required this.userId});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> with User {
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
                    'Create New Password',
                    textAlign: TextAlign.center,
                    style: CustomTextStyle.outlined(
                        strokeColor: CustomColor.primaryColor,
                        textColor: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                CustomLabeledTextFormField(
                  label: 'Password baru',
                  controller: nameCtr,
                  obscureText: true,
                  labelStyle: const TextStyle(
                      fontSize: 21, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                CustomLabeledTextFormField(
                  label: 'Konfirmasi password baru',
                  controller: emailCtr,
                  obscureText: true,
                  labelStyle: const TextStyle(
                      fontSize: 21, fontWeight: FontWeight.bold),
                  validator: (value) {
                    if (nameCtr.text != value) {
                      return 'Password tidak sama!';
                    }
                  },
                ),
                const SizedBox(height: 86),
                Align(
                  alignment: Alignment.topRight,
                  child: LoadingButton(
                      text: 'Submit',
                      onPressed: () =>
                          changePass(context, widget.userId, _changeIsLoading),
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
