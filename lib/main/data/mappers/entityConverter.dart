
import 'package:trust_pay_beta/main/data/mappers/extensions.dart';

import '../../domain/entities/base/entities.dart';

class EntityConverter {
  static TransactionType transactionTypeFromString(String? type) {
    TransactionType result = TransactionType.secureSales;
    if(type != null){
      result = TransactionType.values.firstWhere((t) {
        String altStringValueOfEnum = '';
        if(type.contains('_')){
          altStringValueOfEnum = type.split('_')[0]+type.split('_')[1].capitalize();
        }
        return t.name.compareTo(type) == 0 || t.name.compareTo(altStringValueOfEnum) == 0;
      });
    }

    return result;
  }

  static TransactionStatus transactionStatusFromString(String? status) {
    TransactionStatus result = TransactionStatus.pending;
    if(status != null){
      result = TransactionStatus.values.firstWhere((t) {
        String altStringValueOfEnum = '';
        if(status.contains('_')){
          altStringValueOfEnum = status.split('_')[0]+status.split('_')[1].capitalize();
        }
        return t.name.compareTo(status) == 0 || t.name.compareTo(altStringValueOfEnum) == 0;
      });
    }

    return result;
  }

  static ObligationType obligationTypeFromString(String? type) {
    ObligationType result = ObligationType.payment;
    if(type != null){
      result = ObligationType.values.firstWhere((t) {
        String altStringValueOfEnum = '';
        if(type.contains('_')) {
          altStringValueOfEnum = type.split('_')[0]+type.split('_')[1].capitalize();
        }
        return t.name.compareTo(type) == 0 || t.name.compareTo(altStringValueOfEnum) == 0;
      });
    }

    return result;
  }

  static ObligationStatus obligationStatusFromString(String? status) {
    ObligationStatus result = ObligationStatus.pending;
    if(status != null){
      result = ObligationStatus.values.firstWhere((t) {
        String altStringValueOfEnum = '';
        if(status.contains('_')){
          altStringValueOfEnum = status.split('_')[0]+status.split('_')[1].capitalize();
        }
        return t.name.compareTo(status) == 0 || t.name.compareTo(altStringValueOfEnum) == 0;
      });
    }

    return result;
  }

  static NotificationState notificationStateFromString(String? type) {
    NotificationState result = NotificationState.sent;
    if(type != null){
      result = NotificationState.values.firstWhere((t) {
        String altStringValueOfEnum = '';
        if(type.contains('_')){
          altStringValueOfEnum = type.split('_')[0]+type.split('_')[1].capitalize();
        }
        return t.name.compareTo(type) == 0 || t.name.compareTo(altStringValueOfEnum) == 0;
      });
    }

    return result;
  }
}