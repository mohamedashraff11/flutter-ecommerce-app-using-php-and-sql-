import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/middleware/mymiddleware.dart';
import 'package:ecommercecourse/view/screen/address/add.dart';
import 'package:ecommercecourse/view/screen/address/adddetails.dart';
import 'package:ecommercecourse/view/screen/address/view.dart';
import 'package:ecommercecourse/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommercecourse/view/screen/auth/login.dart';
import 'package:ecommercecourse/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommercecourse/view/screen/auth/signup.dart';
import 'package:ecommercecourse/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:ecommercecourse/view/screen/auth/success_signup.dart';
import 'package:ecommercecourse/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:ecommercecourse/view/screen/auth/verifycodesignup.dart';
import 'package:ecommercecourse/view/screen/cart.dart';
import 'package:ecommercecourse/view/screen/cheakout.dart';
import 'package:ecommercecourse/view/screen/homescreen.dart';
import 'package:ecommercecourse/view/screen/items.dart'; 
import 'package:ecommercecourse/view/screen/language.dart';
import 'package:ecommercecourse/view/screen/myfavorite.dart';

import 'package:ecommercecourse/view/screen/onboarding.dart';
import 'package:ecommercecourse/view/screen/productdetails.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(  name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
  // GetPage(name: "/", page: () => ProductDetails()),
//  Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetpassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(
      name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),
  //
  GetPage(name: AppRoute.homepage, page: () => const HomeScreen()), 
  GetPage(name: AppRoute.items, page: () => const Items()), 
  GetPage(name: AppRoute.productdetails, page: () => const ProductDetails()), 
  GetPage(name: AppRoute.myfavroite, page: () => const myfavorite()),
  GetPage(name: AppRoute.cart, page: () => const cart()),
  GetPage(name: AppRoute.addressview, page: () => const AddressView()),
  GetPage(name: AppRoute.addressadd, page: () => const AddressAdd()),
  GetPage(name: AppRoute.addressadddetails, page: () => const AddressAddDetails()),
  GetPage(name: AppRoute.checkout, page: () => const checkout())
];
