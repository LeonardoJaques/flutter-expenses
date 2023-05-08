import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../transaction.dart';

class TransactionItem extends StatelessWidget {
  final Transaction tr;
  final void Function(String p1) onRemove;

  const TransactionItem({
    super.key,
    required this.tr,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        child: ListTile(
          leading: SizedBox(
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: FittedBox(
                    child: Text('R\$${tr.amount.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.titleSmall)),
              ),
            ),
          ),
          title: Text(tr.title, style: Theme.of(context).textTheme.titleMedium),
          subtitle: Text(
            DateFormat('d MMM y').format(tr.date),
          ),
          trailing: MediaQuery.of(context).size.width > 460
              ? TextButton.icon(
                  onPressed: () => onRemove(tr.id),
                  icon: const Icon(Icons.delete),
                  label: const Text('Excluir'),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.error),
                  ))
              : IconButton(
                  icon: const Icon(Icons.delete),
                  color: Theme.of(context).colorScheme.error,
                  onPressed: () => onRemove(tr.id),
                ),
        ));
  }
}
