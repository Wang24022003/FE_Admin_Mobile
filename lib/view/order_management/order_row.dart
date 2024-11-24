import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_groceries_shop_app_flutter_admin/common/color_extension.dart';
import 'package:online_groceries_shop_app_flutter_admin/model/my_order_model.dart';
import 'package:online_groceries_shop_app_flutter_admin/model/order_management_model.dart';
import 'package:online_groceries_shop_app_flutter_admin/model/order_management_model_new.dart';
import 'package:online_groceries_shop_app_flutter_admin/view_model/order_view_model.dart';

class OrderRow extends StatelessWidget {
  final OrderModelNew mObj;
  final VoidCallback onTap;
  final OrderViewModel orderViewModel;
  final Function(OrderModelNew) updateOrderStatusCallback;

  const OrderRow(
      {super.key,
      required this.mObj,
      required this.onTap,
      required this.orderViewModel,
      required this.updateOrderStatusCallback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 2)
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Order No: #",
                    style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Expanded(
                      child: Text(
                    mObj.id?.toString() ?? "",
                    style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  )),
                  getNextStatusText(mObj) != ""
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                          ),
                          onPressed: () {
                            //Xử lý khi nhấn vào nút
                            switch (mObj.statusSupplier) {
                              case 'UNCONFIRMED':
                                // Nếu trạng thái đơn hàng là "Placed", thực hiện cập nhật trạng thái thành "Accepted"
                                orderViewModel.updateOrderStatus(
                                  orderId: mObj.id ?? "",
                                  orderStatus:
                                      'CONFIRMED', // Cập nhật trạng thái thành 2 (Accepted)
                                );
                                break;
                              case 'CONFIRMED':
                                // Nếu trạng thái đơn hàng là "Accepted", thực hiện cập nhật trạng thái thành "Processing"
                                orderViewModel.updateOrderStatus(
                                  orderId: mObj.id ?? "",
                                  orderStatus:
                                      'PREPARE', // Cập nhật trạng thái thành 3 (Processing)
                                );
                                break;
                              case 'PREPARE':
                                // Nếu trạng thái đơn hàng là "Processing", thực hiện cập nhật trạng thái thành "Delivering"
                                orderViewModel.updateOrderStatus(
                                  orderId: mObj.id ?? "",
                                  orderStatus:
                                      'ON_DELIVERY', // Cập nhật trạng thái thành 4 (Delivering)
                                );
                                break;
                              case 'ON_DELIVERY':
                                // Nếu trạng thái đơn hàng là "Delivering", thực hiện cập nhật trạng thái thành "Delivered"
                                orderViewModel.updateOrderStatus(
                                  orderId: mObj.id ?? "",
                                  orderStatus:
                                      'DELIVERED', // Cập nhật trạng thái thành 5 (Delivered)
                                );
                                break;
                              default:
                                // Trạng thái không hợp lệ
                                break;
                            }
                            updateOrderStatusCallback(mObj);
                          },
                          child: Text(
                            getNextStatusText(mObj),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        )
                      : SizedBox(width: 8),
                ],
              ),
              Text(
                mObj.createdAt.toString() ?? "",
                style: TextStyle(color: TColor.secondaryText, fontSize: 12),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Row(
                            children: [
                              Text(
                                "Payment Type: ",
                                style: TextStyle(
                                    color: TColor.primaryText,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              ),
                              Expanded(
                                  child: Text(
                                getPaymentType(mObj),
                                style: TextStyle(
                                    color: TColor.primaryText,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              )),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Payment Status: ",
                                style: TextStyle(
                                    color: TColor.primaryText,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              ),
                              Expanded(
                                  child: Text(
                                getPaymentStatus(mObj),
                                style: TextStyle(
                                    color: getPaymentStatusColor(mObj),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              )),
                            ],
                          ),
                        ]),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

String getOrderStatus(OrderModelNew mObj) {
  switch (mObj.statusSupplier) {
     case 'CONFIRMED':
      return 'CONFIRMED';
    case 'UNCONFIRMED':
      return 'UNCONFIRMED';
    case 'PREPARE':
      return 'PREPARE';
    case 'ON_DELIVERY':
      return 'ON_DELIVERY';
    case 'CANCEL':
      return 'CANCEL';
    case 'DELIVERED':
      return 'DELIVERED';
    default:
      return '';
    
  }
}


String getPaymentType(OrderModelNew mObj) {
  switch (mObj.paymentMethod) {
    case 'COD':
      return "Cash On Delivery";
    case 'VNPAY':
      return "Online Card Payment";
    default:
      return "";
  }
}

String getPaymentStatus(OrderModelNew mObj) {
  //1: waiting, 2: done, 3: fail, 4: refund

  if (mObj.paymentMethod == 1) {
    return "COD";
  }
  switch (mObj.isCheckout) {
    case true:
      return "ĐÃ THANH TOÁN";
    case false:
      return "CHƯA THANH TOÁN";
    
    default:
      return "";
  }
}

Color getPaymentStatusColor(OrderModelNew mObj) {
  //1: waiting, 2: done, 3: fail, 4: refund

  if (mObj.statusUser == 'CONFIRMED') {
    return Colors.orange;
  }
  switch (mObj.statusUser) {
    case 'CONFIRMED':
      return Colors.blue;
    case 'UNCONFIRMED':
      return Colors.blue;
    case 'PREPARE':
      return Colors.green;
    case 'ON_DELIVERY':
      return Colors.red;
    case 'CANCEL':
      return Colors.red;
    case 'DELIVERED':
      return Colors.green;
    default:
      return Colors.white;
  }
}

Color getOrderStatusColor(OrderModelNew mObj) {
  //1: new, 2: order_accept, 3: order_delivered, 4: cancel, 5: order declined
  switch (mObj.statusSupplier) {
   case 'CONFIRMED':
      return Colors.blue;
    case 'UNCONFIRMED':
      return Colors.blue;
    case 'PREPARE':
      return Colors.green;
    case 'ON_DELIVERY':
      return Colors.red;
    case 'CANCEL':
      return Colors.red;
    case 'DELIVERED':
      return Colors.green;
    default:
      return Colors.white;
  }
}

String getNextStatusText(OrderModelNew mObj) {
  switch (mObj.statusSupplier) {
     case 'CONFIRMED':
      return 'CONFIRMED';
    case 'UNCONFIRMED':
      return 'UNCONFIRMED';
    case 'PREPARE':
      return 'PREPARE';
    case 'ON_DELIVERY':
      return 'ON_DELIVERY';
    case 'CANCEL':
      return 'CANCEL';
    case 'DELIVERED':
      return 'DELIVERED';
    default:
      return '';
  }
}
