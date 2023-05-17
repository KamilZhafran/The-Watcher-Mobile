import 'package:the_watcher/core/constants.dart';
import 'package:the_watcher/core/widgets/loading_button.dart';
import 'package:the_watcher/feature/auth/user.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with User {
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
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: Text(
                    'Registrasi',
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
                  label: 'Email',
                  controller: emailCtr,
                  hint: 'example@mail.com',
                  textInputType: TextInputType.emailAddress,
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
                const SizedBox(height: 16),
                CustomLabeledTextFormField(
                  label: 'No. Telp',
                  controller: phoneCtr,
                  hint: '08xxxxxxxxxxx',
                  textInputType: TextInputType.phone,
                  labelStyle: const TextStyle(
                      fontSize: 21, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                ImageAssets.personHalf,
                width: 128,
              ),
              const Spacer(),
              LoadingButton(
                onPressed: isLoading
                    ? () {}
                    : () {
                        register(context, _changeIsLoading);
                      },
                text: 'Submit',
                isLoading: isLoading,
                loadingColor: Colors.white,
              ),
              const SizedBox(width: 24),
            ],
          ),
        )
      ]),
    );
  }

  _changeIsLoading(bool value) {
    setState(() {
      isLoading = value;
    });
  }
}
