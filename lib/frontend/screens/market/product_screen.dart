import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hena_gym/constants/my_gui.dart';
import 'package:hena_gym/data/models/product.dart';
import 'package:hena_gym/utils/components.dart';

class ProductScreen extends StatelessWidget{
  /*Product product;
  ProductScreen({
    required this.product
  });*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "product name"
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(

              alignment: Alignment.bottomCenter,
              children: [
                Image(height: 200,
                    width: double.infinity,
                    fit: BoxFit.contain,
                    image: NetworkImage(
                        "https://firebasestorage.googleapis.com/v0/b/hena-gym.appspot.com/o/products%2Fc4-original---cotton-candy--30-servings.jpg?alt=media&token=22eeb88b-eb18-4dd2-a8dd-c9958cc3556f"
                    )),
                Visibility(
                  visible: 'one' != 'none',
                  child: Container(
                    color: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: const Text(
                      'DISCOUNT',
                      style: TextStyle(fontSize: 10.0, color: MyColors.white),
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
                      offset: Offset(3,0)

                    )
                  ],
                  color: MyColors.darkRed,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(30)),

                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: MyColors.darkBlue,

                      ),
                    ),
                    Text(
                    'this the dafajdakdmdlndasfmjldandam.d vnacsjafnajcnsakldvnfjanAD'
                        'AFSFADGFSAGFSAFDSGF',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                    style:TextStyle(
                      fontSize: 16,
                      color: MyColors.white
                    ) ,
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
                        color: MyColors.darkBlue,
                      ),
                    ),
                    Text(
                      "999 EGP",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      style:TextStyle(
                          fontSize: 16,
                          color: MyColors.white
                      ) ,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        width: double.infinity,
                        height: 1,
                        color: MyColors.darkBlue,
                      ),
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
                                onPrimary: MyColors.white
                              ),// foreground
                              onPressed: () {
                                showDialog(context: context, builder: (BuildContext context){
                                  return AlertDialog(
                                    title:  Text("Add your address"),
                                    content: TextFormField(
                                      decoration: textInputDecoration.copyWith(
                                          labelText: 'address',
                                          suffixIcon: const Icon(Icons.home)),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text("approve"),
                                        onPressed: (){
                                          Navigator.of(context).pop();
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
                  ]
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

}