import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_timezone/flutter_timezone.dart';

import '../main.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Globs {
  static Future<void> saveAuthToken(String authToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('auth_token', authToken);
  }

  // Phương thức để lấy auth_token từ SharedPreferences
  static Future<String?> getAuthToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  static Future<void> saveUsername(String userName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_name', userName);
  }

  static Future<String?> getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_name');
  }

  static Future<void> saveUserId(int userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('user_id', userId);
  }

  static Future<int?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('user_id');
  }

  static const appName = "Online Groceries";

  static const userPayload = "user_payload";
  static const userLogin = "user_login";

  static void showHUD({String status = "loading ....."}) async {
    await Future.delayed(const Duration(milliseconds: 1));
    EasyLoading.show(status: status);
  }

  static void hideHUD() {
    EasyLoading.dismiss();
  }

  static void udSet(dynamic data, String key) {
    var jsonStr = json.encode(data);
    prefs?.setString(key, jsonStr);
  }

  static void udStringSet(String data, String key) {
    prefs?.setString(key, data);
  }

  static void udBoolSet(bool data, String key) {
    prefs?.setBool(key, data);
  }

  static void udIntSet(int data, String key) {
    prefs?.setInt(key, data);
  }

  static void udDoubleSet(double data, String key) {
    prefs?.setDouble(key, data);
  }

  static dynamic udValue(String key) {
    return json.decode(prefs?.get(key) as String? ?? "{}");
  }

  static String udValueString(String key) {
    return prefs?.get(key) as String? ?? "";
  }

  static bool udValueBool(String key) {
    return prefs?.get(key) as bool? ?? false;
  }

  static bool udValueTrueBool(String key) {
    return prefs?.get(key) as bool? ?? true;
  }

  static int udValueInt(String key) {
    return prefs?.get(key) as int? ?? 0;
  }

  static double udValueDouble(String key) {
    return prefs?.get(key) as double? ?? 0.0;
  }

  static void udRemove(String key) {
    prefs?.remove(key);
  }

  static Future<String> timeZone() async {
    try {
      return await FlutterTimezone.getLocalTimezone();
    } on PlatformException {
      return "";
    }
  }
}

class SVKey {
  // static const mainUrl = "https://d988-2001-ee0-2e7-9c74-cce4-2fc8-6839-c22e.ngrok-free.app";
  static const mainUrl = "http://localhost:8800";

  // Hàm để lấy IPv4 Address từ thiết bị
  static const baseUrl = '$mainUrl/api/v1/';
  static const nodeUrl = mainUrl;

  static const svLogin = '${baseUrl}auth/login';
  static const svSignUp = '${baseUrl}sign_up';
  
  static const svHomeExlusiveOffer = '${baseUrl}home_exlusive_offer';
  static const svHomeBestSelling = '${baseUrl}home_best_selling';
  static const svHomeGroceries = '${baseUrl}home_groceries';
  static const svHomeAllProducts = '${baseUrl}home_all_products';

  static const svProductDetail = '${baseUrl}product_detail';
  static const svAddRemoveFavorite = '${baseUrl}add_remove_favorite';
  static const svFavorite = '${baseUrl}favorite_list';
  static const svExploreList = '${baseUrl}explore_category_list';
  static const svExploreItemList = '${baseUrl}explore_category_items_list';
  static const svSearchProduct = '${baseUrl}search_products';

  static const svAddToCart = '${baseUrl}add_to_cart';
  static const svUpdateCart = '${baseUrl}update_cart';
  static const svRemoveCart = '${baseUrl}remove_cart';
  static const svCartList = '${baseUrl}cart_list';
  static const svOrderPlace = '${baseUrl}order_place';

  static const svAddDeliveryAddress = '${baseUrl}add_delivery_address';
  static const svUpdateDeliveryAddress = '${baseUrl}update_delivery_address';
  static const svDeleteDeliveryAddress = '${baseUrl}delete_delivery_address';
  static const svDeliveryAddress = '${baseUrl}delivery_address';

  static const svAddPaymentMethod = '${baseUrl}add_payment_method';
  static const svRemovePaymentMethod = '${baseUrl}remove_payment_method';
  static const svPaymentMethodList = '${baseUrl}payment_method';

  static const svReviewsList = '${baseUrl}product_reviews';
  static const svAddReview = '${baseUrl}add_product_review';
  static const svUserInfo = '${baseUrl}user_info';

  static const svMarkDefaultDeliveryAddress =
      '${baseUrl}mark_default_delivery_address';

  static const svPromoCodeList = '${baseUrl}promo_code_list';
  static const svMyOrders = '${baseUrl}my_order';
  static const svMyOrdersDetail = '${baseUrl}my_order_detail';

  static const svNotificationList = '${baseUrl}notification_list';
  static const svNotificationReadAll = '${baseUrl}notification_read_all';

  static const svUpdateProfile = '${baseUrl}update_profile';
  static const svChangePassword = '${baseUrl}change_password';
  static const svForgotPasswordRequest = '${baseUrl}forgot_password_request';
  static const svForgotPasswordVerify = '${baseUrl}forgot_password_verify';
  static const svForgotPasswordSetPassword =
      '${baseUrl}forgot_password_set_password';

  static const svAddCoin = '${baseUrl}add_coin_review';
  static const svUseCoin = '${baseUrl}use_coin_for_order';

  //admin
  static const adminUrl = '$mainUrl/api/admin/';

  static const newOrdersList = '${baseUrl}receipt/admin';
  static const completedOrdersList = '${adminUrl}completed_orders_list';
  static const cancelDeclineOrdersList =
      '${adminUrl}cancel_decline_orders_list';

  static const svGetProductsList = '${baseUrl}products?current=1&pageSize=111111';

  static const svCreateProduct = '${baseUrl}products';
  static const svUploadFile = '${baseUrl}files/file';
  static const svUpdateProduct = '${baseUrl}products';
  static const svDeleteProduct = '${baseUrl}products';

  static const svGetBrandList = '${adminUrl}brand_list';
  static const svCreateBrand = '${adminUrl}brand_add';
  static const svUpdateBrand = '${adminUrl}brand_update';
  static const svDeleteBrand = '${adminUrl}brand_delete';

  static const svGetTypeList = '${adminUrl}product_type_list';
  static const svCreateType = '${adminUrl}product_type_add';
  static const svUpdateType = '${adminUrl}product_type_update';
  static const svDeleteType = '${adminUrl}product_type_delete';

  static const svGetCategoryList = '${baseUrl}categories?current=1&pageSize=11111';
  static const svCreateCategory = '${baseUrl}categories';
  static const svUpdateCategory = '${baseUrl}categories';
  static const svDeleteCategory = '${baseUrl}categories';

  static const svGetSalesData = '${adminUrl}sales_summary';
  static const svGetNewOrders = '${baseUrl}receipts/admin?statusSupplier=UNCONFIRMED';
  static const svGetCompletedOrders = '${baseUrl}receipts/admin?statusSupplier=DELIVERED';
  static const svGetAcceptedOrders = '${baseUrl}receipts/admin?statusSupplier=CONFIRMED';
  static const svGetProcessingOrders = '${baseUrl}receipts/admin?statusSupplier=PREPARE';
  static const svGetDeliveringOrders = '${baseUrl}receipts/admin?statusSupplier=ON_DELIVERY';
  static const svGetCanceledOrders = '${baseUrl}receipts/admin?statusSupplier=CANCEL';
  static const svOrderStatusChange = '${baseUrl}receipts/status';
  static const svAdminOrderDetail = '${adminUrl}order_detail';


  static const svTotalOrderSummary = '${adminUrl}total_order_summary';
  static const svTotalPriceSummary = '${adminUrl}total_price_summary';

  static const svGetUserList = '${baseUrl}users?current=1&pageSize=111111';
  static const svDeleteUser = '${baseUrl}user_delete';
  static const svGetNotificationReviewList = '${adminUrl}notification_list';
  static const svTop10Product = '${adminUrl}home_best_selling';
}

class KKey {
  static const payload = "payload";
  static const status = "status";
  static const message = "message";
  static const authToken = "auth_token";
  static const name = "name";
  static const email = "email";
  static const mobile = "mobile";
  static const address = "address";
  static const userId = "user_id";
  static const resetCode = "reset_code";
  static const data = "data";
  // static const  = "";
  // static const  = "";
  // static const  = "";
  // static const  = "";
  // static const  = "";
  // static const  = "";
  // static const  = "";
  // static const  = "";
  // static const  = "";
  // static const  = "";
  // static const  = "";
  // static const  = "";
  // static const  = "";
  // static const  = "";
}

class MSG {
  static const enterEmail = "Please enter your valid email address.";
  static const enterName = "Please enter your name.";
  static const enterCode = "Please enter valid reset code.";

  static const enterMobile = "Please enter your valid mobile number.";
  static const enterAddress = "Please enter your address.";
  static const enterPassword =
      "Please enter password minimum 6 characters at least.";
  static const enterPasswordNotMatch = "Please enter password not match.";
  static const success = "success";
  static const fail = "fail";
}
