import 'package:evolution_market/layers/domain/entities/product_entity.dart';
import 'package:evolution_market/layers/presentation/controllers/home_notifier.dart';
import 'package:evolution_market/layers/presentation/ui/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/product_info_card.dart';

List<ProductEntity> products = [
  ProductEntity(isOnSale: false),
  ProductEntity(),
  ProductEntity(),
  ProductEntity(),
  ProductEntity(),
  ProductEntity(),
  ProductEntity(),
  ProductEntity(),
  ProductEntity(),
  ProductEntity(),
];

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeNotifier homeNotifier = Provider.of<HomeNotifier>(context);
    return Scaffold(
      key: homeNotifier.key,
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            pinned: false,
            snap: false,
            floating: false,
            expandedHeight: 163,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(left: 24, bottom: 40),
              title: _SliverAppBarTitle(),
              background: _SliverAppBarBg(),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: products.length,
              (BuildContext context, int index) => Padding(
                padding: const EdgeInsets.only(left: 36, right: 36, top: 16),
                child: ProductInfoCard(products[index]),
              ),
            ),
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}

class _SliverAppBarBg extends StatelessWidget {
  const _SliverAppBarBg({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Image(
        image: AssetImage('assets/images/upper-home.bg.png'),
        fit: BoxFit.cover,
      ),
    );
  }
}

class _SliverAppBarTitle extends StatelessWidget {
  const _SliverAppBarTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [ 
        const CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(Icons.shopping_cart),
        ),
        const SizedBox(width: 14),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              'Confira nossos',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              'produtos',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
