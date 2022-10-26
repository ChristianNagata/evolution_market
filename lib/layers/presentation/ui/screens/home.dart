import 'package:evolution_market/layers/domain/entities/product_entity.dart';
import 'package:evolution_market/layers/presentation/controllers/home_notifier.dart';
import 'package:evolution_market/layers/presentation/ui/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/product_info_card.dart';

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
              childCount: 10,
              (BuildContext context, int index) => Padding(
                padding: const EdgeInsets.only(left: 36, right: 36, top: 16),
                child: ProductInfoCard(
                  ProductEntity(),
                ),
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

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeNotifier homeNotifier = Provider.of<HomeNotifier>(context);
    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Container(
                width: 240,
                height: 179,
                color: Colors.amber,
              ),
              const SizedBox(height: 25),
              Text(
                homeNotifier.product.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 26,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                homeNotifier.product.description,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'R\$${homeNotifier.product.price.toStringAsFixed(2)}'
                    .replaceFirst('.', ','),
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
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
