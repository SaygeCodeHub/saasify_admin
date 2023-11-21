abstract class OrdersStates {}

class OrdersInitial extends OrdersStates {}

class FetchingOrders extends OrdersStates {}

class FetchedOrders extends OrdersStates {}

class ErrorFetchingOrders extends OrdersStates {
  final String message;

  ErrorFetchingOrders({required this.message});
}
