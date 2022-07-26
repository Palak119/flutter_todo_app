import 'package:flutter_todo_app/custom_imports.dart';

Widget buildTopFixedHeader(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        customInkwellButton(
          context,
          Icons.menu,
          Colors.white,
          Colors.white24,
          8,
          onTap: () {
            showInfoToast(context, 'Open Drawer');
          },
        ),
        const Spacer(),
        customInkwellButton(
          context,
          Icons.line_axis,
          Colors.white,
          Colors.white24,
          8,
          onTap: () {
            showInfoToast(context, 'Show Chart');
          },
        ),
        customInkwellButton(
          context,
          Icons.notifications_sharp,
          Colors.white,
          Colors.white24,
          8,
          onTap: () {
            showInfoToast(context, 'Show Notifications');
          },
        ),
      ],
    ),
  );
}

Widget buildHidableAccBalanceWidget(BuildContext context, bool showAppBar) {
  return AnimatedContainer(
    height: showAppBar ? sizeHeight(330) : 0.0,
    duration: const Duration(milliseconds: 300),
    child: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: sizeWidth(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            verticalSpace(context, 0.03),

            /// account balance in dollars
            Row(
              children: [
                Row(
                  children: [
                    Text(
                      '20 159.52',
                      style: bodyLargeTextStyle(context)
                          .copyWith(fontSize: 34, color: Colors.white),
                    ),
                    horizontalSpace(context, 0.03),
                    Text(
                      'USD',
                      style: bodyLargeTextStyle(context).copyWith(
                          fontSize: 34,
                          fontWeight: FontWeight.w200,
                          color: Colors.white),
                    ),
                    horizontalSpace(context, 0.02),
                    customInkwellButton(
                      context,
                      Icons.expand_more_rounded,
                      Colors.white38,
                      Colors.white12,
                      4,
                      onTap: () {
                        showInfoToast(context, 'Change Currency');
                      },
                    ),
                  ],
                )
              ],
            ),
            verticalSpace(context, 0.02),

            /// balance rate
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  balanceTitle,
                  style: titleMediumTextStyle(context)
                      .copyWith(color: Colors.white70),
                ),
                horizontalSpace(context, 0.03),
                Text(
                  '+1282.34',
                  style: titleMediumTextStyle(context)
                      .copyWith(color: Colors.white54),
                ),
              ],
            ),

            verticalSpace(context, 0.02),

            /// crypto currency balance

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildCryptoCurrencyStatus(context, 'BTC', '40%', '+5%'),
                buildCryptoCurrencyStatus(context, 'ETH', '60%', '+3%'),
              ],
            ),

            /// add func button

            verticalSpace(context, 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildAddFundsButton(context),
                buildDynamicDropDownButton(context),
              ],
            ),
            verticalSpace(context, 0.03),
          ],
        ),
      ),
    ),
  );
}

Widget buildCryptoCurrencyStatus(
  BuildContext context,
  String cryptoName,
  String cryptoValue,
  String currentStatusValue,
) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white10,
              Colors.transparent,
            ],
          ),
          border: Border(
            left: BorderSide(color: Colors.amber, width: 3),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(
            sizeWidth(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cryptoName,
                style:
                    titleMediumTextStyle(context).copyWith(color: Colors.amber),
              ),
              verticalSpace(context, 0.01),
              Text(
                cryptoValue,
                style: titleMediumTextStyle(context)
                    .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              verticalSpace(context, 0.01),
              Text(
                currentStatusValue,
                style: titleMediumTextStyle(context)
                    .copyWith(color: Colors.white30),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget buildAddFundsButton(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white38,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: customInkwellButton(
          context,
          Icons.add,
          Colors.white,
          Colors.white24,
          8,
          onTap: () {
            showInfoToast(context, 'show dropdown');
          },
        ),
      ),
      horizontalSpace(context, 0.03),
      Text(
        addFundsTitle,
        style: titleMediumTextStyle(context).copyWith(
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    ],
  );
}

Widget buildDynamicDropDownButton(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.white38, width: 2),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            dynamicTitle,
            style: titleMediumTextStyle(context).copyWith(
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          horizontalSpace(context, 0.03),
          customInkwellButton(
            context,
            Icons.expand_more_outlined,
            Colors.white,
            Colors.white24,
            2,
            onTap: () {
              showInfoToast(context, 'show dropdown');
            },
          ),
        ],
      ),
    ),
  );
}

Widget buildAccountHeaderRow(BuildContext context) {
  return Row(
    children: [
      Text(
        accountTitle,
        style: titleLargeTextStyle(context)
            .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
      ),
      const Spacer(),
      customInkwellButton(
        context,
        Icons.settings,
        Colors.black87,
        Colors.grey,
        4,
        onTap: () {
          showInfoToast(context, 'Open Settings');
        },
      ),
    ],
  );
}

Widget buildCryptoCurrencyAccountItem(
  BuildContext context,
  CryptoCurrencyAccount cryptoCurrencyAccount, {
  required Function onExpandButtonTapped,
}) {
  return Card(
    elevation: 8,
    shadowColor: cardShadowColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(
        vertical: sizeWidth(8),
        horizontal: sizeWidth(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: cryptoCurrencyAccount.currencyColor.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: EdgeInsets.all(
                sizeWidth(8),
              ),
              child: Icon(
                cryptoCurrencyAccount.symbol,
                color: cryptoCurrencyAccount.currencyColor,
              ),
            ),
          ),
          verticalSpace(context, 0.01),
          Text(
            cryptoCurrencyAccount.name,
            style: titleMediumTextStyle(context).copyWith(
              fontWeight: FontWeight.w500,
              color: cryptoCurrencyAccount.currencyColor,
            ),
          ),
          verticalSpace(context, 0.01),
          Text(
            '\$${cryptoCurrencyAccount.balance}',
            style: titleMediumTextStyle(context)
                .copyWith(fontWeight: FontWeight.bold),
          ),
          verticalSpace(context, 0.015),
          Row(
            children: [
              if (cryptoCurrencyAccount.rateStatus == RateStatusEnum.positive)
                Text(
                  '+${cryptoCurrencyAccount.rate}%',
                  style: titleMediumTextStyle(context).copyWith(
                      color: Colors.tealAccent.shade700,
                      fontWeight: FontWeight.bold),
                )
              else if (cryptoCurrencyAccount.rateStatus ==
                  RateStatusEnum.negative)
                Text(
                  '-${cryptoCurrencyAccount.rate}%',
                  style: titleMediumTextStyle(context).copyWith(
                      color: Colors.redAccent.shade700,
                      fontWeight: FontWeight.bold),
                )
              else
                Text(
                  '${cryptoCurrencyAccount.rate}%',
                  style: titleMediumTextStyle(context).copyWith(
                      color: Colors.grey.shade700, fontWeight: FontWeight.bold),
                ),
              const Spacer(),
              customInkwellButton(
                context,
                Icons.expand_more_sharp,
                Colors.black38,
                cryptoCurrencyAccount.currencyColor,
                4,
                onTap: () => onExpandButtonTapped(),
              )
            ],
          ),
        ],
      ),
    ),
  );
}
