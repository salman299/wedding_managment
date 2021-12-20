import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    initData(context).then((value) =>
        Navigator.of(context).pushNamed(Home.routeName)
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container( color: Colors.yellow,)
    );
  }
}
