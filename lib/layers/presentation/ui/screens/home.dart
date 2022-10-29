import 'package:evolution_market/layers/presentation/controllers/home_notifier.dart';
import 'package:evolution_market/layers/presentation/controllers/product_notifier.dart';
import 'package:evolution_market/layers/presentation/controllers/user_notifier.dart';
import 'package:evolution_market/layers/presentation/ui/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/product_info_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final appBarKey = GlobalKey();

  @override
  void initState() {
    GetIt.I.get<UserNotifier>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HomeNotifier homeNotifier = Provider.of<HomeNotifier>(context);
    ProductNotifier productsNotifier = context.watch<ProductNotifier>();
    return Scaffold(
      key: homeNotifier.key,
      backgroundColor: Theme.of(context).backgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            key: appBarKey,
            pinned: false,
            snap: false,
            floating: false,
            expandedHeight: 163,
            automaticallyImplyLeading: false,
            flexibleSpace: const FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(left: 24, bottom: 40),
              title: _SliverAppBarTitle(),
              background: _SliverAppBarBg(),
            ),
          ),
          if (productsNotifier.state == ProductsState.loading)
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 120,
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: productsNotifier.products.length,
              (BuildContext context, int index) => Padding(
                padding: const EdgeInsets.only(left: 36, right: 36, top: 16),
                child: ProductInfoCard(productsNotifier.products[index]),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: _Pagination(appBarKey: appBarKey),
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}

class _Pagination extends StatelessWidget {
  const _Pagination({
    Key? key,
    required this.appBarKey,
  }) : super(key: key);

  final GlobalKey appBarKey;

  @override
  Widget build(BuildContext context) {
    ProductNotifier productNotifier =
        Provider.of<ProductNotifier>(context, listen: false);
    return SizedBox(
      height: 120,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  productNotifier.pageBackward();
                  Scrollable.ensureVisible(appBarKey.currentState!.context);
                },
                icon: const Icon(
                  Icons.keyboard_arrow_left_rounded,
                ),
              ),
              IconButton(
                onPressed: () {
                  productNotifier.pagination(1);
                  Scrollable.ensureVisible(appBarKey.currentState!.context);
                },
                icon: const _PageNumber(1),
              ),
              IconButton(
                onPressed: () {
                  productNotifier.pagination(2);
                  Scrollable.ensureVisible(appBarKey.currentState!.context);
                },
                icon: const _PageNumber(2),
              ),
              IconButton(
                onPressed: () {
                  productNotifier.pagination(3);
                  Scrollable.ensureVisible(appBarKey.currentState!.context);
                },
                icon: const _PageNumber(3),
              ),
              IconButton(
                onPressed: productNotifier.pageForward,
                icon: const Icon(
                  Icons.keyboard_arrow_right_rounded,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PageNumber extends StatelessWidget {
  const _PageNumber(
    this.number, {
    Key? key,
  }) : super(key: key);

  final int number;

  @override
  Widget build(BuildContext context) {
    ProductNotifier productNotifier =
        Provider.of<ProductNotifier>(context, listen: true);
    bool isSelected = productNotifier.pageNumber == number;
    return Text(
      number.toString(),
      style: TextStyle(
        fontSize: 18,
        fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
        color: isSelected ? Theme.of(context).primaryColor : Colors.black,
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
