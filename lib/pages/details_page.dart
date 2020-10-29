import 'package:e_comm_app/core/cubit/cart.dart';
import 'package:e_comm_app/data/models/product.dart';
import 'package:e_comm_app/pages/cart_page.dart';
import 'package:flutter/material.dart';

///
/// A StateFull Widget [DetailsPage] so that when ever one adds the product to the static [Cart], that change is reflected
/// in the [DetailsPage] by changing the 'ADD TO CART' to 'GO TO CART'
///
class DetailsPage extends StatefulWidget {
  final Product product;
  const DetailsPage({Key key, this.product}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    bool isInCart = false;
    //
    // Checking if current viewing items is in Cart
    //
    if (Cart.items != null) {
      if (Cart.items.containsKey(widget.product)) {
        isInCart = true;
      } else {
        isInCart = false;
      }
    }
    //
    // Details Page UI
    //
    return Scaffold(
      bottomNavigationBar: FlatButton(
          onPressed: () async {
            isInCart
                ? await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartPage()))
                : Cart.addToCart(widget.product, 1);
            setState(() {});
          },
          child: Text(
            isInCart ? 'GO TO CART' : 'ADD TO CART',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          )),
      //
      //AppBar
      //
      appBar: AppBar(),
      //
      //Container
      //
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10),
            Image.network(
              widget.product.thumbnail,
              scale: 0.1,
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(widget.product.name, style: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 10),
            Text(
              'Price:' + widget.product.cost.toString(),
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(height: 20),
            Text(widget.product.description)
          ],
        ),
      ),
    );
  }
}
