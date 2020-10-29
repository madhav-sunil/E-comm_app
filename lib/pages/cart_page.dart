import 'package:e_comm_app/core/cubit/cart.dart';
import 'package:e_comm_app/pages/checkout_page.dart';

import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    double total = 0;
    int count = 1;
    //Cart Page UI
    return Scaffold(
      bottomNavigationBar: Cart.items.length != 0
          ? FlatButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CheckoutPage(
                              total: total,
                            )));
              },
              child: Text(
                'PROCEED TO BUY',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ))
          : null,
      appBar: AppBar(),
      body: Container(
        child: Cart.items.length == 0
            //
            //Displaying Empty if Cart Length is 0
            //
            ? Center(child: Text('Cart is Empty'))
            //
            //Displaying Cart Elements if length not 0
            //
            : Container(
                child: Column(
                  //
                  // Converting  Map<Product,int> items to Widgets Directly using map()
                  //
                  children: Cart.items.entries.map(
                        (product) {
                          count = product.value;
                          //Adding to total Value
                          total = total + product.key.cost * product.value;
                          //ListTile of Products in Cart
                          return ListTile(
                            leading: Image.network(product.key.thumbnail),
                            title: Column(
                              children: <Widget>[
                                Text(product.key.name),
                                Text(product.key.cost.toString()),
                              ],
                            ),
                            //
                            //Product Quantity increament/dereament options
                            //
                            trailing: Container(
                              width: 70,
                              child: Column(
                                children: [
                                  Row(
                                    children: <Widget>[
                                      InkWell(
                                        child: Icon(Icons.plus_one),
                                        //On Increament
                                        onTap: () {
                                          setState(() {
                                            ///increamenting state variable
                                            count = Cart.items[product.key];
                                            ++count;

                                            ///Updating Product count in [Cart]
                                            Cart.items[product.key] = count;
                                          });
                                        },
                                      ),
                                      Text(count.toString()),
                                      InkWell(
                                        child: Icon(
                                            Icons.exposure_minus_1_outlined),
                                        //On Decreament
                                        onTap: () {
                                          setState(() {
                                            if (Cart.items[product.key] > 1) {
                                              ///decreamenting state variable
                                              count = Cart.items[product.key];
                                              --count;

                                              ///Upadating Product count in [Cart]
                                              Cart.items[product.key] = count;
                                            }
                                          });
                                        },
                                      )
                                    ],
                                  ),
                                  Center(
                                    child: InkWell(
                                      child: Icon(Icons.delete),
                                      onTap: () {
                                        setState(() {
                                          Cart.removeFromCart(product.key);
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ).toList() +
                      //
                      //Appending the Displayed List of Cart items with the Total Cost
                      //
                      [
                        ListTile(
                          leading: Text('Total '),
                          trailing: Text('=  ' + total.toString()),
                        ),
                      ],
                ),
              ),
      ),
    );
  }
}
