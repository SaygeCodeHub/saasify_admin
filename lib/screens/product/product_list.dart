import 'package:flutter/material.dart';
import 'package:saasify/widgets/sidebar.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(child: SideBar(selectedIndex: 2)),
          Expanded(
              flex: 5,
              child: Column(
                children: [],
              ))
        ],
      ),
    );
  }
}
