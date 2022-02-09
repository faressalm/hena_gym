import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hena_gym/business-logic/market/market_cubit.dart';
import 'package:hena_gym/business-logic/market/market_states.dart';
import 'package:hena_gym/constants/my_gui.dart';
import 'package:hena_gym/data/models/product.dart';
import 'package:hena_gym/data/repository/marekt_repo.dart';
import 'package:hena_gym/data/services/market_services.dart';
import 'package:hena_gym/frontend/screens/market/product_screen.dart';
import 'package:hena_gym/utils/components.dart';

class MarketScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();
  MarketServicesRepository marketRepository = MarketServicesRepository(
      marketServices: MarketServices(FirebaseFirestore.instance));
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          MarketCubit(marketServicesRepository: marketRepository)
            ..getAllProducts(),
      child: BlocConsumer<MarketCubit, MarketState>(
        listener: (context, build) {},
        builder: (context, state) {
          var cubit = MarketCubit.get(context);
          return Scaffold(
            appBar: cubit.search? AppBar(
              title: TextFormField(
               decoration: InputDecoration(
                 border: UnderlineInputBorder(),
                 labelText: "search for product..",
                 labelStyle: TextStyle(
                   color: MyColors.darkBlue
                 )
               ),
                controller: searchController,
                onChanged: cubit.getFilteredProducts,
              ),
              backgroundColor: MyColors.white,
              actions: [
                IconButton(onPressed: (){
                  cubit.changeSearchState();
                }, icon: Icon(
                  Icons.cancel_outlined,
                  color: MyColors.darkBlue,
                ))
              ],
            ) : AppBar(
              backgroundColor: MyColors.white,
              centerTitle: true,
              title: Text(
                "Market",
                style: TextStyle(
                  color: MyColors.darkBlue,

                ),
              ),
              actions: [
                IconButton(onPressed: (){
                  cubit.changeSearchState();
                }, icon: Icon(
                  Icons.search,
                  color: MyColors.darkBlue,
                ))
              ],
            ),
            body: ConditionalBuilder(
                condition: cubit.products.isNotEmpty,
                builder: (context) => GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 1.0,
                      crossAxisSpacing: 1.0,
                      childAspectRatio: 1 / 1.5,
                      shrinkWrap: true,
                      children: List.generate(cubit.products.length,
                          (index) => buildGridProduct(cubit.products[index],context)),
                    ),
                fallback: (context) =>
                    const Center(child: CircularProgressIndicator())),
          );
        },
      ),
    );
  }

  Widget buildGridProduct(Product product,context) => InkWell(
    onTap: (){
      navigateTo(context, ProductScreen(product: product,));
    },
    child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: MyColors.darkRed, width: 0.7),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    Container(
                        width: double.infinity,
                        child: FadeInImage.assetNetwork(
                            height: 150,
                            image: product.imageURL,
                            placeholder: 'assets/images/loading.gif')),
                    Visibility(
                      visible: product.offer != 'none',
                      child: Container(
                        color: Colors.red,
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: const Text(
                          'DISCOUNT',
                          style: TextStyle(fontSize: 10.0, color: MyColors.white),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Text(
                        product.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: MyColors.darkRed, fontSize: 14.0, height: 1.3),
                      ),
                      Text(
                        product.price,
                        overflow: TextOverflow.ellipsis,
                        style:
                            const TextStyle(fontSize: 12.0, color: MyColors.cyan),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
  );
}
