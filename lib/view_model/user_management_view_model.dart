import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_groceries_shop_app_flutter_admin/model/user_model.dart';
import 'package:online_groceries_shop_app_flutter_admin/model/user_model_new.dart';

import '../common/globs.dart';
import '../common/service_call.dart';

class UserManagementViewModel extends GetxController {
  final RxList<UserModelNew> userList = <UserModelNew>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSalesData();
  }

  void fetchSalesData() async {
    // Gọi hàm post
    Globs.showHUD();
    ServiceCall.get(
      SVKey.svGetUserList,
      isToken: true,
      withSuccess: (resObj) async {
        Globs.hideHUD();
      var data = resObj['data'];

      // Kiểm tra tính hợp lệ của data
      if (data is Map && data.containsKey('result') && data['result'] is List) {
        var result = data['result'] as List;

        var userDataList = result.map((obj) {
      
          return UserModelNew.fromJson(obj);
        }).toList();
        userList.value = userDataList;
          
      }
        else {
          Get.snackbar(Globs.appName, "Failed to fetch category details");
        }
      
        
      },
      failure: (err) async {
        // Xử lý lỗi từ server
        Globs.hideHUD();
        Get.snackbar(Globs.appName, err.toString());
      },
    );
  }

  // Function to delete a user
// Modify the deleteUser function to reload the user data after deletion

  void deleteUser(String userId) async {
    Globs.showHUD();
    ServiceCall.delete(
      {},
      SVKey.svDeleteUser+ "/$userId",
      isToken: true,
      withSuccess: (resObj) async {
        Globs.hideHUD();
        Get.snackbar(Globs.appName, "Xóa user thành công");
        if (resObj["data"]) {
          fetchSalesData();
        } else {
          Get.snackbar(
              Globs.appName, resObj["message"] ?? "Failed to delete user");
        }
      },
      failure: (err) async {
        Globs.hideHUD();
        Get.snackbar(Globs.appName, err.toString());
      },
    );
  }
}
