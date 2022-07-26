import 'package:flutter_todo_app/custom_imports.dart';
import 'package:flutter_todo_app/enum/rate_status_enum.dart';

class CryptoCurrencyAccount {
  final IconData symbol;
  final String name;
  final double balance;
  final double rate;
  final Color currencyColor;
  final RateStatusEnum rateStatus;

  CryptoCurrencyAccount(
    this.symbol,
    this.name,
    this.balance,
    this.rate,
    this.currencyColor,
    this.rateStatus,
  );
}
