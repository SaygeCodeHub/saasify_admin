abstract class PaymentEvents {}

class EditPayment extends PaymentEvents {
  final Map paymentDetailsMap;

  EditPayment({required this.paymentDetailsMap});
}

class DeletePayment extends PaymentEvents {
  final int paymentId;

  DeletePayment({required this.paymentId});
}

class FetchAllPayment extends PaymentEvents {}

class SavePayment extends PaymentEvents {
  final Map paymentDetailsMap;

  SavePayment({required this.paymentDetailsMap});
}
