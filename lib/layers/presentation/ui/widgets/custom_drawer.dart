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
                child: Container(
                  height: screenWidth / 2,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
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
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                homeNotifier.product.formattedPrice,
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
