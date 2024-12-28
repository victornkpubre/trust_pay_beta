import 'dart:convert';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';

import '../local_database/database.dart';

abstract class LocalDataSource {
  Future<void> storeTransactionHistory(List<Transaction> transactions);
  Future<void> storeTransaction(Transaction transaction);
  Future<List<Transaction>?> readTransactionHistory(int pageSize, int pageNumber);
  Future<Transaction?> readTransaction(int id);
  Future<bool> updateTransaction(Transaction transaction);
  Future<bool> updateObligation(int transactionId, Obligation obligation);
  Future<bool> updateUser(int transactionId, User user);
  // Future<List<Transaction>?> readTransactionsByMember(int id);
}

class LocalDataSourceImplementation implements LocalDataSource {
  final AppDatabase _database = AppDatabase();
  LocalDataSourceImplementation();
  
  @override
  Future<void> storeTransactionHistory(List<Transaction> transactions) async {
    //Store Transactions
    final transactionDTOs = transactions.map((t){
      return t.toTransactionDTO().toCompanion();
    });

    await _database.batch((batch) {
      batch.insertAll(_database.transactionData, transactionDTOs);
    });

    //Store Obligations
    for (var transaction in transactions) {
      if(transaction.obligations.isNotEmpty) {
        final obligationsDTOs = transaction.obligations.map((t){
          return t.toObligationDTO().toCompanion();
        });
        await _database.batch((batch) {
          batch.insertAll(_database.obligationData, obligationsDTOs);
        });
      }
    }
  }
  
  @override
  Future<Transaction?> readTransaction(int id) async {
    //Read Transaction
    TransactionDTO? transactionDto = await (_database.select(_database.transactionData)..where((record){
      return record.id.equals(id);
    })).getSingleOrNull();

    if(transactionDto == null) return null;

    List<Obligation> obligations = await _readObligationsByTransactionDTO(transactionDto);
    List<User> users = await _readUsersByTransactionDTO(transactionDto);
    
    return transactionDto.toTransaction(obligations, users);
  }


  Future<List<Obligation>> _readObligationsByTransactionDTO(TransactionDTO dto) async {
    List<ObligationDTO>? obligationDTOs = await (_database.select(_database.obligationData)..where((record){
      return record.transactionId.equals(dto.id??-1);
    })).get();
    return obligationDTOs.map((o) => o.toObligation()).toList();
  }

  Future<List<User>> _readUsersByTransactionDTO(TransactionDTO dto) async {
    List<User> users = [];
    if(dto.members != null) {
      List<int> userIds = jsonDecode(dto.members!);
      for (var id in userIds) {
        final userDTO = await (_database.select(_database.userData)..where((record) {
          return record.id.equals(id);
        })).getSingleOrNull();
        
        if(userDTO != null) {
          users.add(userDTO.toUser());
        }
      }
    }
    return users;
  }

  @override
  Future<List<Transaction>?> readTransactionHistory(int pageSize, int pageNumber) async {
    List<TransactionDTO>? transactionDTOs = await (
      _database.select(_database.transactionData)..limit(pageSize, offset: pageNumber*pageSize)
    ).get();

    List<Transaction> transactions = [];
    for (var dto in transactionDTOs) {
      List<Obligation> obligations = await _readObligationsByTransactionDTO(dto);
      List<User> members = await _readUsersByTransactionDTO(dto);
      transactions.add(dto.toTransaction(obligations, members));
    }
    
    return transactions;    
  }

  @override
  Future<bool> updateTransaction(Transaction transaction) {
    return _database
        .update(_database.transactionData)
        .replace(transaction.toTransactionDTO().toCompanion());
  }

  @override
  Future<void> storeTransaction(Transaction transaction) async {
    await _database.batch((batch) {
      batch.insert(_database.transactionData, transaction.toTransactionDTO().toCompanion());
    });
  }

  @override
  Future<bool> updateObligation(int? transactionId, Obligation obligation) async {
    final result = await readTransaction(transactionId??-1);
    if(result != null) {
      int index = result.obligations.indexWhere((o) => o.id == obligation.id);
      result.obligations.replaceRange(index, index, [obligation]);

      return await updateTransaction(result);
    }
    else {
      return false;
    }
  }

  @override
  Future<bool> updateUser(int transactionId, User user) async {
    final result = await readTransaction(transactionId??-1);
    if(result != null) {
      int index = result.members.indexWhere((m) => m.id == user.id);
      result.members.replaceRange(index, index, [user]);

      return await updateTransaction(result);
    }
    else {
      return false;
    }
  }

  
  // @override
  // Future<List<Transaction>?> readTransactionsByMember(int id) async {
  //   final transactionDtos = await (_database.select(_database.transactionData)).get();
  //
  //   List<Transaction> transactions = [];
  //   for (var dto in transactionDtos) {
  //     if(dto.members != null) {
  //       List<int> ids = jsonDecode(dto.members!);
  //       if(ids.contains(id)){
  //         List<Obligation> obligations = await _readObligationsByTransactionDTO(dto);
  //         List<User> members = await _readUsersByTransactionDTO(dto);
  //         transactions.add(dto.toTransaction(obligations, members));
  //       }
  //     }
  //   }
  //
  //   return transactions;
  // }



}
