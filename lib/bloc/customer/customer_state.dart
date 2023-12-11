abstract class CustomerStates {}

class CustomerInitial extends CustomerStates {}

class CustomerFetched extends CustomerStates {
  final String name;
  final String contact;
  final String action;

  CustomerFetched({required this.action, required this.name, required this.contact});
}
