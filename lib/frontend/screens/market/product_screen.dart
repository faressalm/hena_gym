import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hena_gym/business-logic/product/product_cubit.dart';
import 'package:hena_gym/business-logic/product/product_states.dart';
import 'package:hena_gym/constants/my_gui.dart';
import 'package:hena_gym/data/models/my_user.dart';
import 'package:hena_gym/data/models/product.dart';
import 'package:hena_gym/utils/components.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  Product product;
  TextEditingController controller = TextEditingController();
  ProductScreen({
    required this.product
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context)=>ProductCubit()
        ,child: BlocConsumer<ProductCubit,ProductState>(
        listener: (context,state){

        },
        builder: (context,state){
          var user = Provider.of<MyUser?>(context);
          var cubit= ProductCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text(product.name),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image(
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.contain,
                          image: NetworkImage(
                            product.imageURL  )
                      ),
                      Visibility(
                        visible: product.offer != 'none',
                        child: Container(
                          color: Colors.red,
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: const Text(
                            'DISCOUNT',
                            style: TextStyle(
                                fontSize: 10.0, color: MyColors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.7),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(3, 0))
                        ],
                        color: MyColors.darkRed,
                        borderRadius:
                        BorderRadius.only(topRight: Radius.circular(30)),
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Description",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: MyColors.cyan,
                              ),
                            ),
                            Text(
                              product.description,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                              style: TextStyle(
                                  fontSize: 16, color: MyColors.white),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                width: double.infinity,
                                height: 1,
                                color: MyColors.darkBlue,
                              ),
                            ),
                            Text(
                              "Price",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: MyColors.cyan,
                              ),
                            ),
                            Text(
                              product.price,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                              style: TextStyle(
                                  fontSize: 16, color: MyColors.white),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                width: double.infinity,
                                height: 1,
                                color: MyColors.darkBlue,
                              ),
                            ),
                            Text(
                              "Quantity",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: MyColors.cyan,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 30,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(topLeft:Radius.circular(30) ,bottomLeft:Radius.circular(30) ),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black.withOpacity(0.6),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0,2)
                                        )
                                      ]
                                  ),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: (){
                                          cubit.incQuantity();
                                      },
                                      splashColor: Colors.cyan,
                                      child: Center(
                                        child: Icon(
                                          Icons.add,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 30,
                                  width: 3,
                                  color: MyColors.cyan,
                                ),
                                Container(

                                  height: 30,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: MyColors.white,

                                  ),
                                  child: Center(
                                      child: Text(
                                        "${cubit.quantity}",
                                        style: TextStyle(
                                            color: MyColors.darkBlue
                                        ),
                                      )
                                  ),
                                ),
                                Container(
                                  height: 30,
                                  width: 3,
                                  color: MyColors.cyan,
                                ),
                                Container(
                                    height: 30,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        color:Colors.white,
                                        borderRadius: BorderRadius.only(topRight: Radius.circular(30),bottomRight: Radius.circular(30)),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black.withOpacity(0.6),
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                              offset: Offset(4,2)
                                          )
                                        ]
                                    ),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        splashColor: Colors.cyan,
                                        onTap: (){
                                          cubit.decQuantity();
                                        },
                                        child: Center(
                                          child: Icon(
                                              Icons.minimize
                                          ),
                                        ),
                                      ),
                                    )

                                )
                              ],
                            ),

                            Expanded(
                              child: Container(
                                width: double.infinity,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: MyColors.darkBlue,
                                          onPrimary:
                                          MyColors.white), // foreground
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text("Add your address"),
                                                content: TextFormField(
                                                  controller: controller,
                                                  decoration: textInputDecoration
                                                      .copyWith(
                                                      labelText: 'address',
                                                      suffixIcon:
                                                      const Icon(
                                                          Icons.home)),
                                                ),
                                                actions: <Widget>[
                                                  TextButton(
                                                    child: Text("approve"),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                     // cubit.addOrder(controller.text, user.uid)
                                                    },
                                                  )
                                                ],
                                              );
                                            });
                                      },
                                      child: Text('Order Now'),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ]),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
