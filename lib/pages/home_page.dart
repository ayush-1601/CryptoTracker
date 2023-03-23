import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_crypto_tracker/models/Crypto_currency.dart';
import 'package:flutter_crypto_tracker/pages/Market_list.dart';
import 'package:flutter_crypto_tracker/pages/details_page.dart';
import 'package:flutter_crypto_tracker/pages/favourites_page.dart';
import 'package:flutter_crypto_tracker/providers/market_provider.dart';
import 'package:flutter_crypto_tracker/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController viewController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);

    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Crypto",
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 8),
                    ),
                    Text(
                      "Today",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 8),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {
                      themeProvider.toggleTheme();
                    },
                    padding: EdgeInsets.all(0),
                    icon: (themeProvider.themeMode == ThemeMode.light)
                        ? const Icon(Icons.dark_mode)
                        : const Icon(Icons.light_mode))
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            TabBar(
              controller: viewController,
              tabs: [
                Tab(
                  child: Text(
                    "Markets",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                Tab(
                  child: Text(
                    "Favourites",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ],
              
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: TabBarView(
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  controller: viewController,
                  children: [MarketList(), Favourites()]),
            )
          ],
        ),
      )),
    );
  }
}
