import 'package:flutter/material.dart';

import '../transaction.dart';
import 'transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;
  const TransactionList(this.transactions, this.onRemove, {super.key});

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (context, constrains) {
            return Column(
              children: <Widget>[
                SizedBox(height: constrains.maxHeight * 0.05),
                SizedBox(
                  height: constrains.maxHeight * 0.15,
                  child: Text('Nenhuma transação cadastrada',
                      style: Theme.of(context).textTheme.titleMedium),
                ),
                SizedBox(
                  height: constrains.maxHeight * 0.05,
                ),
                SizedBox(
                  height: constrains.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final tr = transactions[index];
              return TransactionItem(
                tr: tr,
                onRemove: onRemove,
                key: GlobalObjectKey(tr),
              );
            });
  }
}
