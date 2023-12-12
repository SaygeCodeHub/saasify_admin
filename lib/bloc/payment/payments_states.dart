import 'package:saasify/data/models/categories/fetch_all_categories_model.dart';

abstract class PaymentStates {}

class PaymentInitial extends PaymentStates {}

class EditingPayment extends PaymentStates {}

class EditedPayment extends PaymentStates {
  final String message;

  EditedPayment({required this.message});
}

class ErrorEditingPayment extends PaymentStates {
  final String message;

  ErrorEditingPayment({required this.message});
}

class DeletingPayment extends PaymentStates {}

class DeletedPayment extends PaymentStates {
  final String message;

  DeletedPayment({required this.message});
}

class ErrorDeletingPayment extends PaymentStates {
  final String message;

  ErrorDeletingPayment({required this.message});
}

class FetchingPayment extends PaymentStates {}

class FetchedPayment extends PaymentStates {
  final List<ProductCategory> categoryList;

  FetchedPayment({required this.categoryList});
}

class ErrorFetchingPayment extends PaymentStates {
  final String message;

  ErrorFetchingPayment({required this.message});
}

class SwitchTogglePayment extends PaymentStates {
  final bool paymentToggle;

  SwitchTogglePayment({required this.paymentToggle});
}

class SavingPayment extends PaymentStates {}

class SavedPayment extends PaymentStates {
  final String message;
  SavedPayment({required this.message});
}

class ErrorSavingPayment extends PaymentStates {
  final String message;

  ErrorSavingPayment({required this.message});
}
