import 'package:flutter/widgets.dart';
import 'package:wedding_management/screens/banquet/banquet.dart';
import 'package:wedding_management/screens/banquet_detail/banquet_detail.dart';
import 'package:wedding_management/screens/banquet_form/banquet_form.dart';
import 'package:wedding_management/screens/dress_datail/bridal_dress_detail.dart';
import 'package:wedding_management/screens/dress_datail/groom_dress_detail.dart';
import 'package:wedding_management/screens/dress_form/bridal_dress_form.dart';
import 'package:wedding_management/screens/dress_form/groom_dress_form.dart';
import 'package:wedding_management/screens/dresses/bridal_dresses_screen.dart';
import 'package:wedding_management/screens/dresses/groom_dresses_screen.dart';
import 'package:wedding_management/screens/home/home.dart';
import 'package:wedding_management/screens/invitation_card/invitation_card_screen.dart';
import 'package:wedding_management/screens/invitation_card_datail/invitation_card_detail.dart';
import 'package:wedding_management/screens/invitation_card_form/invitation_card_form.dart';
import 'package:wedding_management/screens/register/register.dart';
import 'package:wedding_management/screens/splash/splash_screen.dart';


// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  Banquet.routeName: (context) => const Banquet(),
  BanquetForm.routeName: (context) => const BanquetForm(),
  BanquetDetail.routeName: (context) => const BanquetDetail(),

  InvitationCardScreen.routeName: (context) => const InvitationCardScreen(),
  InvitationCardDetail.routeName: (context) => const InvitationCardDetail(),
  InvitationCardForm.routeName: (context) => const InvitationCardForm(),

  BridalDressesScreen.routeName: (context) => const BridalDressesScreen(),
  GroomDressesScreen.routeName: (context) => const GroomDressesScreen(),

  BridalDressDetail.routeName: (context) => const BridalDressDetail(),
  GroomDressDetail.routeName: (context) => const GroomDressDetail(),

  BridalDressForm.routeName: (context) => const BridalDressForm(),
  GroomDressForm.routeName: (context) => const GroomDressForm(),

  Register.routeName: (context) => const Register(),
  Home.routeName: (context) => const Home(),
  SplashScreen.routeName: (context) => const SplashScreen(),

};
