import '../../cubit/transaction_cubit.dart';
import '../../shared/theme.dart';
import '../../widgets/custom_transaction_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    context.read<TransactionCubit>().fetchTransaction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        if (state is TransactionSuccess) {
          if (state.transaction.isEmpty) {
            return const Center(
              child: Text('Kamu belum memiliki transaksi'),
            );
          } else {
            return ListView.builder(
              itemCount: state.transaction.length,
              padding: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              itemBuilder: (context, index) {
                return CustomTransactionCard(
                  state.transaction[index],
                );
              },
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
