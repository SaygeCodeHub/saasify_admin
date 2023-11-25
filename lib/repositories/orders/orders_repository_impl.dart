import '../../data/models/orders/fetch_orders_model.dart';
import 'orders_repository.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  @override
  Future<FetchOrdersModel> fetchOrdersList(
      String userId, companyId, branchId) async {
    // final response = await ClientServices().get(
    //     '${ApiConstants.baseUrl}$userId/$companyId/$branchId/getAllOrders');
    final response = {
      "status": 200,
      "data": {
        "total_orders": 45,
        "unpaid_orders": 10,
        "total_earning": 54651200474,
        "payment_types_usage": {"UIP": 12, "cash": 20, "bank": 18, "other": 2},
        "orders": [
          {
            "order_id": 3,
            "order_number": "1700748758",
            "order_date": "2023-11-23T14:12:38.433163+00:00",
            "customer_contact": 1234567890,
            "payment_status": "paid",
            "payment_type": "cash",
            "customer_name": "qwertyui",
            "discount_total": 0.0,
            "total_amount": 50.0,
            "subtotal": 50.0,
            "items_ordered": [
              {
                "category_id": 7,
                "category_name": "grocery",
                "product_id": 87,
                "product_name": "Coffee",
                "brand_name": "Nestle",
                "brand_id": 19,
                "variant_id": 93,
                "cost": 500.0,
                "quantity": 500,
                "discount_percent": 10.0,
                "stock": 7,
                "stock_id": 79,
                "product_description": "This is premium coffee",
                "images": [
                  "https://storage.googleapis.com/saasify-5ddd8.appspot.com/uploaded_images/grocery_sbc_coffee_440x460.jpg?Expires=1711075270&GoogleAccessId=firebase-adminsdk-o8vl8%40saasify-5ddd8.iam.gserviceaccount.com&Signature=gn4eNHLE%2BNCJ2DfLiVPlNxSdvw1b%2FRfpNy%2ByRF8NaQpn8F70MwtxgVCP2RLxGUhGgnzFquxC3ceKbcnGtTvPlGw%2FC9ZYz9EObQgdhYsqg%2F%2Fy5XaQ7dRy8ucm0Gufy%2F0Rh0Bi48iYUrtxnuOICC%2FfDGoXxLqHEfq3aG2kyXhGEn%2FPrBIMvXZRuHW4iMPAt3DlBfnY7y0VPhXcsDO0ANFMachWeoMaZEztfAdDCb05C6v2twT7%2BMd7XXxbc2wHN5vKNtvYtI2dWu4UrK5W59a7CMDssFMPrirqfxTdxl6NZyzATzKl1tJciU0ZvWt7PvoMeUpc3amvxqc3df7MtEh3MA%3D%3D"
                ],
                "unit": "gm",
                "barcode": 888000111,
                "draft": false,
                "restock_reminder": 10,
                "count": 1
              },
              {
                "category_id": 7,
                "category_name": "grocery",
                "product_id": 87,
                "product_name": "Coffee",
                "brand_name": "Nestle",
                "brand_id": 19,
                "variant_id": 94,
                "cost": 400.0,
                "quantity": 1000,
                "discount_percent": 0.0,
                "stock": 3,
                "stock_id": 80,
                "product_description": "This is premium coffee",
                "images": [
                  "https://storage.googleapis.com/saasify-5ddd8.appspot.com/uploaded_images/coffee.jpg?Expires=1711075347&GoogleAccessId=firebase-adminsdk-o8vl8%40saasify-5ddd8.iam.gserviceaccount.com&Signature=EKJnfWFrsbJFBMXdPvx9IHH%2BZnfbBiKzOncF%2B%2FNYIlvCzXQGF84cYsbm9785PgA9QNVTHPnYDowoIOftdiHC0EFviWMurS454xpaCZdohTrgdwoMuD6XQ%2Bqf3iZ8fIuiaNNRbelE3nQvS5bVPORtxTge23suUV7OdHwhqoU8ifRIZZQ%2BMNgFsLSL3dv%2Fg46j1NVD6qBOYTKotSi77wjz3rWPIgIDmKADRfCFeLDsDuOCr%2Bk%2BgYeqdPIGXkBkqIZptFR07EZYgAt%2Bfbb0T4b3HjSvoo1w7Rnb71jcc70wEEzjGKKzji6JuIPJ4fUP6an3cayPC4C65RSyuPMpHM35xw%3D%3D"
                ],
                "unit": "gm",
                "barcode": 88800000001,
                "draft": false,
                "restock_reminder": 10,
                "count": 1
              }
            ]
          },
          {
            "order_id": 2,
            "order_number": "1700724712",
            "order_date": "2023-11-23T07:31:51.711530+00:00",
            "customer_contact": 1234567890,
            "payment_status": "paid",
            "payment_type": "cash",
            "customer_name": "qwertyui",
            "discount_total": 50.0,
            "total_amount": 50.0,
            "subtotal": 50.0,
            "items_ordered": [
              {
                "category_id": 8,
                "category_name": "Snacks",
                "product_id": 83,
                "product_name": "Maggie",
                "brand_name": "Nestle",
                "brand_id": 19,
                "variant_id": 89,
                "cost": 50.0,
                "quantity": 50,
                "discount_percent": 10.0,
                "stock": 6,
                "stock_id": 75,
                "product_description": "Snack",
                "images": [
                  "https://storage.googleapis.com/saasify-5ddd8.appspot.com/uploaded_images/maggie.webp?Expires=1711032063&GoogleAccessId=firebase-adminsdk-o8vl8%40saasify-5ddd8.iam.gserviceaccount.com&Signature=sQ0Zt%2FoKcAfLaGq0teOoPyOG4orE6GezTmdeK7ULAFN3hrd0%2Bx9QJOMg3%2BzL7OTpE3R1RdFloMumBw7B%2BiqPjCzPNuSpBHJzk6wwKFzCZKnhqgvSCgkdRMpnwfN%2B8L3CEl1p0ACbrpIz80Ac6z1Dn%2FJikd%2BjcW7Lbcwk7dbi80IlUYwrjnP3E5ZyJGdQ%2FMHxvX8Z2M4VzxIxXH2l5uT2xYNBPue3%2FS%2BnGjyJzLdTR0Z2qj0LI21d0Ezq3tR%2Bn3gIfgB0fq%2F6iSqg2kZMYT8uRx4Ub6OvBDNiRHeydp%2BNJjMg%2Bm9c5PsYssH7cQx3EmVQ76Zd8EvyPakBbRjZ5Vt8zg%3D%3D",
                  "https://storage.googleapis.com/saasify-5ddd8.appspot.com/uploaded_images/flutter_Logo.png?Expires=1711098755&GoogleAccessId=firebase-adminsdk-o8vl8%40saasify-5ddd8.iam.gserviceaccount.com&Signature=jIjpTZxjUPpvxXXVPc13BDkjB%2FWJm00THrZFMrnvsg0MdymBqXv3x%2BuQE%2BwxFBB4XqUHDz9zqWyitGhuMyjNd4AIGJie0nGT2Ym1FWNBzY1XiFokFTyCs2WR%2FOuexAB0VAsD3hISaMmIbTQ8Tt2XLNGO6o%2B6EMVsNkXRHnjJlfnlhDZep%2Bvb3%2BJ1mPNmNRn%2BrxtLlNx9t3ffOKLcEqR3Plyj6GqgWw%2Bewm8jEkcnrm4sK%2Fx%2BihNuKSOdeVXgzyW5bRqxy11A25%2FtsUngsepoWGZigPC%2BK2qfd7b70XfOw0XV5s%2Fio2gu4cEKsWXdw2dCyd1FRcZqsp6okqoO0mG3gg%3D%3D"
                ],
                "unit": "gm",
                "barcode": 800250051,
                "draft": false,
                "restock_reminder": 10,
                "count": 1
              }
            ]
          }
        ]
      },
      "message": "success"
    };

    return FetchOrdersModel.fromJson(response);
  }
}
