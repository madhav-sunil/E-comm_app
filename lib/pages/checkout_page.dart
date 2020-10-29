import 'package:e_comm_app/core/cubit/cart.dart';
import 'package:e_comm_app/pages/home_page.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  final double total;
  const CheckoutPage({
    Key key,
    this.total,
  }) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool isPurchased = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FlatButton(
        onPressed: () async {
          print('before>>' + isPurchased.toString());
          isPurchased
              ? await Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()))
              : Cart.items.clear();
          setState(() {
            isPurchased = !isPurchased;
            print('setState>>' + isPurchased.toString());
          });
        },
        child: isPurchased
            ? Text('CONTINUE SHOPPING',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500))
            : Text('BUY',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
      ),
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: isPurchased
              ? Text('Thank You ')
              : Text('Total =' + widget.total.toString()),
        ),
      ),
    );
  }
}
