import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hena_gym/business-logic/market/market_cubit.dart';
import 'package:hena_gym/business-logic/market/market_states.dart';
import 'package:hena_gym/constants/my_gui.dart';
import 'package:hena_gym/data/models/product.dart';
import 'package:hena_gym/data/repository/marekt_repo.dart';
import 'package:hena_gym/data/services/market_services.dart';

class MarketScreen extends StatelessWidget{
  MarketServicesRepository marketRepository = MarketServicesRepository(marketSevices: MarketServices(FirebaseFirestore.instance));
  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(create:(BuildContext context)=> MarketCubit(marketServicesRepository: marketRepository)..getAllProducts(),
      child: BlocConsumer<MarketCubit,MarketState>(
        listener: (context,build){
          
        },
        builder: (context,state){
          var cubit = MarketCubit.get(context);
          return GridView.count(crossAxisCount: 2,
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0,
          childAspectRatio: 3/4.5,
          shrinkWrap: true,
            children: List.generate(
                cubit.products.length,
                    (index) =>buildGridProduct(cubit.products[index])),
          );
        },
      ),
    );
  }
  Widget  buildGridProduct(Product product)=>Padding(
    padding: const EdgeInsets.all(6.0),
    child: Container(
      color: Colors.white,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                image: NetworkImage(product.imageURL),
                width: double.infinity,
                height: 200.0,
              ),
              if(product.offer!='none')
                 Container(
                   color: Colors.red,
                   padding: EdgeInsets.symmetric(horizontal: 5.0),
                   child: Text(
                     'DISCOUNT',
                     style: TextStyle(
                         fontSize: 10.0,
                         color: Colors.white
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
                    style: TextStyle(
                      color: MyColors.darkRed,
                      fontSize: 14.0,
                      height: 1.3
                    ),
                  ),
                  Text(
                    product.price,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: MyColors.cyan
                    ),
                  )
                ],

              ),
          )
        ],
      ),
    ),
  );
}