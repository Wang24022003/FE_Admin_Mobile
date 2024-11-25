import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_groceries_shop_app_flutter_admin/common/globs.dart';
import 'package:online_groceries_shop_app_flutter_admin/common/service_call.dart';
import 'package:online_groceries_shop_app_flutter_admin/model/category_detail_model_new.dart';

import '../model/category_detail_model.dart';

class CategoryDetailViewModel extends GetxController {
  final txtCatName = TextEditingController().obs;
  final txtColor = TextEditingController().obs;
  File? selectImage;
  final RxList<CategoryDetailModelNew> categoryDetails =
      <CategoryDetailModelNew>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    if (kDebugMode) {
      print("Category Detail Init ");
    }
    fetchCategoryDetails();
  }


  void fetchCategoryDetails() async {
    Globs.showHUD();
    ServiceCall.get(
    SVKey.svGetCategoryList,
    isToken: true,
    withSuccess: (resObj) async {
      Globs.hideHUD();
       // Lấy data từ response
      var data = resObj['data'];

      // Kiểm tra tính hợp lệ của data
      if (data is Map && data.containsKey('result') && data['result'] is List) {
        var result = data['result'] as List;

        // Chuyển đổi danh sách JSON thành danh sách đối tượng OrderModelNew
        var categoryDetailsDataList = result.map((obj) {
      
          return CategoryDetailModelNew.fromJson(obj);
        }).toList();
        categoryDetails.value = categoryDetailsDataList;
          print("Category Details: $categoryDetails");
      }
        else {
          Get.snackbar(Globs.appName, "Failed to fetch category details");
        }
      },
      failure: (err) async {
        Globs.hideHUD();
        Get.snackbar(Globs.appName, err.toString());
      },
    );
  }

  void setDataModel(CategoryDetailModelNew cObj) {
    txtCatName.value.text = cObj.name ?? "";
    txtColor.value.text = "" ?? "";
    selectImage = cObj.imageUrl != null ? File(cObj.imageUrl!) : null;
  }

  void clearAll() {
    txtCatName.value.text = "";
    txtColor.value.text = "";
    selectImage = null;
  }

  void createCategoryDetail(VoidCallback didDone) {
    if (txtCatName.value.text.isEmpty) {
      Get.snackbar(Globs.appName, "Please enter category name");
      return;
    }
    

    Globs.showHUD();
    ServiceCall.post(
      {
        "name": txtCatName.value.text,
        "url": 'https://t4.ftcdn.net/jpg/03/85/95/63/360_F_385956366_Zih7xDcSLqDxiJRYUfG5ZHNoFCSLMRjm.jpg'
      },
      SVKey.svCreateCategory,
      isToken: true,
      
      withSuccess: (resObj) async {
        Globs.hideHUD();
        Get.snackbar(Globs.appName, "Thêm Category thành công");

        if (resObj["data"]) {
          //didDone();
          fetchCategoryDetails();
        } else {
          Get.snackbar(Globs.appName, "Failed to create category detail");
        }
      },
      failure: (err) async {
        Globs.hideHUD();
        Get.snackbar(Globs.appName, err.toString());
      },
    );
  }

  void updateCategoryDetail(String catID, VoidCallback didDone) {
    if (txtCatName.value.text.isEmpty) {
      Get.snackbar(Globs.appName, "Please enter category name");
      return;
    }
    
    Globs.showHUD();
    ServiceCall.patch(
      {
        "_id": catID.toString(),
        "name": txtCatName.value.text,
        
      },
      SVKey.svUpdateCategory,
      isToken: true,
      withSuccess: (resObj) async {
        Get.snackbar(Globs.appName, "Cật nhật danh mục thành công");
        Globs.hideHUD();
        if (resObj["data"] ) {
          didDone();
          fetchCategoryDetails();
        } else {
          Get.snackbar(Globs.appName, "Failed to update category detail");
        }
      },
      failure: (err) async {
        Globs.hideHUD();
        Get.snackbar(Globs.appName, err.toString());
      },
    );
  }

  void deleteCategoryDetail(String categoryId) async {
    Globs.showHUD();
    ServiceCall.delete(
      {},
      SVKey.svDeleteCategory + "/$categoryId",
      isToken: true,
      withSuccess: (resObj) async {
        Globs.hideHUD();
        Get.snackbar(Globs.appName, "Xóa danh mục thành công");

        if (resObj["data"]) {
          Get.snackbar(Globs.appName, "Xóa danh mục thành công");
          fetchCategoryDetails();
        } else {
          Get.snackbar(Globs.appName, "Failed to delete category detail");
        }
      },
      failure: (err) async {
        Globs.hideHUD();
        Get.snackbar(Globs.appName, err.toString());
      },
    );
  }
}
