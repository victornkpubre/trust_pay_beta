import 'dart:convert';
import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:trust_pay_beta/main/data/mappers/mapper.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';

import '../../mappers/entityConverter.dart';

part 'database.g.dart';

@DriftDatabase(tables: [TransactionData, UserData, ObligationData, NotificationData])
class AppDatabase extends _$AppDatabase {
  static AppDatabase instance() => AppDatabase();
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

@UseRowClass(TransactionDTO)
class TransactionData extends Table {
  IntColumn get id => integer()();
  IntColumn get userId => integer()();
  TextColumn get title => text()();
  TextColumn get type => text()();
  TextColumn get status => text()();
  RealColumn get total => real()();
  RealColumn get percentageComplete => real()();
  DateTimeColumn get dateCreated => dateTime()();
  DateTimeColumn get expiryDate => dateTime()();
  TextColumn get note => text().nullable()();
  TextColumn get mediation => text().nullable()();
  TextColumn get payee => text().nullable()();
  TextColumn get members => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class TransactionDTO {
  int? id;
  int? userId;
  String? title;
  String? type;
  String? status;
  double? total;
  double? percentageComplete;
  DateTime? dateCreated;
  DateTime? expiryDate;
  String? note;
  String? mediation;
  String? payee;
  String? members;
  TransactionDTO({
    this.id,
    this.userId,
    this.title,
    this.type,
    this.status,
    this.total,
    this.percentageComplete,
    this.dateCreated,
    this.expiryDate,
    this.note,
    this.mediation,
    this.payee,
    this.members,
  });

 TransactionDataCompanion  toCompanion() {
    return TransactionDataCompanion(
      id: Value(id??-1),
      userId: Value(userId??-1),
      title: Value(title??''),
      type: Value(type??''),
      status: Value(status??''),
      total: Value(total??0),
      percentageComplete: Value(percentageComplete??0),
      dateCreated: Value(dateCreated??DateTime.now()),
      expiryDate: Value(expiryDate??DateTime.now()),
      note: Value(note??''),
      mediation: Value(mediation??''),
      payee: Value(payee??''),
      members : Value(members ??'')
    );
  }

  Transaction toTransaction(List<Obligation> obligations, List<User> members) {
    return Transaction(
      id: id??0,
      userId: userId??0,
      title: title??'',
      type: type==null?TransactionType.secureSales: EntityConverter.transactionTypeFromString(type),
      status: status==null?TransactionStatus.pending: EntityConverter.transactionStatusFromString(status),
      total: total??0,
      percentageComplete: percentageComplete??0,
      dateCreated: dateCreated??DateTime.now(),
      expiryDate: expiryDate??DateTime.now(),
      note: note,
      mediation: mediation==null?null:
        mediation!.isNotEmpty? Mediation.fromJson(jsonDecode(mediation!)): null,
      payee: payee==null?null:
        payee!.isNotEmpty? User.fromJson(jsonDecode(payee!)): null,
      obligations: obligations,
      members : members
    );
  }
}


@UseRowClass(NotificationDTO)
class NotificationData extends Table {
  IntColumn get id => integer()();
  TextColumn get message => text()();
  TextColumn get state => text()();
  TextColumn get user => text().nullable()();
  TextColumn get transaction => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class NotificationDTO {
  int? id;
  String? message;
  String? user;
  String? transaction;
  String? state;

  NotificationDTO({
    this.id,
    this.message,
    this.user,
    this.transaction,
    this.state,
  });

  NotificationDataCompanion  toCompanion() {
    return NotificationDataCompanion(
        id: Value(id??-1),
        message: Value(message??''),
        state: Value(state??''),
        user: Value(user??''),
        transaction : Value(transaction ??'')
    );
  }

  Notification toNotification() {
    return Notification(
      id: id??0,
      message: message??'',
      user: user==null?DefaultUser(): User.fromJson(jsonDecode(user!)),
      state: state==null?NotificationState.sent: EntityConverter.notificationStateFromString(state),
      transaction: transaction==null?DefaultTransaction(): Transaction.fromJson(jsonDecode(transaction!)),
    );
  }
}

@UseRowClass(UserDTO)
class UserData extends Table {
  IntColumn get id => integer()();
  TextColumn get firstName => text()();
  TextColumn get lastName => text()();
  TextColumn get businessName => text().nullable()();
  TextColumn get email => text()();
  TextColumn get profileImage => text()();
  TextColumn get bvn => text()();
  TextColumn get fcmToken => text()();
  TextColumn get account => text().nullable()();
  TextColumn get userStatistics => text().nullable()();
  TextColumn get transactionStatistics => text().nullable()();
  BoolColumn get mediator => boolean()();
  BoolColumn get online => boolean()();
  BoolColumn get admin => boolean()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class UserDTO {
  int? id;
  String? firstName;
  String? lastName;
  String? businessName;
  String? email;
  String? profileImage;
  String? bvn;
  String? fcmToken;
  String? account;
  String? userStatistics;
  String? transactionStatistics;
  bool? mediator;
  bool? online;
  bool? admin;
  UserDTO({
    this.id,
    this.firstName,
    this.lastName,
    this.businessName,
    this.email,
    this.profileImage,
    this.bvn,
    this.fcmToken,
    this.account,
    this.userStatistics,
    this.transactionStatistics,
    this.mediator,
    this.online,
    this.admin,
  });

 UserDataCompanion  toCompanion() {
    return UserDataCompanion(
      id: Value(id??-1),
      firstName: Value(firstName??''),
      lastName: Value(lastName??''),
      businessName: Value(businessName??''),
      email: Value(email??''),
      profileImage: Value(profileImage??''),
      bvn: Value(bvn??''),
      fcmToken: Value(fcmToken??''),
      account: Value(account??''),
      userStatistics: Value(userStatistics??''),
      transactionStatistics: Value(transactionStatistics??''),
      mediator: Value(mediator??false),
      online: Value(online??false),
      admin: Value(admin??false),
    );
  }

  User toUser() {
    return User(
      id: id,
      firstName: firstName??'',
      lastName: lastName??'',
      businessName: businessName??'',
      email: email??'',
      profileImage: profileImage??'',
      bvn: bvn??'',
      fcmToken: fcmToken??'',
      account: account==null?null:
        account!.isNotEmpty? Account.fromJson(jsonDecode(account!)): null,
      userStatistics: userStatistics==null?null:
        userStatistics!.isNotEmpty? UserStatistics.fromJson(jsonDecode(userStatistics!)): null,
      transactionStatistics: transactionStatistics==null?null:
        transactionStatistics!.isNotEmpty? TransactionStatistics.fromJson(jsonDecode(transactionStatistics!)): null,
      mediator: mediator??false,
      online: online??false,
      admin: admin??false,
    );
  }
}

@UseRowClass(ObligationDTO)
class ObligationData extends Table {
  IntColumn get id => integer()();
  IntColumn get transactionId => integer()();
  TextColumn get title => text()();
  TextColumn get status => text()();
  TextColumn get type => text()();
  DateTimeColumn get dueDate => dateTime()();
  RealColumn get amount => real()();
  TextColumn get details => text()();
  TextColumn get token => text()();
  IntColumn get binding => integer().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class ObligationDTO {
  int? id;
  int? transactionId;
  String? title;
  String? type;
  String? status;
  double? amount;
  DateTime? dueDate;
  String? details;
  String? token;
  int? binding;
  ObligationDTO({
    this.id,
    this.transactionId,
    this.title,
    this.type,
    this.status,
    this.amount,
    this.dueDate,
    this.details,
    this.token,
    this.binding,
  });

 ObligationDataCompanion  toCompanion() {
    return ObligationDataCompanion(
      id: Value(id??-1),
      transactionId: Value(transactionId??-1),
      title: Value(title??''),
      type: Value(type??''),
      status: Value(status??''),
      amount: Value(amount??0),
      dueDate: Value(dueDate??DateTime.now()),
      details: Value(details??''),
      token: Value(token??''),
      // binding: Value(binding??-1)
    );
  }

  Obligation toObligation() {
    return Obligation(
      id: id,
      title: title??'',
      type: type==null?ObligationType.payment:ObligationType.values.firstWhere((t) => t.name.compareTo(type!) == 0),
      status: status==null?ObligationStatus.pending:ObligationStatus.values.firstWhere((t) => t.name.compareTo(status!) == 0),
      amount: amount??0,
      dueDate: dueDate??DateTime.now(),
      details: details,
      token: token,
      // binding: binding==null?null: User.fromJson(jsonDecode(binding!)),
    );
  }
  
}
