// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:trust_pay_beta/components/inputs/app_select_input.dart';
// import 'package:trust_pay_beta/components/style/colors.dart';
// import 'package:trust_pay_beta/main/domain/entities/entities.dart';
// import 'package:trust_pay_beta/main/domain/repository/repositories.dart';
// import 'package:trust_pay_beta/main/presentation/base/toast.dart';
//
//
// class TransactionTestView extends StatefulWidget {
//   static const String routeName = '/test';
//
//   const TransactionTestView({super.key});
//
//   @override
//   State<TransactionTestView> createState() => _TransactionTestViewState();
// }
//
// class _TransactionTestViewState extends State<TransactionTestView> {
//   String? transactionType;
//   String? transactionTest;
//   Transaction? transaction;
//
//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     return Scaffold(
//         backgroundColor: AppColor.white,
//         resizeToAvoidBottomInset: false,
//         body: Column(
//           children: [
//             AppSelectInput(
//                 title: 'Transaction Type',
//                 width: width,
//                 menuList: TransactionType.values.where((t) => t.name.compareTo('groupGoals')!=0).map((t) => t.name).toList(),
//                 hint: 'Select Transaction Type',
//                 onSelect: (selection) {
//                   setState(() {
//                     transactionType = selection;
//                   });
//                 },
//             ),
//             const SizedBox(height: 32),
//
//             AppSelectInput(
//                 title: 'Test Type',
//                 width: width,
//                 menuList: getTests(transactionType, context),
//                 hint: 'Select Transaction Type',
//                 onSelect: (selection) {
//                   setState(() {
//                     transactionTest = selection;
//                   });
//                 },
//             ),
//             const SizedBox(height: 32),
//
//             transaction!=null?Column(
//               children: [
//                 Text(transaction?.title??''),
//                 const SizedBox(height: 32),
//                 const Text('Transaction State'),
//                 Text(transaction?.toString()??''),
//               ],
//             ): const Text('Select an Transaction'),
//
//             Row(
//               children: [
//                 ElevatedButton(
//                     child: const Text('Validate Transaction'),
//                     onPressed: () async {
//                       if(transactionType != null && transactionTest != null) {
//                         transaction = await getTransaction(
//                             true,
//                             transactionType!,
//                             transactionTest!,
//                             context
//                         );
//                       }
//                     },
//                 ),
//
//                 ElevatedButton(
//                     child: const Text('Invalidate Transaction'),
//                     onPressed: () async {
//                       if(transactionType != null && transactionTest != null) {
//                         transaction = await getTransaction(
//                             false,
//                             transactionType!,
//                             transactionTest!,
//                             context
//                         );
//                       }
//                     },
//                 ),
//               ],
//             ),
//             const Text('transaction details'),
//             Text(transaction.toString()),
//
//           ],
//         )
//     );
//   }
// }
//
// Future<Transaction?> getTransaction(bool validity, String transactionType, String transactionTest, BuildContext context) async {
//   TransactionType type = TransactionType.values.firstWhere((t) => t.name.compareTo(transactionType)==0);
//   Transaction transaction;
//   switch (type){
//     case TransactionType.billSplitter:
//       transaction = await createBillSplitterTransaction(members: 5, bill: 50000, test: transactionTest, context: context);
//       break;
//     case TransactionType.secureSales:
//       transaction = await createSecureSalesTransaction(members: 5, bill: 50000, test: transactionTest, context: context);
//       break;
//     case TransactionType.moneyPool:
//       transaction = await createMoneyPoolTransaction(members: 5, bill: 50000, test: transactionTest, context: context);
//       break;
//     case TransactionType.betsWagers:
//       transaction = await createBetWagersTransaction(members: 5, bill: 50000, test: transactionTest, context: context);
//       break;
//
//     default:
//   }
//
//   return (await context.read<TransactionRepository>().createTransaction(transaction)).fold(
//   (failure){
//     toast(message: failure.toString());
//     return null;
//   },
//   (entity){
//     return entity;
//   });
// }
//
// Future<Transaction> createBillSplitterTransaction({required int members, required double bill, required String test, required BuildContext context}) async {
//   List<User> users = [];
//   for(int i=1; i<members+1; i++) {
//     (await context.read<UserRepository>().getUser(i)).fold(
//     (failure){
//       toast(message: failure.toString());
//       return null;
//     },
//     (entity){
//       return users.add(entity);
//     });
//   }
//
//   final Transaction transaction = Transaction(
//     title: "title",
//     type: TransactionType.billSplitter,
//     total: bill,
//     dateCreated: DateTime.now(),
//     expiryDate: DateTime.now().add(Duration(days: 60)),
//     percentageComplete: 0,
//     status: getStatus(test),
//     obligations: getObligations(test),
//     members: users
//   );
//
//   return transaction;
// }
//
// List<String> getTests(String? transactionType, BuildContext context) {
//
// }
