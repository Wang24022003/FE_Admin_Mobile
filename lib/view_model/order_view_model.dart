import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_groceries_shop_app_flutter_admin/model/order_management_model.dart';
import 'package:online_groceries_shop_app_flutter_admin/model/order_management_model_new.dart';

import '../common/globs.dart';
import '../common/service_call.dart';

class OrderViewModel extends GetxController {
  final RxList<OrderModelNew> neworderList = <OrderModelNew>[].obs;
  final RxList<OrderModelNew> completedorderList = <OrderModelNew>[].obs;
  final RxList<OrderModelNew> acceptedOrderList = <OrderModelNew>[].obs;
  final RxList<OrderModelNew> processingOrderList = <OrderModelNew>[].obs;
  final RxList<OrderModelNew> deliveringOrderList = <OrderModelNew>[].obs;
  final RxList<OrderModelNew> canceledOrderList = <OrderModelNew>[].obs;

  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }
//placed
  void getNewOrderData() async {
  Globs.showHUD();
  ServiceCall.get(
    SVKey.svGetNewOrders,
    isToken: true,
    withSuccess: (resObj) async {
      Globs.hideHUD();

      // Lấy data từ response
      var data = resObj['data'];

      // Kiểm tra tính hợp lệ của data
      if (data is Map && data.containsKey('result') && data['result'] is List) {
        var result = data['result'] as List;

        // Chuyển đổi danh sách JSON thành danh sách đối tượng OrderModelNew
        var orderDataList = result.map((obj) {
          // print('Đối tượng JSON: $obj');
          return OrderModelNew.fromJson(obj);
        }).toList();

        // Gán giá trị cho danh sách neworderList
        neworderList.value = orderDataList;

      } else {
        // Nếu không hợp lệ, hiển thị thông báo lỗi
        Get.snackbar(Globs.appName, "Không tìm thấy dữ liệu đơn hàng mới");
      }
    },
    failure: (err) async {
      Globs.hideHUD();
      Get.snackbar(Globs.appName, err.toString());
    },
  );
}

  void getCompletedOrderData() async {
  Globs.showHUD();
  ServiceCall.get(
    SVKey.svGetCompletedOrders,
    isToken: true,
    withSuccess: (resObj) async {
      Globs.hideHUD();

      // Lấy data từ response
      var data = resObj['data'];

      // Kiểm tra tính hợp lệ của data
      if (data is Map && data.containsKey('result') && data['result'] is List) {
        var result = data['result'] as List;

        // Chuyển đổi danh sách JSON thành danh sách đối tượng OrderModelNew
        var orderDataList = result.map((obj) {
          // print('Đối tượng JSON: $obj');
          return OrderModelNew.fromJson(obj);
        }).toList();

        // Gán giá trị cho danh sách neworderList
        completedorderList.value = orderDataList;

      } else {
        // Nếu không hợp lệ, hiển thị thông báo lỗi
        Get.snackbar(Globs.appName, "Không tìm thấy dữ liệu đơn hàng mới");
      }
    },
    failure: (err) async {
      Globs.hideHUD();
      Get.snackbar(Globs.appName, err.toString());
    },
  );
}

  void getAcceptedOrderData() async {
  Globs.showHUD();
  ServiceCall.get(
    SVKey.svGetAcceptedOrders,
    isToken: true,
    withSuccess: (resObj) async {
      Globs.hideHUD();

      // Lấy data từ response
      var data = resObj['data'];

      // Kiểm tra tính hợp lệ của data
      if (data is Map && data.containsKey('result') && data['result'] is List) {
        var result = data['result'] as List;

        // Chuyển đổi danh sách JSON thành danh sách đối tượng OrderModelNew
        var orderDataList = result.map((obj) {
          // print('Đối tượng JSON: $obj');
          return OrderModelNew.fromJson(obj);
        }).toList();

        // Gán giá trị cho danh sách neworderList
        acceptedOrderList.value = orderDataList;

      } else {
        // Nếu không hợp lệ, hiển thị thông báo lỗi
        Get.snackbar(Globs.appName, "Không tìm thấy dữ liệu đơn hàng mới");
      }
    },
    failure: (err) async {
      Globs.hideHUD();
      Get.snackbar(Globs.appName, err.toString());
    },
  );
}

  void getProcessingOrderData() async {
  Globs.showHUD();
  ServiceCall.get(
    SVKey.svGetProcessingOrders,
    isToken: true,
    withSuccess: (resObj) async {
      Globs.hideHUD();

      // Lấy data từ response
      var data = resObj['data'];

      // Kiểm tra tính hợp lệ của data
      if (data is Map && data.containsKey('result') && data['result'] is List) {
        var result = data['result'] as List;

        // Chuyển đổi danh sách JSON thành danh sách đối tượng OrderModelNew
        var orderDataList = result.map((obj) {
          // print('Đối tượng JSON: $obj');
          return OrderModelNew.fromJson(obj);
        }).toList();

        // Gán giá trị cho danh sách neworderList
        processingOrderList.value = orderDataList;

      } else {
        // Nếu không hợp lệ, hiển thị thông báo lỗi
        Get.snackbar(Globs.appName, "Không tìm thấy dữ liệu đơn hàng mới");
      }
    },
    failure: (err) async {
      Globs.hideHUD();
      Get.snackbar(Globs.appName, err.toString());
    },
  );
}

  void getDeliveringOrderData() async {
  Globs.showHUD();
  ServiceCall.get(
    SVKey.svGetDeliveringOrders,
    isToken: true,
    withSuccess: (resObj) async {
      Globs.hideHUD();

      // Lấy data từ response
      var data = resObj['data'];

      // Kiểm tra tính hợp lệ của data
      if (data is Map && data.containsKey('result') && data['result'] is List) {
        var result = data['result'] as List;

        // Chuyển đổi danh sách JSON thành danh sách đối tượng OrderModelNew
        var orderDataList = result.map((obj) {
          // print('Đối tượng JSON: $obj');
          return OrderModelNew.fromJson(obj);
        }).toList();

        // Gán giá trị cho danh sách neworderList
        deliveringOrderList.value = orderDataList;

      } else {
        // Nếu không hợp lệ, hiển thị thông báo lỗi
        Get.snackbar(Globs.appName, "Không tìm thấy dữ liệu đơn hàng mới");
      }
    },
    failure: (err) async {
      Globs.hideHUD();
      Get.snackbar(Globs.appName, err.toString());
    },
  );
}

  void getCanceledOrderData() async {
  Globs.showHUD();
  ServiceCall.get(
    SVKey.svGetCanceledOrders,
    isToken: true,
    withSuccess: (resObj) async {
      Globs.hideHUD();

      // Lấy data từ response
      var data = resObj['data'];

      // Kiểm tra tính hợp lệ của data
      if (data is Map && data.containsKey('result') && data['result'] is List) {
        var result = data['result'] as List;

        // Chuyển đổi danh sách JSON thành danh sách đối tượng OrderModelNew
        var orderDataList = result.map((obj) {
          // print('Đối tượng JSON: $obj');
          return OrderModelNew.fromJson(obj);
        }).toList();

        // Gán giá trị cho danh sách neworderList
        canceledOrderList.value = orderDataList;

      } else {
        // Nếu không hợp lệ, hiển thị thông báo lỗi
        Get.snackbar(Globs.appName, "Không tìm thấy dữ liệu đơn hàng mới");
      }
    },
    failure: (err) async {
      Globs.hideHUD();
      Get.snackbar(Globs.appName, err.toString());
    },
  );
}

  void updateOrderStatus({
    required String orderId,
    
    required String orderStatus,
  }) async {
    Globs.showHUD();
    ServiceCall.patch(
      {
        '_id': orderId,
        'statusSupplier': orderStatus,
      },
      SVKey.svOrderStatusChange,
      isToken: true,
      withSuccess: (resObj) async {
        Globs.hideHUD();
        if (resObj['data']) {
          getNewOrderData();
          getCompletedOrderData();
          getAcceptedOrderData();
          getProcessingOrderData();
          getDeliveringOrderData();
          getCanceledOrderData();
        } else {
          Get.snackbar(Globs.appName, "Failed to update order status");
        }
      },
      failure: (err) async {
        Globs.hideHUD();
        Get.snackbar(Globs.appName, err.toString());
      },
    );
  }

}
