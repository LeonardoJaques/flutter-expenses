import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../transaction.dart';

class TransactionItem extends StatefulWidget {
  final Transaction tr;
  final void Function(String p1) onRemove;

  const TransactionItem({
    super.key,
    required this.tr,
    required this.onRemove,
  });

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  static const colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.black,
    Colors.teal,
  ];

  late Color _backgroundColor;

  @override
  void initState() {
    super.initState();
    int index = Random().nextInt(5);
    _backgroundColor = colors[index];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        child: ListTile(
          leading: SizedBox(
            child: CircleAvatar(
              radius: 30,
              backgroundColor: _backgroundColor,
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: FittedBox(
                    child: Text('R\$${widget.tr.amount.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.titleSmall)),
              ),
            ),
          ),
          title: Text(widget.tr.title,
              style: Theme.of(context).textTheme.titleMedium),
          subtitle: Text(
            DateFormat('d MMM y').format(widget.tr.date),
          ),
          trailing: MediaQuery.of(context).size.width > 460
              ? TextButton.icon(
                  onPressed: () => widget.onRemove(widget.tr.id),
                  icon: const Icon(Icons.delete),
                  label: const Text('Excluir'),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.error),
                  ))
              : IconButton(
                  icon: const Icon(Icons.delete),
                  color: Theme.of(context).colorScheme.error,
                  onPressed: () => widget.onRemove(widget.tr.id),
                ),
        ));
  }
}
