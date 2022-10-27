import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/home_notifier.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeNotifier homeNotifier = Provider.of<HomeNotifier>(context);
    double screenWidth = MediaQuery.of(context).size.width;
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
                    icon: Icon(
                      Icons.close,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              FractionallySizedBox(
                widthFactor: 1,
                child: SizedBox(
                  height: screenWidth / 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      homeNotifier.product.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Text(
                homeNotifier.product.name,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: screenWidth / 15,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                homeNotifier.product.description,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).textTheme.bodySmall?.color,
                  height: 2,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'R\$${homeNotifier.product.formattedPrice}',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: screenWidth / 12.5,
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
