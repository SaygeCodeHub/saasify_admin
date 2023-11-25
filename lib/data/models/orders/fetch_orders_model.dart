import 'dart:convert';

FetchOrdersModel fetchOrdersModelFromJson(String str) =>
    FetchOrdersModel.fromJson(json.decode(str));

String fetchOrdersModelToJson(FetchOrdersModel data) =>
    json.encode(data.toJson());

class FetchOrdersModel {
  final int status;
  final OrdersData data;
  final String message;

  FetchOrdersModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory FetchOrdersModel.fromJson(Map<String, dynamic> json) =>
      FetchOrdersModel(
        status: json["status"],
        data: OrdersData.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
        "message": message,
      };
}

class OrdersData {
  final int totalOrders;
  final int unpaidOrders;
  final int totalEarning;
  final PaymentTypesUsage paymentTypesUsage;
  final List<Order> orders;

  OrdersData({
    required this.totalOrders,
    required this.unpaidOrders,
    required this.totalEarning,
    required this.paymentTypesUsage,
    required this.orders,
  });

  factory OrdersData.fromJson(Map<String, dynamic> json) => OrdersData(
        totalOrders: json["total_orders"],
        unpaidOrders: json["unpaid_orders"],
        totalEarning: json["total_earning"],
        paymentTypesUsage:
            PaymentTypesUsage.fromJson(json["payment_tyes_usage"]),
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total_orders": totalOrders,
        "unpaid_orers": unpaidOrders,
        "total_earning": totalEarning,
        "payment_tyes_usage": paymentTypesUsage.toJson(),
        "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
      };
}

class Order {
  final int orderId;
  final String orderNumber;
  final DateTime orderDate;
  final int customerContact;
  final String paymentStatus;
  final String paymentType;
  final String customerName;
  final num discountTotal;
  final num totalAmount;
  final num subtotal;
  final List<ItemsOrdered> itemsOrdered;

  Order({
    required this.orderId,
    required this.orderNumber,
    required this.orderDate,
    required this.customerContact,
    required this.paymentStatus,
    required this.paymentType,
    required this.customerName,
    required this.discountTotal,
    required this.totalAmount,
    required this.subtotal,
    required this.itemsOrdered,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        orderId: json["order_id"],
        orderNumber: json["order_number"],
        orderDate: DateTime.parse(json["order_date"]),
        customerContact: json["customer_contact"],
        paymentStatus: json["payment_status"],
        paymentType: json["payment_type"],
        customerName: json["customer_name"],
        discountTotal: json["discount_total"] ?? 0,
        totalAmount: json["total_amount"],
        subtotal: json["subtotal"],
        itemsOrdered: List<ItemsOrdered>.from(
            json["items_ordered"].map((x) => ItemsOrdered.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "order_number": orderNumber,
        "order_date": orderDate.toIso8601String(),
        "customer_contact": customerContact,
        "payment_status": paymentStatus,
        "payment_type": paymentType,
        "customer_name": customerName,
        "discount_total": discountTotal,
        "total_amount": totalAmount,
        "subtotal": subtotal,
        "items_ordered":
            List<dynamic>.from(itemsOrdered.map((x) => x.toJson())),
      };
}

class ItemsOrdered {
  final int categoryId;
  final String categoryName;
  final int productId;
  final String productName;
  final String brandName;
  final int brandId;
  final int variantId;
  final int cost;
  final int quantity;
  final int discountPercent;
  final int stock;
  final int stockId;
  final String productDescription;
  final List<String> images;
  final String unit;
  final int barcode;
  final bool draft;
  final int restockReminder;
  final int count;

  ItemsOrdered({
    required this.categoryId,
    required this.categoryName,
    required this.productId,
    required this.productName,
    required this.brandName,
    required this.brandId,
    required this.variantId,
    required this.cost,
    required this.quantity,
    required this.discountPercent,
    required this.stock,
    required this.stockId,
    required this.productDescription,
    required this.images,
    required this.unit,
    required this.barcode,
    required this.draft,
    required this.restockReminder,
    required this.count,
  });

  factory ItemsOrdered.fromJson(Map<String, dynamic> json) => ItemsOrdered(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        productId: json["product_id"],
        productName: json["product_name"],
        brandName: json["brand_name"],
        brandId: json["brand_id"],
        variantId: json["variant_id"],
        cost: json["cost"],
        quantity: json["quantity"],
        discountPercent: json["discount_percent"],
        stock: json["stock"],
        stockId: json["stock_id"],
        productDescription: json["product_description"],
        images: List<String>.from(json["images"].map((x) => x)),
        unit: json["unit"],
        barcode: json["barcode"],
        draft: json["draft"],
        restockReminder: json["restock_reminder"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_name": categoryName,
        "product_id": productId,
        "product_name": productName,
        "brand_name": brandName,
        "brand_id": brandId,
        "variant_id": variantId,
        "cost": cost,
        "quantity": quantity,
        "discount_percent": discountPercent,
        "stock": stock,
        "stock_id": stockId,
        "product_description": productDescription,
        "images": List<dynamic>.from(images.map((x) => x)),
        "unit": unit,
        "barcode": barcode,
        "draft": draft,
        "restock_reminder": restockReminder,
        "count": count,
      };
}

class PaymentTypesUsage {
  final int uip;
  final int cash;
  final int bank;
  final int other;

  PaymentTypesUsage({
    required this.uip,
    required this.cash,
    required this.bank,
    required this.other,
  });

  factory PaymentTypesUsage.fromJson(Map<String, dynamic> json) =>
      PaymentTypesUsage(
        uip: json["UIP"],
        cash: json["cash"],
        bank: json["bank"],
        other: json["other"],
      );

  Map<String, dynamic> toJson() => {
        "UIP": uip,
        "cash": cash,
        "bank": bank,
        "other": other,
      };
}
