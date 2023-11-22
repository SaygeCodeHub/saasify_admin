import '../../data/models/orders/fetch_orders_model.dart';
import 'orders_repository.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  @override
  Future<FetchOrdersModel> fetchOrdersList(
      String userId, String companyId, int branchId) async {
    final response = {
      "status": 200,
      "data": [
        {
          "order_id": 1,
          "order_number": 1234520,
          "ordered_on": "21-11-3033",
          "items_ordered": [
            {
              "category_id": 5,
              "category_name": "Namkeen",
              "product_id": 31,
              "product_name": "Phalhari Chiwda",
              "brand_name": "Haldiram",
              "brand_id": 26,
              "variant_id": 32,
              "cost": 10.0,
              "quantity": 100,
              "discount_percent": 0.0,
              "stock": 400,
              "stock_id": 28,
              "product_description":
                  "Namkeen that you would love to eat on fast.",
              "images": [
                "https://storage.googleapis.com/saasify-5ddd8.appspot.com/uploaded_images/shopping.webp?Expires=1710917032&GoogleAccessId=firebase-adminsdk-o8vl8%40saasify-5ddd8.iam.gserviceaccount.com&Signature=H5faRtM%2FoFFTaU4oc5P2o9ay8cFTHbjXidT7eXcey2lL5QSH8M7MpXer6rIUpxpkrWiXMyjy6hxDFZgkrf84%2FHpyE8OEZG44IP6uEn4p73gkSMRLjv%2FEbDD8Jf6nzEfy%2FIDlb0FqQigswiEdTYawgyGHTjz1WyIjSpbBTtC5%2BZU%2FEryqdhv7SgKi6l7ltTbF3TWZxYnqrptF3BJXMNSy4dkBDaQLemQLsGGJP8hKH6K6s9Z3Oj%2BNtpUheQLqwONnF7K91hzzt6V8d0mT8BHXebWAvPPnsio9FddWQX5TOKIwJer%2FDu89fC2ewHq7p2w4MshAi0IpJLDTebiyhCWN%2BA%3D%3D"
              ],
              "unit": "gm",
              "barcode": 1002900000000,
              "draft": false,
              "restock_reminder": 50
            },
            {
              "category_id": 5,
              "category_name": "Namkeen",
              "product_id": 31,
              "product_name": "Phalhari Chiwda",
              "brand_name": "Haldiram",
              "brand_id": 26,
              "variant_id": 32,
              "cost": 10.0,
              "quantity": 100,
              "discount_percent": 0.0,
              "stock": 400,
              "stock_id": 28,
              "product_description":
                  "Namkeen that you would love to eat on fast.",
              "images": [
                "https://storage.googleapis.com/saasify-5ddd8.appspot.com/uploaded_images/shopping.webp?Expires=1710917032&GoogleAccessId=firebase-adminsdk-o8vl8%40saasify-5ddd8.iam.gserviceaccount.com&Signature=H5faRtM%2FoFFTaU4oc5P2o9ay8cFTHbjXidT7eXcey2lL5QSH8M7MpXer6rIUpxpkrWiXMyjy6hxDFZgkrf84%2FHpyE8OEZG44IP6uEn4p73gkSMRLjv%2FEbDD8Jf6nzEfy%2FIDlb0FqQigswiEdTYawgyGHTjz1WyIjSpbBTtC5%2BZU%2FEryqdhv7SgKi6l7ltTbF3TWZxYnqrptF3BJXMNSy4dkBDaQLemQLsGGJP8hKH6K6s9Z3Oj%2BNtpUheQLqwONnF7K91hzzt6V8d0mT8BHXebWAvPPnsio9FddWQX5TOKIwJer%2FDu89fC2ewHq7p2w4MshAi0IpJLDTebiyhCWN%2BA%3D%3D"
              ],
              "unit": "gm",
              "barcode": 1002900000000,
              "draft": false,
              "restock_reminder": 50
            }
          ],
          "customer_contact": 1234567890,
          "payment_status": "paid",
          "mode_of_payment": "cash",
          "customer_name": "qwertyui",
          "discount_total": 100.00,
          "total_amount": 500.00,
          "subtotal": 600.00
        },
        {
          "order_id": 2,
          "order_number": 1234520,
          "ordered_on": "21-11-3033",
          "items_ordered": [
            {
              "category_id": 5,
              "category_name": "Namkeen",
              "product_id": 31,
              "product_name": "Phalhari Chiwda",
              "brand_name": "Haldiram",
              "brand_id": 26,
              "variant_id": 32,
              "cost": 10.0,
              "quantity": 100,
              "discount_percent": 0.0,
              "stock": 400,
              "stock_id": 28,
              "product_description":
                  "Namkeen that you would love to eat on fast.",
              "images": [
                "https://storage.googleapis.com/saasify-5ddd8.appspot.com/uploaded_images/shopping.webp?Expires=1710917032&GoogleAccessId=firebase-adminsdk-o8vl8%40saasify-5ddd8.iam.gserviceaccount.com&Signature=H5faRtM%2FoFFTaU4oc5P2o9ay8cFTHbjXidT7eXcey2lL5QSH8M7MpXer6rIUpxpkrWiXMyjy6hxDFZgkrf84%2FHpyE8OEZG44IP6uEn4p73gkSMRLjv%2FEbDD8Jf6nzEfy%2FIDlb0FqQigswiEdTYawgyGHTjz1WyIjSpbBTtC5%2BZU%2FEryqdhv7SgKi6l7ltTbF3TWZxYnqrptF3BJXMNSy4dkBDaQLemQLsGGJP8hKH6K6s9Z3Oj%2BNtpUheQLqwONnF7K91hzzt6V8d0mT8BHXebWAvPPnsio9FddWQX5TOKIwJer%2FDu89fC2ewHq7p2w4MshAi0IpJLDTebiyhCWN%2BA%3D%3D"
              ],
              "unit": "gm",
              "barcode": 1002900000000,
              "draft": false,
              "restock_reminder": 50
            },
            {
              "category_id": 5,
              "category_name": "Namkeen",
              "product_id": 31,
              "product_name": "Phalhari Chiwda",
              "brand_name": "Haldiram",
              "brand_id": 26,
              "variant_id": 32,
              "cost": 10.0,
              "quantity": 100,
              "discount_percent": 0.0,
              "stock": 400,
              "stock_id": 28,
              "product_description":
                  "Namkeen that you would love to eat on fast.",
              "images": [
                "https://storage.googleapis.com/saasify-5ddd8.appspot.com/uploaded_images/shopping.webp?Expires=1710917032&GoogleAccessId=firebase-adminsdk-o8vl8%40saasify-5ddd8.iam.gserviceaccount.com&Signature=H5faRtM%2FoFFTaU4oc5P2o9ay8cFTHbjXidT7eXcey2lL5QSH8M7MpXer6rIUpxpkrWiXMyjy6hxDFZgkrf84%2FHpyE8OEZG44IP6uEn4p73gkSMRLjv%2FEbDD8Jf6nzEfy%2FIDlb0FqQigswiEdTYawgyGHTjz1WyIjSpbBTtC5%2BZU%2FEryqdhv7SgKi6l7ltTbF3TWZxYnqrptF3BJXMNSy4dkBDaQLemQLsGGJP8hKH6K6s9Z3Oj%2BNtpUheQLqwONnF7K91hzzt6V8d0mT8BHXebWAvPPnsio9FddWQX5TOKIwJer%2FDu89fC2ewHq7p2w4MshAi0IpJLDTebiyhCWN%2BA%3D%3D"
              ],
              "unit": "gm",
              "barcode": 1002900000000,
              "draft": false,
              "restock_reminder": 50
            }
          ],
          "customer_contact": 1234567890,
          "payment_status": "paid",
          "mode_of_payment": "cash",
          "customer_name": "qwertyui",
          "discount_total": 100.00,
          "total_amount": 500.00,
          "subtotal": 600.00
        }
      ],
      "message": "success"
    };

    return FetchOrdersModel.fromJson(response);
  }
}
