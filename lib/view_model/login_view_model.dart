import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_groceries_shop_app_flutter_admin/common/globs.dart';
import 'package:online_groceries_shop_app_flutter_admin/common/service_call.dart';
import 'package:online_groceries_shop_app_flutter_admin/view_model/splash_view_model.dart';

class LoginViewModel extends GetxController {
  final txtEmail = TextEditingController().obs;
  final txtPassword = TextEditingController().obs;
  final isShowPassword = false.obs;

  final isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    if (kDebugMode) {
      print("LoginViewModel Init ");
    }
    txtEmail.value.text = "uyenbao4a5@gmail.com";
    txtPassword.value.text = "123456";
  }

  //ServiceCall
  void serviceCallLogin() {

     if (!GetUtils.isEmail(txtEmail.value.text)) {
      Get.snackbar(Globs.appName, "Pleaser enter valid email address");
      return;
    }

    if (txtPassword.value.text.length < 6) {
      Get.snackbar(
          Globs.appName, "Pleaser enter valid password min 6 character");
      return;
    }

      Globs.showHUD();

      ServiceCall.post({
        "username": txtEmail.value.text,
        "password": txtPassword.value.text,
        // "access_token": ""
      }, SVKey.svLogin, withSuccess: (resObj) async {
        Globs.hideHUD();
        var data = resObj["data"];
        if( data  != null) {
       
          Map<String, dynamic>  payload = resObj[KKey.payload] as Map<String, dynamic> ? ?? {};
          Globs.udSet(payload, Globs.userPayload);
          Globs.udBoolSet(true, Globs.userLogin);
          
          Get.delete<LoginViewModel>();
          Get.find<SplashViewModel>().goAfterLoginMainTab();
          
        }else{

        }

        Get.snackbar(Globs.appName, resObj["message"].toString());
      }, failure: (err) async {
         Globs.hideHUD();
          Get.snackbar(Globs.appName, err.toString());
      } );
    

  }

  void showPassword() {
    isShowPassword.value = !isShowPassword.value;
  }
}
