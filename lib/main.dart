import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:urpay_1/constants.dart';
import 'package:urpay_1/model/transactions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'UrPay',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  final cardColors = [
    Color(0xFF253B88),
    Color(0xFF4a148c),
    Color(0xFF004d40),
  ];
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var appbar = _buildAppBar();
    final remainingHeight = size.height - appbar.preferredSize.height;

    return Scaffold(
      backgroundColor: kOnPrimaryColor,
      appBar: appbar,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: remainingHeight - 120,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _cards(remainingHeight, size.width),
                  _transactions(remainingHeight),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 120,
            child: _bottomNavBar(size),
          ),
        ],
      ),
    );
  }

  Container _bottomNavBar(Size size) {
    const middleButtonSize = 70.0;
    final middleButtonPositioned = (size.width / 2) - (middleButtonSize / 2);
    const navBarHeight = 90.0;

    return Container(
      color: Colors.transparent,
      height: 120,
      child: Stack(
        clipBehavior: Clip.antiAlias,
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: navBarHeight,
            child: Container(
              decoration: BoxDecoration(
                color: kBottomNavbarColor,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  right: kDefaultPadding,
                  left: kDefaultPadding,
                  bottom: kDefaultPadding,
                  top: kDefaultPadding / 4,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _navButton('Home', Icons.home),
                    _navButton('Accounts', Icons.wallet_travel, isActive: true),
                    const SizedBox(
                      width: 100,
                    ),
                    _navButton('Shop', Icons.shop),
                    _navButton('More', Icons.more_horiz_rounded),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: middleButtonPositioned,
            right: middleButtonPositioned,
            bottom: 35,
            height: middleButtonSize,
            child: Container(
              // padding: const EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                color: kActiveIconColor,
                borderRadius: BorderRadius.circular(50),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: Wrap(
                    direction: Axis.vertical,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.creditCard,
                        color: kOnPrimaryColor.withOpacity(0.8),
                        size: 25,
                      ),
                      const SizedBox(height: kDefaultPadding / 4),
                      Text(
                        'Pay',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: kOnPrimaryColor.withOpacity(0.8),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column _navButton(String label, IconData icon, {bool isActive = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          padding: const EdgeInsets.all(0),
          constraints: BoxConstraints.tight(const Size(40, 35)),
          onPressed: () {},
          icon: Icon(
            icon,
            size: 30,
            color: isActive ? kActiveIconColor : kInactiveIconColor,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isActive ? kActiveIconColor : kInactiveIconColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      toolbarHeight: 80,
      backgroundColor: kAccentColor,
      flexibleSpace: Container(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding / 2,
              vertical: kDefaultPadding / 2,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  maxRadius: 28,
                  minRadius: 28,
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding / 2,
                      vertical: kDefaultPadding,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Good Morning',
                          style: TextStyle(
                            color: kOnPrimaryColor.withOpacity(0.8),
                            fontSize: 12,
                          ),
                        ),
                        const Text(
                          'Mohammed Abdullah',
                          style: TextStyle(
                            color: kOnPrimaryColor,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    size: 30,
                    color: kOnPrimaryColor.withOpacity(0.8),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_none,
                    size: 30,
                    color: kOnPrimaryColor.withOpacity(0.8),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _cards(double remainingHeight, double screenWidth) {
    return SizedBox(
      height: remainingHeight * 0.5,
      child: Column(
        children: [
          _cardsCarousel2(screenWidth),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: InkWell(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding,
                              vertical: kDefaultPadding,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.lock,
                                  color: kOrange,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: kDefaultPadding / 2,
                                ),
                                Text(
                                  'Lock Card',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: kDefaultPadding,
                      ),
                      Flexible(
                        flex: 1,
                        child: InkWell(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding,
                              vertical: kDefaultPadding,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.settings,
                                  color: kOrange,
                                  size: 30,
                                ),
                                Text(
                                  'Card Settings',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: kDefaultPadding / 2,
                      right: kDefaultPadding / 2,
                      top: kDefaultPadding,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            image: const DecorationImage(
                              image: AssetImage('assets/images/applepay.png'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: kDefaultPadding / 2,
                        ),
                        const SizedBox(
                          width: 280,
                          child: FittedBox(
                            child: Text(
                              'This card has been added to Apple Wallet',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Flexible _cardsCarousel2(double screenWidth) {
    return Flexible(
      flex: 4,
      child: Padding(
        padding: const EdgeInsets.only(
          top: kDefaultPadding,
          bottom: kDefaultPadding / 2,
        ),
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return _card(screenWidth, index);
          },
          itemCount: 3,
          // curve: Curves.easeInExpo,
          // pagination: SwiperPagination(),
          // control: SwiperControl(),
          scale: 0.9,
          viewportFraction: 0.9,
          loop: false,
        ),
      ),
    );
  }

  Flexible _cardsCarousel(double screenWidth) {
    return Flexible(
      flex: 4,
      child: Padding(
        padding: const EdgeInsets.only(
          top: kDefaultPadding,
          bottom: kDefaultPadding / 2,
        ),
        child: ListView.builder(
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return _card(screenWidth, index);
          },
        ),
      ),
    );
  }

  Container _card(double screenWidth, int index) {
    return Container(
      width: screenWidth - (kDefaultPadding),
      height: 200,
      padding: const EdgeInsets.only(
        top: kDefaultPadding / 2,
      ),
      margin: const EdgeInsets.only(
        bottom: kDefaultPadding / 2,
      ),
      child: Column(
        children: [
          Flexible(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
                vertical: kDefaultPadding,
              ),
              decoration: BoxDecoration(
                color: cardColors[index],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Spacer(),
                      Icon(
                        Icons.ac_unit_rounded,
                        size: 40,
                        color: Colors.white,
                      )
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        'Digital Card',
                        style: TextStyle(
                          color: kOnPrimaryColor.withOpacity(0.8),
                          fontSize: 15,
                        ),
                      ),
                      const Spacer(),
                    ],
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFFFEFF),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, 2),
                    blurRadius: 2,
                    spreadRadius: 1,
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding / 2,
                vertical: kDefaultPadding / 2,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding,
                      vertical: kDefaultPadding / 2,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '....8179',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                            color: kTextColor,
                          ),
                        ),
                        Text(
                          'Show Card Info',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: kOrange,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text.rich(
                        TextSpan(
                            text: 'Status: ',
                            style:
                                TextStyle(color: kTextColor.withOpacity(0.5)),
                            children: const [
                              TextSpan(
                                text: 'Active',
                                style: TextStyle(
                                  color: Color(0xFF508E37),
                                ),
                              )
                            ]),
                      ),
                      Image.asset(
                        'assets/images/visa.png',
                        height: 40,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _transactions(double remainingHeight) {
    return Container(
        height: remainingHeight * 0.5,
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  Text(
                    'LAST TRANSACTIONS',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'See All',
                    style: TextStyle(
                      color: kOrange,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: transactions.length,
                separatorBuilder: (context, index) {
                  return const Divider(
                    thickness: 1,
                  );
                },
                itemBuilder: (context, index) {
                  final trx = transactions[index];
                  return ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(trx.image),
                    ),
                    title: Text(
                      trx.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      trx.date,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${trx.price > 0 ? '+' : '-'} SAR ${(trx.price - trx.price.truncate()) > 0 ? trx.price.toStringAsFixed(2) : trx.price.toStringAsFixed(0)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: trx.price > 0 ? kGreen : kRed,
                          ),
                        ),
                        Text(
                          trx.source,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
