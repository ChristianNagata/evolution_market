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
    HomeNotifier homeNotifier =
        Provider.of<HomeNotifier>(context, listen: false);
    return GestureDetector(
      onTap: () => homeNotifier.showProductDetails(product),
      child: Card(
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: SizedBox(
          height: 257,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.amber,
                      ),
                    ),
                    product.isOnSale
                        ? const OnSaleLabel()
                        : Container(),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        product.description,
                        style: const TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'R\$${product.price.toStringAsFixed(2)}'
                                .replaceFirst('.', ','),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          const _Counter()
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
  const _Counter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.grey),
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
          '0',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(width: 0),
        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Theme.of(context).primaryColor),
            shape: MaterialStateProperty.all<CircleBorder>(
              const CircleBorder(),
            ),
            minimumSize: MaterialStateProperty.all(
              const Size(24, 24),
            ),
          ),
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
