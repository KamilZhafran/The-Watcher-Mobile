import '../../core/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool alert = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: alert ? Colors.red.shade100 : Colors.grey.shade300,
      body: Column(
        children: [
          const Spacer(),
          alert
              ? Text(
                  'Terdapat pengunjung yang tidak mengenakan masker',
                  textAlign: TextAlign.center,
                  style: CustomTextStyle.red(
                      fontSize: 20, fontWeight: FontWeight.w800),
                )
              : Text(
                  'Wathcer',
                  textAlign: TextAlign.center,
                  style: CustomTextStyle.outlined(
                      strokeColor: CustomColor.primaryColor,
                      textColor: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w700),
                ),
          const Spacer(),
          InkWell(
            onTap: () {
              setState(() {
                alert = !alert;
              });
            },
            child: Image.asset(
              ImageAssets.alert,
              width: double.infinity,
              height: 129,
            ),
          ),
          const SizedBox(height: 96)
        ],
      ),
    );
  }
}
