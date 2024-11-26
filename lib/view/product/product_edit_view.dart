import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_groceries_shop_app_flutter_admin/common/color_extension.dart';
import 'package:online_groceries_shop_app_flutter_admin/common/extension.dart';
import 'package:online_groceries_shop_app_flutter_admin/common/globs.dart';
import 'package:online_groceries_shop_app_flutter_admin/common/service_call.dart';
import 'package:online_groceries_shop_app_flutter_admin/common_widget/image_picker_view.dart';
import 'package:online_groceries_shop_app_flutter_admin/common_widget/line_dropdown_button.dart';
import 'package:online_groceries_shop_app_flutter_admin/common_widget/line_textfield.dart';
import 'package:online_groceries_shop_app_flutter_admin/common_widget/popup_layout.dart';
import 'package:online_groceries_shop_app_flutter_admin/common_widget/round_button.dart';
import 'package:online_groceries_shop_app_flutter_admin/model/category_detail_model_new.dart';
import 'package:online_groceries_shop_app_flutter_admin/model/product_detail_model.dart';
import 'package:online_groceries_shop_app_flutter_admin/model/product_detail_model_new.dart';
import 'package:online_groceries_shop_app_flutter_admin/view_model/product_management_view_model.dart';
import 'package:http/http.dart' as http;

class UpdateProductScreen extends StatefulWidget {
  final ProductDetailModelNew? pObj;

  const UpdateProductScreen({Key? key, this.pObj}) : super(key: key);
  @override
  _UpdateProductScreenState createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  TextEditingController txtCatName = TextEditingController();
  TextEditingController txtProName = TextEditingController();
  TextEditingController txtDetail = TextEditingController();
  TextEditingController txtBrand = TextEditingController();
  TextEditingController txtShopName = TextEditingController();
  TextEditingController txtQuantity = TextEditingController();
  TextEditingController txtPrice = TextEditingController();
  TextEditingController txtDiscount = TextEditingController();
  File? selectImage;
  List categoryArr = [];

  Map? selectCateObj;
  bool isSelected = false;
  int otherFlag = 0;
  final ProductManagementViewModel prodVM =
      Get.put(ProductManagementViewModel());

  @override
  void initState() {
    super.initState();
    final product = widget.pObj;
    txtCatName.text = product?.category ?? "";
    txtProName.text = product?.name ?? "";
    txtDetail.text = product?.description ?? "";
    txtBrand.text = product?.brand ?? "";
    txtShopName.text = product?.shopName ?? "";
    txtQuantity.text = product?.quantity.toString() ?? "";
    txtPrice.text = product?.price.toString() ?? "";
    txtDiscount.text = product?.discount.toString() ?? "";
    getCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Update Product",
          style: TextStyle(
            color: TColor.primaryText,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              LineDropDownButton(
                title: "Category",
                hintText: "Select Category",
                itemsArr: categoryArr,
                selectVal: selectCateObj,
                didChanged: (cObj) {
                  selectCateObj = cObj;
                  if (cObj["_id"] == 0) {
                    otherFlag = 1;
                  } else {
                    //getCategoryList();
                  }
                  setState(() {});
                },
                displayKey: "name",
              ),
              const SizedBox(
                height: 8,
              ),
              if ((selectCateObj?["_id"] as int? ?? -1) == 0)
                LineTextField(
                  title: "Enter Category",
                  placeholder: "Enter category name",
                  controller: txtCatName,
                ),
              SizedBox(height: 16.0),
              LineTextField(
                title: 'Product Name',
                placeholder: 'Enter Product Name',
                controller: txtProName,
              ),
              SizedBox(height: 16.0),
              LineTextField(
                title: 'Product Detail',
                placeholder: 'Enter Product Detail',
                controller: txtDetail,
              ),
              SizedBox(height: 16.0),
              LineTextField(
                title: 'Brand Name',
                placeholder: 'Enter Brand Name',
                controller: txtBrand,
              ),
              SizedBox(height: 16.0),
              LineTextField(
                title: 'Shop Name',
                placeholder: 'Enter Shop Name',
                controller: txtShopName,
              ),
              SizedBox(height: 16.0),
              LineTextField(
                title: 'Quantity',
                placeholder: 'Enter Quantity',
                controller: txtQuantity,
                keyboardType: TextInputType.number, // Allow numeric input

              ),
              SizedBox(height: 16.0),
              LineTextField(
                title: 'Price',
                placeholder: 'Enter Price',
                controller: txtPrice,
                keyboardType: TextInputType.number, // Allow numeric input
              ),
              SizedBox(height: 16.0),
              LineTextField(
                title: 'Discount',
                placeholder: 'Enter Discount',
                controller: txtDiscount,
                keyboardType: TextInputType.number, // Allow numeric input
              ),
              SizedBox(height: 25),
              RoundButton(
                onPressed: submitProductAction,
                title: "Update Product",
              ),
            ],
          ),
        ),
      ),
    );
  }

void getCategoryList() {
  Globs.showHUD();
  ServiceCall.get(
    SVKey.svGetCategoryList,
    isToken: true,
    withSuccess: (resObj) async {
      Globs.hideHUD();
      categoryArr = [];
      var data = resObj['data'];

      if (data is Map && data.containsKey('result') && data['result'] is List) {
        var result = data['result'] as List;

        // Chuyển đổi danh sách JSON thành danh sách đối tượng CategoryDetailModelNew
        var categoryDetailsDataList = result.map((obj) {
          var tmp = CategoryDetailModelNew.fromJson(obj);
          return {
            'id': tmp.id,
            'name': tmp.name,
          };
        }).toList();

        // Gán giá trị cho danh sách categoryArr
        categoryArr = categoryDetailsDataList;
      } else {
        // Xử lý lỗi nếu data không hợp lệ
        categoryArr = [];
      }

      // Cập nhật giao diện
      setState(() {});
    },
    failure: (err) async {
      Globs.hideHUD();
      // Hiển thị thông báo lỗi
      mdShowAlert("Error", err, () {});
    },
  );
}


  void submitProductAction() {
    if (selectCateObj == null) {
      mdShowAlert("Error", "Please select the category", () {});
      return;
    }

    if (otherFlag == 1 && txtCatName.text.isEmpty) {
      mdShowAlert("Error", "Please enter the category name", () {});
      return;
    }

    if (txtProName.text.isEmpty) {
      mdShowAlert("Error", "Please enter the product name", () {});
      return;
    }

    if (txtDetail.text.isEmpty) {
      mdShowAlert("Error", "Please enter the product detail", () {});
      return;
    }

    if (txtBrand.text.isEmpty) {
      mdShowAlert("Error", "Please enter the unit name", () {});
      return;
    }

    if (txtShopName.text.isEmpty) {
      mdShowAlert("Error", "Please enter the Shop Name", () {});
      return;
    }

    if (txtQuantity.text.isEmpty) {
      mdShowAlert("Error", "Please enter the Quantity", () {});
      return;
    }

    if (txtPrice.text.isEmpty) {
      mdShowAlert("Error", "Please enter the price", () {});
      return;
    }
    if (txtDiscount.text.isEmpty) {
      mdShowAlert("Error", "Please enter the price", () {});
      return;
    }

    endEditing();
    Map<String, dynamic> parameters = {
    "name": txtProName.text, // String
    "category": otherFlag == 1
        ? txtCatName.text // String
        : selectCateObj?["id"], // String hoặc null
    "brand": txtBrand.text, // String
    "shopName": txtShopName.text, // String
    "quantity": int.parse(txtQuantity.text), // Chuyển sang int
    "price": int.parse(txtPrice.text), // Chuyển sang int
    "description": txtDetail.text, // String
    "discount": int.parse(txtDiscount.text) , // Chuyển sang int
    "_id": widget.pObj?.id ?? "" // String hoặc null
  };
    sendProductData(parameters);
  }
Future<void> sendProductData(Map<String, dynamic> parameter) async {

  String jsonString = json.encode(parameter);
  String? token = await Globs.getAuthToken(); // Lấy token
        var headers = {
          'Content-Type': 'application/json',
          if (token != null)
            'Authorization': 'Bearer $token', // Thêm header nếu token tồn tại
        };
  var response = await http.patch(
    Uri.parse( SVKey.svUpdateProduct),
    headers: headers,
    body: jsonString, // gửi dữ liệu dưới dạng JSON
  );

  if (response.statusCode == 200) {
     mdShowAlert("Success", "Product updated successfully", () {
          Navigator.pop(context);
        });
  } else {
   mdShowAlert("Error", "Product update fail", () {});
  }
}
  
}

// END: abpxx6d04wxr
