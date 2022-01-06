import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wedding_management/providers/auth_provider.dart';
import 'package:wedding_management/providers/banquet_form_provider.dart';
import 'package:wedding_management/providers/cart_provider.dart';
import 'package:wedding_management/providers/dress_form_provider.dart';
import 'package:wedding_management/providers/invitation_card_form_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wedding_management/providers/photographer_form_provider.dart';
import 'package:wedding_management/providers/rent_car_form_provider.dart';
import 'package:wedding_management/providers/settings.dart';
import 'package:wedding_management/screens/home/home.dart';
import 'package:wedding_management/screens/order/order_screen.dart';
import 'package:wedding_management/screens/register/register.dart';
import 'package:wedding_management/screens/splash/splash_screen.dart';
import 'routes.dart';
import './theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_)=>Auth(),
        ),
        ChangeNotifierProvider(
          create: (_)=>AppSettings(),
          // value: AppSettings(),
        ),
        ChangeNotifierProvider(
          create: (_)=>CartProvider(),
        ),
        ChangeNotifierProvider.value(
          value: RentCarFormProvider(),
        ),
        ChangeNotifierProvider.value(
            value: BanquetFormProvider(),
        ),
        ChangeNotifierProvider.value(
            value: InvitationCardFormProvider()
        ),
        ChangeNotifierProvider.value(
            value: PhotographerFormProvider()
        ),
        ChangeNotifierProvider.value(
            value: DressFormProvider()
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: theme(),
          initialRoute: SplashScreen.routeName,
          routes: routes,
      ),
    );
  }
}