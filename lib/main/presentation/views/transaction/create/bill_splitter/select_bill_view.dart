import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/buttons/primary_btn.dart';
import 'package:trust_pay_beta/components/inputs/app_search_input.dart';
import 'package:trust_pay_beta/components/inputs/app_text_input.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/main/data/services/bill_service.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/presentation/base/progress_indicator.dart';
import 'package:trust_pay_beta/main/presentation/base/toast.dart';

/// The bill a bill split pays, and how much (naira).
class SelectedBill {
  final TransactionBill bill;
  final double amount;
  SelectedBill(this.bill, this.amount);
}

enum _Step { category, biller, item, customer }

/// Picks the Nigerian bill a bill split pays: category → biller → payment
/// option → customer number, which the biller confirms before it can be
/// used. Pops a [SelectedBill].
class SelectBillView extends StatefulWidget {
  /// The bill amount already typed in, used when the price isn't fixed.
  final double? initialAmount;
  const SelectBillView({super.key, this.initialAmount});

  @override
  State<SelectBillView> createState() => _SelectBillViewState();
}

class _SelectBillViewState extends State<SelectBillView> {
  final searchController = TextEditingController();
  final customerController = TextEditingController();
  final mobileController = TextEditingController();
  final amountController = TextEditingController();

  _Step step = _Step.category;
  bool loading = false;
  String? error;

  List<BillCategory> categories = [];
  List<Biller> billers = [];
  List<BillPaymentItem> items = [];
  BillCategory? category;
  Biller? biller;
  BillPaymentItem? item;
  BillCustomerCheck? check;

  BillService get _service => context.read<BillService>();

  @override
  void initState() {
    super.initState();
    if (widget.initialAmount != null && widget.initialAmount! > 0) {
      amountController.text = widget.initialAmount!.toStringAsFixed(2);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) => _load(() async {
          categories = await _service.categories();
        }));
  }

  Future<void> _load(Future<void> Function() fetch) async {
    setState(() {
      loading = true;
      error = null;
    });
    try {
      await fetch();
    } catch (e) {
      error = e.toString();
    }
    if (mounted) setState(() => loading = false);
  }

  void _selectCategory(BillCategory c) {
    category = c;
    searchController.clear();
    step = _Step.biller;
    _load(() async {
      billers = await _service.billers(c.id);
    });
  }

  void _selectBiller(Biller b) {
    biller = b;
    _load(() async {
      items = await _service.paymentItems(b.id);
      if (items.length == 1) {
        _selectItem(items.first);
      } else {
        step = _Step.item;
      }
    });
  }

  void _selectItem(BillPaymentItem i) {
    item = i;
    check = null;
    if (i.isAmountFixed && i.amount != null) {
      amountController.text = i.amount!.toStringAsFixed(2);
    }
    setState(() => step = _Step.customer);
  }

  double? get _amount => double.tryParse(amountController.text.replaceAll(',', ''));

  Future<void> _verify() async {
    if (customerController.text.trim().isEmpty) {
      showSnackBar(context: context, message: 'Enter the ${biller!.customerFieldLabel}');
      return;
    }
    await _load(() async {
      check = await _service.validateCustomer(
        paymentCode: item!.paymentCode,
        customerId: customerController.text.trim(),
        amount: _amount,
      );
      // Postpaid billers say how much is owed.
      if (check!.valid && !item!.isAmountFixed && check!.amount != null && check!.amount! > 0 && (_amount ?? 0) <= 0) {
        amountController.text = check!.amount!.toStringAsFixed(2);
      }
    });
  }

  void _confirm() {
    final amount = _amount ?? 0;
    if (amount <= 0) {
      showSnackBar(context: context, message: 'Enter the bill amount');
      return;
    }
    Navigator.pop(
      context,
      SelectedBill(
        TransactionBill(
          categoryId: category?.id,
          categoryName: category?.name,
          billerId: biller!.id,
          billerName: biller!.name,
          paymentCode: item!.paymentCode,
          paymentItemName: item!.name,
          customerId: customerController.text.trim(),
          customerFieldLabel: biller!.customerFieldLabel,
          customerName: check?.customerName,
          customerMobile: mobileController.text.trim().isEmpty ? null : mobileController.text.trim(),
        ),
        amount,
      ),
    );
  }

  void _back() {
    setState(() {
      error = null;
      switch (step) {
        case _Step.customer:
          step = items.length > 1 ? _Step.item : _Step.biller;
          check = null;
          break;
        case _Step.item:
          step = _Step.biller;
          break;
        case _Step.biller:
          step = _Step.category;
          searchController.clear();
          break;
        case _Step.category:
          Navigator.pop(context);
      }
    });
  }

  String get _title {
    switch (step) {
      case _Step.category:
        return 'What bill is it?';
      case _Step.biller:
        return category?.name ?? 'Choose the biller';
      case _Step.item:
        return biller?.name ?? 'Choose an option';
      case _Step.customer:
        return biller?.name ?? 'Bill details';
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: step == _Step.category,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _back();
      },
      child: Scaffold(
        backgroundColor: AppColor.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).viewPadding.top + AppSize.s16),
              Row(children: [
                IconButton(onPressed: _back, icon: const Icon(Icons.arrow_back_ios, size: AppSize.s16)),
                Expanded(child: Text(_title, style: appTextBlack18Bold, overflow: TextOverflow.ellipsis)),
              ]),
              const SizedBox(height: AppSize.s8),
              Expanded(child: _body()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _body() {
    if (loading && step != _Step.customer) {
      return const Center(child: AppCircleProgressIndicator());
    }
    if (error != null && step != _Step.customer) {
      return Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(error!, style: appTextGray16, textAlign: TextAlign.center),
          const SizedBox(height: AppSize.s16),
          TextButton(
            onPressed: () {
              if (step == _Step.category) {
                _load(() async => categories = await _service.categories());
              } else if (step == _Step.biller && category != null) {
                _selectCategory(category!);
              } else if (biller != null) {
                _selectBiller(biller!);
              }
            },
            child: const Text('Try again'),
          ),
        ]),
      );
    }

    switch (step) {
      case _Step.category:
        return _list(categories.map((c) => _Row(title: c.name, subtitle: c.description, onTap: () => _selectCategory(c))).toList());
      case _Step.biller:
        final query = searchController.text.toLowerCase();
        final shown = billers.where((b) => query.isEmpty || b.name.toLowerCase().contains(query)).toList();
        return Column(children: [
          AppSearchInput(
            hint: 'Search billers...',
            controller: searchController,
            onChange: (_) => setState(() {}),
          ),
          const SizedBox(height: AppSize.s8),
          Expanded(
            child: shown.isEmpty
                ? Center(child: Text('No billers found', style: appTextGray16))
                : _list(shown.map((b) => _Row(title: b.name, onTap: () => _selectBiller(b))).toList()),
          ),
        ]);
      case _Step.item:
        return _list(items
            .map((i) => _Row(
                  title: i.name,
                  subtitle: i.isAmountFixed && i.amount != null ? '₦${i.amount!.toStringAsFixed(2)}' : 'You choose the amount',
                  onTap: () => _selectItem(i),
                ))
            .toList());
      case _Step.customer:
        return _customerForm();
    }
  }

  Widget _list(List<Widget> rows) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: rows.length,
      separatorBuilder: (_, __) => Divider(thickness: 1, color: AppColor.lightGray, height: 0),
      itemBuilder: (_, i) => rows[i],
    );
  }

  Widget _customerForm() {
    final verified = check?.valid == true;
    final fixed = item!.isAmountFixed && item!.amount != null;

    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(item!.name, style: appTextGray16),
        const SizedBox(height: AppSize.s16),
        AppTextInput(
          title: biller!.customerFieldLabel,
          type: TextInputType.text,
          hint: biller!.customerFieldLabel,
          withNairaSign: false,
          controller: customerController,
        ),
        const SizedBox(height: AppSize.s16),
        AppTextInput(
          title: 'Bill Amount',
          type: TextInputType.number,
          hint: '0',
          currencySymbol: '₦',
          controller: amountController,
        ),
        if (fixed) ...[
          const SizedBox(height: AppSize.s4),
          Text('This option has a fixed price.', style: appTextGray12),
        ],
        const SizedBox(height: AppSize.s16),
        // Airtime, data, Showmax and exam PINs already take a phone number.
        if (!biller!.customerFieldLabel.toLowerCase().contains('phone')) ...[
          AppTextInput(
            title: 'Phone number (optional)',
            type: TextInputType.phone,
            hint: 'For the receipt or token SMS',
            withNairaSign: false,
            controller: mobileController,
          ),
          const SizedBox(height: AppSize.s16),
        ],
        if (check != null)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSize.s10),
            decoration: BoxDecoration(
              color: verified ? AppColor.green.withValues(alpha: 0.1) : AppColor.red.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppSize.s8),
            ),
            child: Text(
              verified
                  ? 'Confirmed: ${check!.customerName ?? 'customer found'}'
                  : check!.billerUnavailable
                      ? "${biller!.name} isn't responding right now. Please try again later."
                      : (check!.message ?? "The biller didn't recognise that ${biller!.customerFieldLabel}."),
              style: appTextGray16,
            ),
          ),
        if (error != null)
          Padding(
            padding: const EdgeInsets.only(top: AppSize.s8),
            child: Text(error!, style: TextStyle(color: AppColor.red)),
          ),
        const SizedBox(height: AppSize.s24),
        loading
            ? const Center(child: AppCircleProgressIndicator())
            : PrimaryButton(
                width: double.infinity,
                title: verified ? 'Use this bill' : 'Check ${biller!.customerFieldLabel}',
                onTap: verified ? _confirm : _verify,
              ),
        const SizedBox(height: AppSize.s32),
      ]),
    );
  }
}

class _Row extends StatelessWidget {
  final String title;
  final String? subtitle;
  final VoidCallback onTap;
  const _Row({required this.title, this.subtitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSize.s16),
        child: Row(children: [
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title, style: appTextBlack16Bold),
              if (subtitle != null && subtitle!.isNotEmpty) Text(subtitle!, style: appTextGray14),
            ]),
          ),
          const Icon(Icons.arrow_forward_ios, size: AppSize.s16),
        ]),
      ),
    );
  }
}
