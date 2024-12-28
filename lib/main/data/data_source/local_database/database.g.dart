// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $TransactionDataTable extends TransactionData
    with TableInfo<$TransactionDataTable, TransactionDTO> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionDataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<double> total = GeneratedColumn<double>(
      'total', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _percentageCompleteMeta =
      const VerificationMeta('percentageComplete');
  @override
  late final GeneratedColumn<double> percentageComplete =
      GeneratedColumn<double>('percentage_complete', aliasedName, false,
          type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _dateCreatedMeta =
      const VerificationMeta('dateCreated');
  @override
  late final GeneratedColumn<DateTime> dateCreated = GeneratedColumn<DateTime>(
      'date_created', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _expiryDateMeta =
      const VerificationMeta('expiryDate');
  @override
  late final GeneratedColumn<DateTime> expiryDate = GeneratedColumn<DateTime>(
      'expiry_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _mediationMeta =
      const VerificationMeta('mediation');
  @override
  late final GeneratedColumn<String> mediation = GeneratedColumn<String>(
      'mediation', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _payeeMeta = const VerificationMeta('payee');
  @override
  late final GeneratedColumn<String> payee = GeneratedColumn<String>(
      'payee', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _membersMeta =
      const VerificationMeta('members');
  @override
  late final GeneratedColumn<String> members = GeneratedColumn<String>(
      'members', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        title,
        type,
        status,
        total,
        percentageComplete,
        dateCreated,
        expiryDate,
        note,
        mediation,
        payee,
        members
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transaction_data';
  @override
  VerificationContext validateIntegrity(Insertable<TransactionDTO> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('total')) {
      context.handle(
          _totalMeta, total.isAcceptableOrUnknown(data['total']!, _totalMeta));
    } else if (isInserting) {
      context.missing(_totalMeta);
    }
    if (data.containsKey('percentage_complete')) {
      context.handle(
          _percentageCompleteMeta,
          percentageComplete.isAcceptableOrUnknown(
              data['percentage_complete']!, _percentageCompleteMeta));
    } else if (isInserting) {
      context.missing(_percentageCompleteMeta);
    }
    if (data.containsKey('date_created')) {
      context.handle(
          _dateCreatedMeta,
          dateCreated.isAcceptableOrUnknown(
              data['date_created']!, _dateCreatedMeta));
    } else if (isInserting) {
      context.missing(_dateCreatedMeta);
    }
    if (data.containsKey('expiry_date')) {
      context.handle(
          _expiryDateMeta,
          expiryDate.isAcceptableOrUnknown(
              data['expiry_date']!, _expiryDateMeta));
    } else if (isInserting) {
      context.missing(_expiryDateMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    if (data.containsKey('mediation')) {
      context.handle(_mediationMeta,
          mediation.isAcceptableOrUnknown(data['mediation']!, _mediationMeta));
    }
    if (data.containsKey('payee')) {
      context.handle(
          _payeeMeta, payee.isAcceptableOrUnknown(data['payee']!, _payeeMeta));
    }
    if (data.containsKey('members')) {
      context.handle(_membersMeta,
          members.isAcceptableOrUnknown(data['members']!, _membersMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  TransactionDTO map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionDTO(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      total: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total'])!,
      percentageComplete: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}percentage_complete'])!,
      dateCreated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_created'])!,
      expiryDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}expiry_date'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
      mediation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mediation']),
      payee: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payee']),
      members: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}members']),
    );
  }

  @override
  $TransactionDataTable createAlias(String alias) {
    return $TransactionDataTable(attachedDatabase, alias);
  }
}

class TransactionDataCompanion extends UpdateCompanion<TransactionDTO> {
  final Value<int> id;
  final Value<int> userId;
  final Value<String> title;
  final Value<String> type;
  final Value<String> status;
  final Value<double> total;
  final Value<double> percentageComplete;
  final Value<DateTime> dateCreated;
  final Value<DateTime> expiryDate;
  final Value<String?> note;
  final Value<String?> mediation;
  final Value<String?> payee;
  final Value<String?> members;
  final Value<int> rowid;
  const TransactionDataCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.title = const Value.absent(),
    this.type = const Value.absent(),
    this.status = const Value.absent(),
    this.total = const Value.absent(),
    this.percentageComplete = const Value.absent(),
    this.dateCreated = const Value.absent(),
    this.expiryDate = const Value.absent(),
    this.note = const Value.absent(),
    this.mediation = const Value.absent(),
    this.payee = const Value.absent(),
    this.members = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TransactionDataCompanion.insert({
    required int id,
    required int userId,
    required String title,
    required String type,
    required String status,
    required double total,
    required double percentageComplete,
    required DateTime dateCreated,
    required DateTime expiryDate,
    this.note = const Value.absent(),
    this.mediation = const Value.absent(),
    this.payee = const Value.absent(),
    this.members = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        userId = Value(userId),
        title = Value(title),
        type = Value(type),
        status = Value(status),
        total = Value(total),
        percentageComplete = Value(percentageComplete),
        dateCreated = Value(dateCreated),
        expiryDate = Value(expiryDate);
  static Insertable<TransactionDTO> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<String>? title,
    Expression<String>? type,
    Expression<String>? status,
    Expression<double>? total,
    Expression<double>? percentageComplete,
    Expression<DateTime>? dateCreated,
    Expression<DateTime>? expiryDate,
    Expression<String>? note,
    Expression<String>? mediation,
    Expression<String>? payee,
    Expression<String>? members,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (title != null) 'title': title,
      if (type != null) 'type': type,
      if (status != null) 'status': status,
      if (total != null) 'total': total,
      if (percentageComplete != null) 'percentage_complete': percentageComplete,
      if (dateCreated != null) 'date_created': dateCreated,
      if (expiryDate != null) 'expiry_date': expiryDate,
      if (note != null) 'note': note,
      if (mediation != null) 'mediation': mediation,
      if (payee != null) 'payee': payee,
      if (members != null) 'members': members,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TransactionDataCompanion copyWith(
      {Value<int>? id,
      Value<int>? userId,
      Value<String>? title,
      Value<String>? type,
      Value<String>? status,
      Value<double>? total,
      Value<double>? percentageComplete,
      Value<DateTime>? dateCreated,
      Value<DateTime>? expiryDate,
      Value<String?>? note,
      Value<String?>? mediation,
      Value<String?>? payee,
      Value<String?>? members,
      Value<int>? rowid}) {
    return TransactionDataCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      type: type ?? this.type,
      status: status ?? this.status,
      total: total ?? this.total,
      percentageComplete: percentageComplete ?? this.percentageComplete,
      dateCreated: dateCreated ?? this.dateCreated,
      expiryDate: expiryDate ?? this.expiryDate,
      note: note ?? this.note,
      mediation: mediation ?? this.mediation,
      payee: payee ?? this.payee,
      members: members ?? this.members,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (total.present) {
      map['total'] = Variable<double>(total.value);
    }
    if (percentageComplete.present) {
      map['percentage_complete'] = Variable<double>(percentageComplete.value);
    }
    if (dateCreated.present) {
      map['date_created'] = Variable<DateTime>(dateCreated.value);
    }
    if (expiryDate.present) {
      map['expiry_date'] = Variable<DateTime>(expiryDate.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (mediation.present) {
      map['mediation'] = Variable<String>(mediation.value);
    }
    if (payee.present) {
      map['payee'] = Variable<String>(payee.value);
    }
    if (members.present) {
      map['members'] = Variable<String>(members.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionDataCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('title: $title, ')
          ..write('type: $type, ')
          ..write('status: $status, ')
          ..write('total: $total, ')
          ..write('percentageComplete: $percentageComplete, ')
          ..write('dateCreated: $dateCreated, ')
          ..write('expiryDate: $expiryDate, ')
          ..write('note: $note, ')
          ..write('mediation: $mediation, ')
          ..write('payee: $payee, ')
          ..write('members: $members, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserDataTable extends UserData with TableInfo<$UserDataTable, UserDTO> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserDataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _firstNameMeta =
      const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'first_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _businessNameMeta =
      const VerificationMeta('businessName');
  @override
  late final GeneratedColumn<String> businessName = GeneratedColumn<String>(
      'business_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _profileImageMeta =
      const VerificationMeta('profileImage');
  @override
  late final GeneratedColumn<String> profileImage = GeneratedColumn<String>(
      'profile_image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _bvnMeta = const VerificationMeta('bvn');
  @override
  late final GeneratedColumn<String> bvn = GeneratedColumn<String>(
      'bvn', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fcmTokenMeta =
      const VerificationMeta('fcmToken');
  @override
  late final GeneratedColumn<String> fcmToken = GeneratedColumn<String>(
      'fcm_token', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _accountMeta =
      const VerificationMeta('account');
  @override
  late final GeneratedColumn<String> account = GeneratedColumn<String>(
      'account', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _userStatisticsMeta =
      const VerificationMeta('userStatistics');
  @override
  late final GeneratedColumn<String> userStatistics = GeneratedColumn<String>(
      'user_statistics', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _transactionStatisticsMeta =
      const VerificationMeta('transactionStatistics');
  @override
  late final GeneratedColumn<String> transactionStatistics =
      GeneratedColumn<String>('transaction_statistics', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _mediatorMeta =
      const VerificationMeta('mediator');
  @override
  late final GeneratedColumn<bool> mediator = GeneratedColumn<bool>(
      'mediator', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("mediator" IN (0, 1))'));
  static const VerificationMeta _onlineMeta = const VerificationMeta('online');
  @override
  late final GeneratedColumn<bool> online = GeneratedColumn<bool>(
      'online', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("online" IN (0, 1))'));
  static const VerificationMeta _adminMeta = const VerificationMeta('admin');
  @override
  late final GeneratedColumn<bool> admin = GeneratedColumn<bool>(
      'admin', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("admin" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        firstName,
        lastName,
        businessName,
        email,
        profileImage,
        bvn,
        fcmToken,
        account,
        userStatistics,
        transactionStatistics,
        mediator,
        online,
        admin
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_data';
  @override
  VerificationContext validateIntegrity(Insertable<UserDTO> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('business_name')) {
      context.handle(
          _businessNameMeta,
          businessName.isAcceptableOrUnknown(
              data['business_name']!, _businessNameMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('profile_image')) {
      context.handle(
          _profileImageMeta,
          profileImage.isAcceptableOrUnknown(
              data['profile_image']!, _profileImageMeta));
    } else if (isInserting) {
      context.missing(_profileImageMeta);
    }
    if (data.containsKey('bvn')) {
      context.handle(
          _bvnMeta, bvn.isAcceptableOrUnknown(data['bvn']!, _bvnMeta));
    } else if (isInserting) {
      context.missing(_bvnMeta);
    }
    if (data.containsKey('fcm_token')) {
      context.handle(_fcmTokenMeta,
          fcmToken.isAcceptableOrUnknown(data['fcm_token']!, _fcmTokenMeta));
    } else if (isInserting) {
      context.missing(_fcmTokenMeta);
    }
    if (data.containsKey('account')) {
      context.handle(_accountMeta,
          account.isAcceptableOrUnknown(data['account']!, _accountMeta));
    }
    if (data.containsKey('user_statistics')) {
      context.handle(
          _userStatisticsMeta,
          userStatistics.isAcceptableOrUnknown(
              data['user_statistics']!, _userStatisticsMeta));
    }
    if (data.containsKey('transaction_statistics')) {
      context.handle(
          _transactionStatisticsMeta,
          transactionStatistics.isAcceptableOrUnknown(
              data['transaction_statistics']!, _transactionStatisticsMeta));
    }
    if (data.containsKey('mediator')) {
      context.handle(_mediatorMeta,
          mediator.isAcceptableOrUnknown(data['mediator']!, _mediatorMeta));
    } else if (isInserting) {
      context.missing(_mediatorMeta);
    }
    if (data.containsKey('online')) {
      context.handle(_onlineMeta,
          online.isAcceptableOrUnknown(data['online']!, _onlineMeta));
    } else if (isInserting) {
      context.missing(_onlineMeta);
    }
    if (data.containsKey('admin')) {
      context.handle(
          _adminMeta, admin.isAcceptableOrUnknown(data['admin']!, _adminMeta));
    } else if (isInserting) {
      context.missing(_adminMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  UserDTO map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserDTO(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      firstName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_name'])!,
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name'])!,
      businessName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}business_name']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      profileImage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}profile_image'])!,
      bvn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}bvn'])!,
      fcmToken: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}fcm_token'])!,
      account: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}account']),
      userStatistics: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_statistics']),
      transactionStatistics: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}transaction_statistics']),
      mediator: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}mediator'])!,
      online: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}online'])!,
      admin: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}admin'])!,
    );
  }

  @override
  $UserDataTable createAlias(String alias) {
    return $UserDataTable(attachedDatabase, alias);
  }
}

class UserDataCompanion extends UpdateCompanion<UserDTO> {
  final Value<int> id;
  final Value<String> firstName;
  final Value<String> lastName;
  final Value<String?> businessName;
  final Value<String> email;
  final Value<String> profileImage;
  final Value<String> bvn;
  final Value<String> fcmToken;
  final Value<String?> account;
  final Value<String?> userStatistics;
  final Value<String?> transactionStatistics;
  final Value<bool> mediator;
  final Value<bool> online;
  final Value<bool> admin;
  final Value<int> rowid;
  const UserDataCompanion({
    this.id = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.businessName = const Value.absent(),
    this.email = const Value.absent(),
    this.profileImage = const Value.absent(),
    this.bvn = const Value.absent(),
    this.fcmToken = const Value.absent(),
    this.account = const Value.absent(),
    this.userStatistics = const Value.absent(),
    this.transactionStatistics = const Value.absent(),
    this.mediator = const Value.absent(),
    this.online = const Value.absent(),
    this.admin = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserDataCompanion.insert({
    required int id,
    required String firstName,
    required String lastName,
    this.businessName = const Value.absent(),
    required String email,
    required String profileImage,
    required String bvn,
    required String fcmToken,
    this.account = const Value.absent(),
    this.userStatistics = const Value.absent(),
    this.transactionStatistics = const Value.absent(),
    required bool mediator,
    required bool online,
    required bool admin,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        firstName = Value(firstName),
        lastName = Value(lastName),
        email = Value(email),
        profileImage = Value(profileImage),
        bvn = Value(bvn),
        fcmToken = Value(fcmToken),
        mediator = Value(mediator),
        online = Value(online),
        admin = Value(admin);
  static Insertable<UserDTO> custom({
    Expression<int>? id,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? businessName,
    Expression<String>? email,
    Expression<String>? profileImage,
    Expression<String>? bvn,
    Expression<String>? fcmToken,
    Expression<String>? account,
    Expression<String>? userStatistics,
    Expression<String>? transactionStatistics,
    Expression<bool>? mediator,
    Expression<bool>? online,
    Expression<bool>? admin,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (businessName != null) 'business_name': businessName,
      if (email != null) 'email': email,
      if (profileImage != null) 'profile_image': profileImage,
      if (bvn != null) 'bvn': bvn,
      if (fcmToken != null) 'fcm_token': fcmToken,
      if (account != null) 'account': account,
      if (userStatistics != null) 'user_statistics': userStatistics,
      if (transactionStatistics != null)
        'transaction_statistics': transactionStatistics,
      if (mediator != null) 'mediator': mediator,
      if (online != null) 'online': online,
      if (admin != null) 'admin': admin,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserDataCompanion copyWith(
      {Value<int>? id,
      Value<String>? firstName,
      Value<String>? lastName,
      Value<String?>? businessName,
      Value<String>? email,
      Value<String>? profileImage,
      Value<String>? bvn,
      Value<String>? fcmToken,
      Value<String?>? account,
      Value<String?>? userStatistics,
      Value<String?>? transactionStatistics,
      Value<bool>? mediator,
      Value<bool>? online,
      Value<bool>? admin,
      Value<int>? rowid}) {
    return UserDataCompanion(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      businessName: businessName ?? this.businessName,
      email: email ?? this.email,
      profileImage: profileImage ?? this.profileImage,
      bvn: bvn ?? this.bvn,
      fcmToken: fcmToken ?? this.fcmToken,
      account: account ?? this.account,
      userStatistics: userStatistics ?? this.userStatistics,
      transactionStatistics:
          transactionStatistics ?? this.transactionStatistics,
      mediator: mediator ?? this.mediator,
      online: online ?? this.online,
      admin: admin ?? this.admin,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (businessName.present) {
      map['business_name'] = Variable<String>(businessName.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (profileImage.present) {
      map['profile_image'] = Variable<String>(profileImage.value);
    }
    if (bvn.present) {
      map['bvn'] = Variable<String>(bvn.value);
    }
    if (fcmToken.present) {
      map['fcm_token'] = Variable<String>(fcmToken.value);
    }
    if (account.present) {
      map['account'] = Variable<String>(account.value);
    }
    if (userStatistics.present) {
      map['user_statistics'] = Variable<String>(userStatistics.value);
    }
    if (transactionStatistics.present) {
      map['transaction_statistics'] =
          Variable<String>(transactionStatistics.value);
    }
    if (mediator.present) {
      map['mediator'] = Variable<bool>(mediator.value);
    }
    if (online.present) {
      map['online'] = Variable<bool>(online.value);
    }
    if (admin.present) {
      map['admin'] = Variable<bool>(admin.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserDataCompanion(')
          ..write('id: $id, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('businessName: $businessName, ')
          ..write('email: $email, ')
          ..write('profileImage: $profileImage, ')
          ..write('bvn: $bvn, ')
          ..write('fcmToken: $fcmToken, ')
          ..write('account: $account, ')
          ..write('userStatistics: $userStatistics, ')
          ..write('transactionStatistics: $transactionStatistics, ')
          ..write('mediator: $mediator, ')
          ..write('online: $online, ')
          ..write('admin: $admin, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ObligationDataTable extends ObligationData
    with TableInfo<$ObligationDataTable, ObligationDTO> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ObligationDataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _transactionIdMeta =
      const VerificationMeta('transactionId');
  @override
  late final GeneratedColumn<int> transactionId = GeneratedColumn<int>(
      'transaction_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dueDateMeta =
      const VerificationMeta('dueDate');
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
      'due_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _detailsMeta =
      const VerificationMeta('details');
  @override
  late final GeneratedColumn<String> details = GeneratedColumn<String>(
      'details', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tokenMeta = const VerificationMeta('token');
  @override
  late final GeneratedColumn<String> token = GeneratedColumn<String>(
      'token', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _bindingMeta =
      const VerificationMeta('binding');
  @override
  late final GeneratedColumn<int> binding = GeneratedColumn<int>(
      'binding', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        transactionId,
        title,
        status,
        type,
        dueDate,
        amount,
        details,
        token,
        binding
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'obligation_data';
  @override
  VerificationContext validateIntegrity(Insertable<ObligationDTO> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('transaction_id')) {
      context.handle(
          _transactionIdMeta,
          transactionId.isAcceptableOrUnknown(
              data['transaction_id']!, _transactionIdMeta));
    } else if (isInserting) {
      context.missing(_transactionIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('due_date')) {
      context.handle(_dueDateMeta,
          dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta));
    } else if (isInserting) {
      context.missing(_dueDateMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('details')) {
      context.handle(_detailsMeta,
          details.isAcceptableOrUnknown(data['details']!, _detailsMeta));
    } else if (isInserting) {
      context.missing(_detailsMeta);
    }
    if (data.containsKey('token')) {
      context.handle(
          _tokenMeta, token.isAcceptableOrUnknown(data['token']!, _tokenMeta));
    } else if (isInserting) {
      context.missing(_tokenMeta);
    }
    if (data.containsKey('binding')) {
      context.handle(_bindingMeta,
          binding.isAcceptableOrUnknown(data['binding']!, _bindingMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ObligationDTO map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ObligationDTO(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      dueDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}due_date'])!,
      details: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}details'])!,
      token: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}token'])!,
      binding: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}binding']),
    );
  }

  @override
  $ObligationDataTable createAlias(String alias) {
    return $ObligationDataTable(attachedDatabase, alias);
  }
}

class ObligationDataCompanion extends UpdateCompanion<ObligationDTO> {
  final Value<int> id;
  final Value<int> transactionId;
  final Value<String> title;
  final Value<String> status;
  final Value<String> type;
  final Value<DateTime> dueDate;
  final Value<double> amount;
  final Value<String> details;
  final Value<String> token;
  final Value<int?> binding;
  final Value<int> rowid;
  const ObligationDataCompanion({
    this.id = const Value.absent(),
    this.transactionId = const Value.absent(),
    this.title = const Value.absent(),
    this.status = const Value.absent(),
    this.type = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.amount = const Value.absent(),
    this.details = const Value.absent(),
    this.token = const Value.absent(),
    this.binding = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ObligationDataCompanion.insert({
    required int id,
    required int transactionId,
    required String title,
    required String status,
    required String type,
    required DateTime dueDate,
    required double amount,
    required String details,
    required String token,
    this.binding = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        transactionId = Value(transactionId),
        title = Value(title),
        status = Value(status),
        type = Value(type),
        dueDate = Value(dueDate),
        amount = Value(amount),
        details = Value(details),
        token = Value(token);
  static Insertable<ObligationDTO> custom({
    Expression<int>? id,
    Expression<int>? transactionId,
    Expression<String>? title,
    Expression<String>? status,
    Expression<String>? type,
    Expression<DateTime>? dueDate,
    Expression<double>? amount,
    Expression<String>? details,
    Expression<String>? token,
    Expression<int>? binding,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (transactionId != null) 'transaction_id': transactionId,
      if (title != null) 'title': title,
      if (status != null) 'status': status,
      if (type != null) 'type': type,
      if (dueDate != null) 'due_date': dueDate,
      if (amount != null) 'amount': amount,
      if (details != null) 'details': details,
      if (token != null) 'token': token,
      if (binding != null) 'binding': binding,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ObligationDataCompanion copyWith(
      {Value<int>? id,
      Value<int>? transactionId,
      Value<String>? title,
      Value<String>? status,
      Value<String>? type,
      Value<DateTime>? dueDate,
      Value<double>? amount,
      Value<String>? details,
      Value<String>? token,
      Value<int?>? binding,
      Value<int>? rowid}) {
    return ObligationDataCompanion(
      id: id ?? this.id,
      transactionId: transactionId ?? this.transactionId,
      title: title ?? this.title,
      status: status ?? this.status,
      type: type ?? this.type,
      dueDate: dueDate ?? this.dueDate,
      amount: amount ?? this.amount,
      details: details ?? this.details,
      token: token ?? this.token,
      binding: binding ?? this.binding,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (transactionId.present) {
      map['transaction_id'] = Variable<int>(transactionId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (details.present) {
      map['details'] = Variable<String>(details.value);
    }
    if (token.present) {
      map['token'] = Variable<String>(token.value);
    }
    if (binding.present) {
      map['binding'] = Variable<int>(binding.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ObligationDataCompanion(')
          ..write('id: $id, ')
          ..write('transactionId: $transactionId, ')
          ..write('title: $title, ')
          ..write('status: $status, ')
          ..write('type: $type, ')
          ..write('dueDate: $dueDate, ')
          ..write('amount: $amount, ')
          ..write('details: $details, ')
          ..write('token: $token, ')
          ..write('binding: $binding, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TransactionDataTable transactionData =
      $TransactionDataTable(this);
  late final $UserDataTable userData = $UserDataTable(this);
  late final $ObligationDataTable obligationData = $ObligationDataTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [transactionData, userData, obligationData];
}

typedef $$TransactionDataTableCreateCompanionBuilder = TransactionDataCompanion
    Function({
  required int id,
  required int userId,
  required String title,
  required String type,
  required String status,
  required double total,
  required double percentageComplete,
  required DateTime dateCreated,
  required DateTime expiryDate,
  Value<String?> note,
  Value<String?> mediation,
  Value<String?> payee,
  Value<String?> members,
  Value<int> rowid,
});
typedef $$TransactionDataTableUpdateCompanionBuilder = TransactionDataCompanion
    Function({
  Value<int> id,
  Value<int> userId,
  Value<String> title,
  Value<String> type,
  Value<String> status,
  Value<double> total,
  Value<double> percentageComplete,
  Value<DateTime> dateCreated,
  Value<DateTime> expiryDate,
  Value<String?> note,
  Value<String?> mediation,
  Value<String?> payee,
  Value<String?> members,
  Value<int> rowid,
});

class $$TransactionDataTableFilterComposer
    extends Composer<_$AppDatabase, $TransactionDataTable> {
  $$TransactionDataTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get total => $composableBuilder(
      column: $table.total, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get percentageComplete => $composableBuilder(
      column: $table.percentageComplete,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get expiryDate => $composableBuilder(
      column: $table.expiryDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mediation => $composableBuilder(
      column: $table.mediation, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get payee => $composableBuilder(
      column: $table.payee, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get members => $composableBuilder(
      column: $table.members, builder: (column) => ColumnFilters(column));
}

class $$TransactionDataTableOrderingComposer
    extends Composer<_$AppDatabase, $TransactionDataTable> {
  $$TransactionDataTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get total => $composableBuilder(
      column: $table.total, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get percentageComplete => $composableBuilder(
      column: $table.percentageComplete,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get expiryDate => $composableBuilder(
      column: $table.expiryDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mediation => $composableBuilder(
      column: $table.mediation, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get payee => $composableBuilder(
      column: $table.payee, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get members => $composableBuilder(
      column: $table.members, builder: (column) => ColumnOrderings(column));
}

class $$TransactionDataTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransactionDataTable> {
  $$TransactionDataTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<double> get total =>
      $composableBuilder(column: $table.total, builder: (column) => column);

  GeneratedColumn<double> get percentageComplete => $composableBuilder(
      column: $table.percentageComplete, builder: (column) => column);

  GeneratedColumn<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => column);

  GeneratedColumn<DateTime> get expiryDate => $composableBuilder(
      column: $table.expiryDate, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<String> get mediation =>
      $composableBuilder(column: $table.mediation, builder: (column) => column);

  GeneratedColumn<String> get payee =>
      $composableBuilder(column: $table.payee, builder: (column) => column);

  GeneratedColumn<String> get members =>
      $composableBuilder(column: $table.members, builder: (column) => column);
}

class $$TransactionDataTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TransactionDataTable,
    TransactionDTO,
    $$TransactionDataTableFilterComposer,
    $$TransactionDataTableOrderingComposer,
    $$TransactionDataTableAnnotationComposer,
    $$TransactionDataTableCreateCompanionBuilder,
    $$TransactionDataTableUpdateCompanionBuilder,
    (
      TransactionDTO,
      BaseReferences<_$AppDatabase, $TransactionDataTable, TransactionDTO>
    ),
    TransactionDTO,
    PrefetchHooks Function()> {
  $$TransactionDataTableTableManager(
      _$AppDatabase db, $TransactionDataTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionDataTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransactionDataTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransactionDataTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> userId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<double> total = const Value.absent(),
            Value<double> percentageComplete = const Value.absent(),
            Value<DateTime> dateCreated = const Value.absent(),
            Value<DateTime> expiryDate = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<String?> mediation = const Value.absent(),
            Value<String?> payee = const Value.absent(),
            Value<String?> members = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TransactionDataCompanion(
            id: id,
            userId: userId,
            title: title,
            type: type,
            status: status,
            total: total,
            percentageComplete: percentageComplete,
            dateCreated: dateCreated,
            expiryDate: expiryDate,
            note: note,
            mediation: mediation,
            payee: payee,
            members: members,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int id,
            required int userId,
            required String title,
            required String type,
            required String status,
            required double total,
            required double percentageComplete,
            required DateTime dateCreated,
            required DateTime expiryDate,
            Value<String?> note = const Value.absent(),
            Value<String?> mediation = const Value.absent(),
            Value<String?> payee = const Value.absent(),
            Value<String?> members = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TransactionDataCompanion.insert(
            id: id,
            userId: userId,
            title: title,
            type: type,
            status: status,
            total: total,
            percentageComplete: percentageComplete,
            dateCreated: dateCreated,
            expiryDate: expiryDate,
            note: note,
            mediation: mediation,
            payee: payee,
            members: members,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TransactionDataTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TransactionDataTable,
    TransactionDTO,
    $$TransactionDataTableFilterComposer,
    $$TransactionDataTableOrderingComposer,
    $$TransactionDataTableAnnotationComposer,
    $$TransactionDataTableCreateCompanionBuilder,
    $$TransactionDataTableUpdateCompanionBuilder,
    (
      TransactionDTO,
      BaseReferences<_$AppDatabase, $TransactionDataTable, TransactionDTO>
    ),
    TransactionDTO,
    PrefetchHooks Function()>;
typedef $$UserDataTableCreateCompanionBuilder = UserDataCompanion Function({
  required int id,
  required String firstName,
  required String lastName,
  Value<String?> businessName,
  required String email,
  required String profileImage,
  required String bvn,
  required String fcmToken,
  Value<String?> account,
  Value<String?> userStatistics,
  Value<String?> transactionStatistics,
  required bool mediator,
  required bool online,
  required bool admin,
  Value<int> rowid,
});
typedef $$UserDataTableUpdateCompanionBuilder = UserDataCompanion Function({
  Value<int> id,
  Value<String> firstName,
  Value<String> lastName,
  Value<String?> businessName,
  Value<String> email,
  Value<String> profileImage,
  Value<String> bvn,
  Value<String> fcmToken,
  Value<String?> account,
  Value<String?> userStatistics,
  Value<String?> transactionStatistics,
  Value<bool> mediator,
  Value<bool> online,
  Value<bool> admin,
  Value<int> rowid,
});

class $$UserDataTableFilterComposer
    extends Composer<_$AppDatabase, $UserDataTable> {
  $$UserDataTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get businessName => $composableBuilder(
      column: $table.businessName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get profileImage => $composableBuilder(
      column: $table.profileImage, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bvn => $composableBuilder(
      column: $table.bvn, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fcmToken => $composableBuilder(
      column: $table.fcmToken, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get account => $composableBuilder(
      column: $table.account, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userStatistics => $composableBuilder(
      column: $table.userStatistics,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get transactionStatistics => $composableBuilder(
      column: $table.transactionStatistics,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get mediator => $composableBuilder(
      column: $table.mediator, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get online => $composableBuilder(
      column: $table.online, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get admin => $composableBuilder(
      column: $table.admin, builder: (column) => ColumnFilters(column));
}

class $$UserDataTableOrderingComposer
    extends Composer<_$AppDatabase, $UserDataTable> {
  $$UserDataTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get businessName => $composableBuilder(
      column: $table.businessName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get profileImage => $composableBuilder(
      column: $table.profileImage,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bvn => $composableBuilder(
      column: $table.bvn, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fcmToken => $composableBuilder(
      column: $table.fcmToken, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get account => $composableBuilder(
      column: $table.account, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userStatistics => $composableBuilder(
      column: $table.userStatistics,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get transactionStatistics => $composableBuilder(
      column: $table.transactionStatistics,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get mediator => $composableBuilder(
      column: $table.mediator, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get online => $composableBuilder(
      column: $table.online, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get admin => $composableBuilder(
      column: $table.admin, builder: (column) => ColumnOrderings(column));
}

class $$UserDataTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserDataTable> {
  $$UserDataTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get businessName => $composableBuilder(
      column: $table.businessName, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get profileImage => $composableBuilder(
      column: $table.profileImage, builder: (column) => column);

  GeneratedColumn<String> get bvn =>
      $composableBuilder(column: $table.bvn, builder: (column) => column);

  GeneratedColumn<String> get fcmToken =>
      $composableBuilder(column: $table.fcmToken, builder: (column) => column);

  GeneratedColumn<String> get account =>
      $composableBuilder(column: $table.account, builder: (column) => column);

  GeneratedColumn<String> get userStatistics => $composableBuilder(
      column: $table.userStatistics, builder: (column) => column);

  GeneratedColumn<String> get transactionStatistics => $composableBuilder(
      column: $table.transactionStatistics, builder: (column) => column);

  GeneratedColumn<bool> get mediator =>
      $composableBuilder(column: $table.mediator, builder: (column) => column);

  GeneratedColumn<bool> get online =>
      $composableBuilder(column: $table.online, builder: (column) => column);

  GeneratedColumn<bool> get admin =>
      $composableBuilder(column: $table.admin, builder: (column) => column);
}

class $$UserDataTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UserDataTable,
    UserDTO,
    $$UserDataTableFilterComposer,
    $$UserDataTableOrderingComposer,
    $$UserDataTableAnnotationComposer,
    $$UserDataTableCreateCompanionBuilder,
    $$UserDataTableUpdateCompanionBuilder,
    (UserDTO, BaseReferences<_$AppDatabase, $UserDataTable, UserDTO>),
    UserDTO,
    PrefetchHooks Function()> {
  $$UserDataTableTableManager(_$AppDatabase db, $UserDataTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserDataTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserDataTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserDataTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> firstName = const Value.absent(),
            Value<String> lastName = const Value.absent(),
            Value<String?> businessName = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String> profileImage = const Value.absent(),
            Value<String> bvn = const Value.absent(),
            Value<String> fcmToken = const Value.absent(),
            Value<String?> account = const Value.absent(),
            Value<String?> userStatistics = const Value.absent(),
            Value<String?> transactionStatistics = const Value.absent(),
            Value<bool> mediator = const Value.absent(),
            Value<bool> online = const Value.absent(),
            Value<bool> admin = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserDataCompanion(
            id: id,
            firstName: firstName,
            lastName: lastName,
            businessName: businessName,
            email: email,
            profileImage: profileImage,
            bvn: bvn,
            fcmToken: fcmToken,
            account: account,
            userStatistics: userStatistics,
            transactionStatistics: transactionStatistics,
            mediator: mediator,
            online: online,
            admin: admin,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int id,
            required String firstName,
            required String lastName,
            Value<String?> businessName = const Value.absent(),
            required String email,
            required String profileImage,
            required String bvn,
            required String fcmToken,
            Value<String?> account = const Value.absent(),
            Value<String?> userStatistics = const Value.absent(),
            Value<String?> transactionStatistics = const Value.absent(),
            required bool mediator,
            required bool online,
            required bool admin,
            Value<int> rowid = const Value.absent(),
          }) =>
              UserDataCompanion.insert(
            id: id,
            firstName: firstName,
            lastName: lastName,
            businessName: businessName,
            email: email,
            profileImage: profileImage,
            bvn: bvn,
            fcmToken: fcmToken,
            account: account,
            userStatistics: userStatistics,
            transactionStatistics: transactionStatistics,
            mediator: mediator,
            online: online,
            admin: admin,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UserDataTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UserDataTable,
    UserDTO,
    $$UserDataTableFilterComposer,
    $$UserDataTableOrderingComposer,
    $$UserDataTableAnnotationComposer,
    $$UserDataTableCreateCompanionBuilder,
    $$UserDataTableUpdateCompanionBuilder,
    (UserDTO, BaseReferences<_$AppDatabase, $UserDataTable, UserDTO>),
    UserDTO,
    PrefetchHooks Function()>;
typedef $$ObligationDataTableCreateCompanionBuilder = ObligationDataCompanion
    Function({
  required int id,
  required int transactionId,
  required String title,
  required String status,
  required String type,
  required DateTime dueDate,
  required double amount,
  required String details,
  required String token,
  Value<int?> binding,
  Value<int> rowid,
});
typedef $$ObligationDataTableUpdateCompanionBuilder = ObligationDataCompanion
    Function({
  Value<int> id,
  Value<int> transactionId,
  Value<String> title,
  Value<String> status,
  Value<String> type,
  Value<DateTime> dueDate,
  Value<double> amount,
  Value<String> details,
  Value<String> token,
  Value<int?> binding,
  Value<int> rowid,
});

class $$ObligationDataTableFilterComposer
    extends Composer<_$AppDatabase, $ObligationDataTable> {
  $$ObligationDataTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get transactionId => $composableBuilder(
      column: $table.transactionId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dueDate => $composableBuilder(
      column: $table.dueDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get details => $composableBuilder(
      column: $table.details, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get token => $composableBuilder(
      column: $table.token, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get binding => $composableBuilder(
      column: $table.binding, builder: (column) => ColumnFilters(column));
}

class $$ObligationDataTableOrderingComposer
    extends Composer<_$AppDatabase, $ObligationDataTable> {
  $$ObligationDataTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get transactionId => $composableBuilder(
      column: $table.transactionId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dueDate => $composableBuilder(
      column: $table.dueDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get details => $composableBuilder(
      column: $table.details, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get token => $composableBuilder(
      column: $table.token, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get binding => $composableBuilder(
      column: $table.binding, builder: (column) => ColumnOrderings(column));
}

class $$ObligationDataTableAnnotationComposer
    extends Composer<_$AppDatabase, $ObligationDataTable> {
  $$ObligationDataTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get transactionId => $composableBuilder(
      column: $table.transactionId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<DateTime> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get details =>
      $composableBuilder(column: $table.details, builder: (column) => column);

  GeneratedColumn<String> get token =>
      $composableBuilder(column: $table.token, builder: (column) => column);

  GeneratedColumn<int> get binding =>
      $composableBuilder(column: $table.binding, builder: (column) => column);
}

class $$ObligationDataTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ObligationDataTable,
    ObligationDTO,
    $$ObligationDataTableFilterComposer,
    $$ObligationDataTableOrderingComposer,
    $$ObligationDataTableAnnotationComposer,
    $$ObligationDataTableCreateCompanionBuilder,
    $$ObligationDataTableUpdateCompanionBuilder,
    (
      ObligationDTO,
      BaseReferences<_$AppDatabase, $ObligationDataTable, ObligationDTO>
    ),
    ObligationDTO,
    PrefetchHooks Function()> {
  $$ObligationDataTableTableManager(
      _$AppDatabase db, $ObligationDataTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ObligationDataTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ObligationDataTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ObligationDataTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> transactionId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<DateTime> dueDate = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<String> details = const Value.absent(),
            Value<String> token = const Value.absent(),
            Value<int?> binding = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ObligationDataCompanion(
            id: id,
            transactionId: transactionId,
            title: title,
            status: status,
            type: type,
            dueDate: dueDate,
            amount: amount,
            details: details,
            token: token,
            binding: binding,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int id,
            required int transactionId,
            required String title,
            required String status,
            required String type,
            required DateTime dueDate,
            required double amount,
            required String details,
            required String token,
            Value<int?> binding = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ObligationDataCompanion.insert(
            id: id,
            transactionId: transactionId,
            title: title,
            status: status,
            type: type,
            dueDate: dueDate,
            amount: amount,
            details: details,
            token: token,
            binding: binding,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ObligationDataTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ObligationDataTable,
    ObligationDTO,
    $$ObligationDataTableFilterComposer,
    $$ObligationDataTableOrderingComposer,
    $$ObligationDataTableAnnotationComposer,
    $$ObligationDataTableCreateCompanionBuilder,
    $$ObligationDataTableUpdateCompanionBuilder,
    (
      ObligationDTO,
      BaseReferences<_$AppDatabase, $ObligationDataTable, ObligationDTO>
    ),
    ObligationDTO,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TransactionDataTableTableManager get transactionData =>
      $$TransactionDataTableTableManager(_db, _db.transactionData);
  $$UserDataTableTableManager get userData =>
      $$UserDataTableTableManager(_db, _db.userData);
  $$ObligationDataTableTableManager get obligationData =>
      $$ObligationDataTableTableManager(_db, _db.obligationData);
}
