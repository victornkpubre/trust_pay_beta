import 'package:dio/dio.dart';
import 'package:trust_pay_beta/main/app/constants.dart';
import 'package:trust_pay_beta/main/data/data_source/local_database/preferences.dart';

/// Plain Dio calls to trust_pay_api's bill catalogue (Interswitch, Nigeria) —
/// the categories, billers and payment options a bill split is chosen from.
/// Same pattern as ChatService, so no Retrofit codegen is needed.
class BillService {
  final AppPreferences appPreferences;
  final Dio _dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
  ));

  BillService(this.appPreferences);

  Future<Options> _options() async {
    final token = await appPreferences.getAccessToken();
    return Options(headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    });
  }

  Future<dynamic> _get(String path, {Map<String, dynamic>? query}) async {
    try {
      final response = await _dio.get('${AppConstants.baseUrl}/api/$path',
          queryParameters: query, options: await _options());
      return response.data['data'];
    } on DioException catch (e) {
      throw BillServiceException.from(e);
    }
  }

  Future<List<BillCategory>> categories() async {
    final data = await _get('bills/categories') as List<dynamic>;
    return data.map((c) => BillCategory.fromJson(c as Map<String, dynamic>)).toList();
  }

  Future<List<Biller>> billers(String categoryId) async {
    final data = await _get('bills/categories/$categoryId/billers') as List<dynamic>;
    return data.map((b) => Biller.fromJson(b as Map<String, dynamic>)).toList();
  }

  Future<List<BillPaymentItem>> paymentItems(String billerId) async {
    final data = await _get('bills/billers/$billerId/items') as List<dynamic>;
    return data.map((i) => BillPaymentItem.fromJson(i as Map<String, dynamic>)).toList();
  }

  /// Asks the biller whether [customerId] (meter, smartcard, account
  /// number...) is real, and whose it is.
  Future<BillCustomerCheck> validateCustomer({
    required String paymentCode,
    required String customerId,
    double? amount,
  }) async {
    try {
      final response = await _dio.post(
        '${AppConstants.baseUrl}/api/bills/validate',
        data: {
          'payment_code': paymentCode,
          'customer_id': customerId,
          if (amount != null) 'amount': amount,
        },
        options: await _options(),
      );
      return BillCustomerCheck.fromJson(response.data['data'] as Map<String, dynamic>);
    } on DioException catch (e) {
      throw BillServiceException.from(e);
    }
  }
}

class BillServiceException implements Exception {
  final String message;
  BillServiceException(this.message);

  factory BillServiceException.from(DioException e) {
    final data = e.response?.data;
    final message = data is Map && data['message'] is String
        ? data['message'] as String
        : 'Could not reach the bill payment service. Check your connection and try again.';
    return BillServiceException(message);
  }

  @override
  String toString() => message;
}

class BillCategory {
  final String id;
  final String name;
  final String? description;

  BillCategory({required this.id, required this.name, this.description});

  factory BillCategory.fromJson(Map<String, dynamic> json) => BillCategory(
        id: '${json['id']}',
        name: json['name'] as String? ?? '',
        description: json['description'] as String?,
      );
}

class Biller {
  final String id;
  final String name;
  final String? shortName;
  final String categoryId;
  /// What the biller calls its customer number, e.g. "Meter Number".
  final String customerFieldLabel;

  Biller({required this.id, required this.name, this.shortName, required this.categoryId, required this.customerFieldLabel});

  factory Biller.fromJson(Map<String, dynamic> json) => Biller(
        id: '${json['id']}',
        name: json['name'] as String? ?? '',
        shortName: json['short_name'] as String?,
        categoryId: '${json['category_id']}',
        customerFieldLabel: json['customer_field_1'] as String? ?? 'Customer ID',
      );
}

class BillPaymentItem {
  final String paymentCode;
  final String name;
  final bool isAmountFixed;
  /// Naira; set when [isAmountFixed].
  final double? amount;
  final double itemFee;

  BillPaymentItem({required this.paymentCode, required this.name, required this.isAmountFixed, this.amount, this.itemFee = 0});

  factory BillPaymentItem.fromJson(Map<String, dynamic> json) => BillPaymentItem(
        paymentCode: '${json['payment_code']}',
        name: json['name'] as String? ?? '',
        isAmountFixed: json['is_amount_fixed'] == true,
        amount: (json['amount'] as num?)?.toDouble(),
        itemFee: (json['item_fee'] as num?)?.toDouble() ?? 0,
      );
}

class BillCustomerCheck {
  final bool valid;
  /// The biller is down — the number may well be fine.
  final bool billerUnavailable;
  final String? customerName;
  /// Postpaid billers return the amount owed (naira).
  final double? amount;
  final String? message;

  BillCustomerCheck({required this.valid, this.billerUnavailable = false, this.customerName, this.amount, this.message});

  factory BillCustomerCheck.fromJson(Map<String, dynamic> json) => BillCustomerCheck(
        valid: json['valid'] == true,
        billerUnavailable: json['biller_unavailable'] == true,
        customerName: json['customer_name'] as String?,
        amount: (json['amount'] as num?)?.toDouble(),
        message: json['message'] as String?,
      );
}
