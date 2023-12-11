abstract class CustomerEvent {}

class GetCustomer extends CustomerEvent {
  final String customerContact;
  final String action;

  GetCustomer({required this.action, required this.customerContact});
}

class EditCustomer extends CustomerEvent {}
