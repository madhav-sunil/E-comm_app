import 'package:e_comm_app/components/image_displayer.dart';
import 'package:e_comm_app/core/cubit/cart.dart';
import 'package:e_comm_app/core/cubit/product_cart_cubit.dart';
import 'package:e_comm_app/data/models/product.dart';
import 'package:e_comm_app/pages/cart_page.dart';
import 'package:e_comm_app/pages/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ///
    ///Creating instances of static [Cart] and Cubit [ProductCartCubit]
    //
    Cart();
    final productcubit = context.bloc<ProductCartCubit>();
    productcubit.getProducts();
    return Scaffold(
      floatingActionButton: buildCartButton(context),
      appBar: AppBar(title: Text('E-comm App')),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16),

        ///
        /// Manageing the UI Using Bloc to Load up the Products from the Repository
        ///
        child: BlocBuilder<ProductCartCubit, ProductCartState>(
          builder: (context, state) {
            if (state is ProductCartInitial) {
              return buildInitial();
            } else if (state is ProductLoading) {
              return buildLoading();
            } else if (state is ProductLoaded) {
              return buildListwithProducts(state.products);
            } else {
              return buildInitial();
            }
          },
        ),
      ),
    );
  }

  Widget buildCartButton(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CartPage()));
          },
          icon: ClipRRect(
            child: Container(
              child: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
            ),
          )),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildInitial() {
    return Container();
  }

  Widget buildListwithProducts(List<Product> products) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        var product = products[index];
        return InkWell(
          child: ListTile(
            leading:
                CircleAvatar(child: ImageDisplay(imageUrl: product.thumbnail)),
            title: Column(
              children: <Widget>[
                Text(product.name),
                Text(product.cost.toString()),
              ],
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailsPage(
                          product: product,
                        )));
          },
        );
      },
    );
  }
}
