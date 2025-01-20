import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:trust_pay_beta/main/data/data_source/local_database/preferences.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import '../local_database/database.dart';

abstract class LocalDataSource {
  Future<void> storeTransactionHistory(List<Transaction> transactions);
  Future<void> storeTransaction(Transaction transaction);
  Future<void> storeNotifications(List<Notification> notifications);
  Future<void> storeNotification(Notification notification);
  Future<void> storeCurrentUser(User user);
  Future<void> storeAuthToken(String token);

  Future<List<Transaction>?> readTransactionHistory(int pageSize, int pageNumber);
  Future<List<Notification>?> readNotifications(int pageSize, int pageNumber);
  Future<Transaction?> readTransaction(int id);
  Future<User?> readCurrentUser();
  Future<String?> readAuthToken();

  Future<bool> updateTransaction(Transaction transaction);
  Future<bool> updateTransactionObligation(int transactionId, Obligation obligation);
  Future<bool> updateTransactionUser(int transactionId, User user);
  // Future<List<Transaction>?> readTransactionsByMember(int id);
}

class LocalDataSourceImplementation implements LocalDataSource {
  final AppDatabase _database = AppDatabase();
  final AppPreferences _preference;

  LocalDataSourceImplementation(AppPreferences preference) : _preference = preference;

  @override
  Future<void> storeTransactionHistory(List<Transaction> transactions) async {
    //Store Transactions
    final transactionDTOs = transactions.map((t){
      return t.toTransactionDTO().toCompanion();
    }).toList();

    await _database.batch((batch) {
      try{
        batch.insertAll(_database.transactionData, transactionDTOs, mode: InsertMode.insertOrReplace);
      }
      catch (e) {
        print(e);
      }
    });
    print("inserted successfully");


    //Store Obligations and Members
    for (var transaction in transactions) {
      if(transaction.obligations.isNotEmpty) {
        final obligationsDTOs = transaction.obligations.map((t){
          return t.toObligationDTO(transaction.id??-1).toCompanion();
        });
        await _database.batch((batch) {
          batch.insertAll(_database.obligationData, obligationsDTOs, mode: InsertMode.insertOrReplace);
        });
      }

      if(transaction.members.isNotEmpty) {
        final usersDTOs = transaction.members.map((m){
          return m.toUserDTO().toCompanion();
        });
        await _database.batch((batch) {
          batch.insertAll(_database.userData, usersDTOs, mode: InsertMode.insertOrReplace);
        });
      }
    }
  }

  @override
  Future<void> storeTransaction(Transaction transaction) async {
    await _database.batch((batch) {
      batch.insert(_database.transactionData, transaction.toTransactionDTO().toCompanion());
    });
  }

  @override
  Future<void> storeNotifications(List<Notification> notifications) async {
    final notificationDTOs = notifications.map((n){
      return n.toNotificationDTO().toCompanion();
    });

    await _database.batch((batch) {
      batch.insertAll(_database.transactionData, notificationDTOs);
    });
  }

  @override
  Future<void> storeNotification(Notification notification) async {
    await _database.batch((batch) {
      batch.insert(_database.notificationData, notification.toNotificationDTO().toCompanion());
    });
  }

  @override
  Future<void> storeCurrentUser(User user) async {
    await _preference.setUser(user);
  }

  @override
  Future<void> storeAuthToken(String token) async {
    await _preference.setAccessToken(token);
  }

  @override
  Future<List<Transaction>?> readTransactionHistory(int pageSize, int pageNumber) async {
    List<TransactionDTO>? transactionDTOs = await (
        _database.select(_database.transactionData)
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
  Future<List<Notification>?> readNotifications(int pageSize, int page) async {
    List<NotificationDTO>? notificationDTOs = await (
        _database.select(_database.notificationData)..limit(pageSize, offset: page*pageSize)
    ).get();

    List<Notification> notifications = [];
    for (var dto in notificationDTOs) {
      notifications.add(dto.toNotification());
    }

    return notifications;
  }

  @override
  Future<User?> readCurrentUser() {
    return _preference.getUser();
  }

  @override
  Future<String?> readAuthToken() {
    return _preference.getAccessToken();
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
      final transactionId = record.transactionId;
      final result = transactionId.equals(dto.id??-1);
      return result;
    })).get();

    return obligationDTOs.map((o) => o.toObligation()).toList();
  }

  Future<List<User>> _readUsersByTransactionDTO(TransactionDTO dto) async {
    List<User> users = [];
    if(dto.members != null) {
      List<int> userIds = List<int>.from(jsonDecode(dto.members!));
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
  Future<bool> updateTransaction(Transaction transaction) {
    return _database
        .update(_database.transactionData)
        .replace(transaction.toTransactionDTO().toCompanion());
  }

  @override
  Future<bool> updateTransactionObligation(int? transactionId, Obligation obligation) async {
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
  Future<bool> updateTransactionUser(int transactionId, User user) async {
    final result = await readTransaction(transactionId);
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
  //   return transactions;
  // }



}
