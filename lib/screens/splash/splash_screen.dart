import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wedding_management/constants.dart';
import 'package:wedding_management/providers/auth_provider.dart';
import 'package:wedding_management/screens/home/home.dart';
import '../../size_config.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<void> initData(context) async {
    SizeConfig.init(context);
    await Provider.of<Auth>(context, listen: false).getCurrentUser();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    initData(context).then((value){
      Navigator.of(context).pushReplacementNamed(Home.routeName);
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [kPrimaryColor, kSecondaryLightColor],
            )
          ),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: Image.asset(
                    'assets/wedding.png',
                    height: 150,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'SOLE MATE',
                        style: TextStyle(
                            letterSpacing: 1.1,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 23
                        ),
                      ),
                      SizedBox(height: 20,),
                      Center(child: CircularProgressIndicator()),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
