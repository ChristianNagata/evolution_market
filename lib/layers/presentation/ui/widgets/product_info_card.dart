import 'package:evolution_market/layers/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/home_notifier.dart';
import 'on_sale_label.dart';

class ProductInfoCard extends StatelessWidget {
  const ProductInfoCard(this.product, {Key? key}) : super(key: key);

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    HomeNotifier homeNotifier = Provider.of<HomeNotifier>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => homeNotifier.showProductDetails(product),
      child: Card(
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: SizedBox(
          height: screenWidth / 1.3,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      product.imagePath,
                      fit: BoxFit.cover,
                    ),
                    product.isOnSale ? const OnSaleLabel() : Container(),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(
                          fontSize: screenWidth / 23,
                          fontWeight: FontWeight.w700,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        product.description,
                        style: TextStyle(
                          fontSize: screenWidth / 32,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).textTheme.bodySmall?.color,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'R\$${product.formattedPrice}',
                            style: TextStyle(
                              fontSize: screenWidth / 23,
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          _Counter(product)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Counter extends StatelessWidget {
  const _Counter(this.product, {Key? key}) : super(key: key);

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    HomeNotifier homeNotifier = Provider.of<HomeNotifier>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        ElevatedButton(
          onPressed: () => homeNotifier.decrementCounter(product),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Theme.of(context).unselectedWidgetColor,
            ),
            shape: MaterialStateProperty.all<CircleBorder>(
              const CircleBorder(),
            ),
            minimumSize: MaterialStateProperty.all(
              const Size(24, 24),
            ),
          ),
          child: const Icon(Icons.remove),
        ),
        const SizedBox(width: 0),
        Text(
          product.numberOfProducts.toString(),
          style: TextStyle(
            fontSize: screenWidth / 23,
            fontWeight: FontWeight.w400,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(width: 0),
        ElevatedButton(
          onPressed: () => homeNotifier.incrementCounter(product),
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Theme.of(context).primaryColor),
            shape: MaterialStateProperty.all<CircleBorder>(
              const CircleBorder(),
            ),
            minimumSize: MaterialStateProperty.all(const Size(24, 24)),
          ),
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
