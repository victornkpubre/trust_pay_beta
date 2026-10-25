import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trust_pay_beta/components/buttons/primary_btn.dart';
import 'package:trust_pay_beta/components/buttons/quick_menu_btn.dart';
import 'package:trust_pay_beta/components/buttons/secondary_btn.dart';
import 'package:trust_pay_beta/components/buttons/transaction_card_single_btn.dart';
import 'package:trust_pay_beta/components/data_cards/account_card.dart';
import 'package:trust_pay_beta/components/data_cards/transaction_alert_card.dart';
import 'package:trust_pay_beta/components/data_cards/transaction_details_card.dart';
import 'package:trust_pay_beta/components/indicators/payee_payment_indicator.dart';
import 'package:trust_pay_beta/components/list_iems/obligation_list_item.dart';
import 'package:trust_pay_beta/components/tiles/notice_tile.dart';
import 'package:trust_pay_beta/components/tiles/user_profile_tile.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/presentation/base/app_carousel.dart';
import 'package:trust_pay_beta/main/presentation/base/app_horizontal_menu.dart';

/// Text far wider than a phone screen, so it has to wrap.
const longText = 'A very long piece of text that keeps going well past the width of any '
    'phone screen, so it has to wrap onto several lines to be read in full';
const width = 360.0;

/// Pumps [child] at phone width and returns any layout overflow errors.
/// (UserImage loads network images, which fail in tests; those are ignored.)
Future<List<String>> pumpAtPhoneWidth(WidgetTester tester, Widget child) async {
  final overflows = <String>[];
  final previous = FlutterError.onError;
  FlutterError.onError = (details) {
    final message = details.exceptionAsString();
    if (message.contains('overflowed')) overflows.add(message);
  };
  addTearDown(() => FlutterError.onError = previous);
  tester.view.physicalSize = const Size(width * 3, 2400);
  tester.view.devicePixelRatio = 3;
  addTearDown(tester.view.reset);

  await tester.pumpWidget(MaterialApp(
    home: Scaffold(body: SingleChildScrollView(child: child)),
  ));
  // The carousel measures its pages after a frame, then grows.
  await tester.pump();
  await tester.pump();
  FlutterError.onError = previous;
  return overflows;
}

/// Every Text showing [text] is laid out in full: no ellipsis, no line cap.
void expectShownInFull(WidgetTester tester, String text) {
  final finder = find.textContaining(text);
  expect(finder, findsWidgets);
  for (final element in finder.evaluate()) {
    final paragraph = element.renderObject as RenderParagraph;
    expect(paragraph.didExceedMaxLines, isFalse, reason: 'cut short: $text');
    // More than one line, i.e. it wrapped rather than ran off the edge.
    expect(paragraph.size.height, greaterThan(paragraph.text.style!.fontSize! * 1.5),
        reason: 'did not wrap: $text');
  }
}

Transaction transaction({String title = longText}) => Transaction(
      id: 1,
      userId: 1,
      title: title,
      type: TransactionType.secureSales,
      total: 100,
      dateCreated: DateTime(2026, 10, 25),
      expiryDate: DateTime(2026, 12, 31),
      percentageComplete: 0,
      status: TransactionStatus.verification,
      obligations: const [],
      members: const [],
    );

const user = User(
  id: 2,
  firstName: 'Victor',
  lastName: 'Nkpubre',
  profileImage: '',
  email: 'test@example.com',
  fcmToken: '',
  bvn: '',
);

void main() {
  testWidgets('home carousel grows to fit a long title and name', (tester) async {
    final overflows = await pumpAtPhoneWidth(tester, AppCarousel(
      width: width,
      height: width * 0.45,
      color: Colors.transparent,
      viewportFraction: 1,
      autoplay: false,
      onPageChange: (_) {},
      children: [
        TransactionAlertCard(
          username: longText,
          userImage: '',
          transaction: transaction(),
          currentUser: user,
          width: width,
          height: width * 0.45,
          onAccept: (_) {},
          onDecline: (_) {},
          onFulfilObligation: (_) {},
          onVerifyObligation: (_) {},
          onVerifyMediation: (_) {},
          onMakePayment: (_) {},
          onView: (_) {},
        ),
      ],
    ));

    expect(overflows, isEmpty);
    expectShownInFull(tester, longText);
    final card = tester.getSize(find.byType(TransactionAlertCard));
    expect(card.height, greaterThan(width * 0.45), reason: 'card did not grow');
    expect(tester.getSize(find.byType(CarouselSlider)).height, greaterThanOrEqualTo(card.height),
        reason: 'carousel cuts off the card');
  });

  testWidgets('account card grows to fit a long balance', (tester) async {
    final overflows = await pumpAtPhoneWidth(tester, SizedBox(
      width: width,
      child: AccountCard(
        balance: '1234567890123456789012345678901234567890',
        width: width,
        height: width * 0.45,
        solid: true,
        onAccountBtnClicked: () {},
        onDeposit: () {},
        onWithdraw: () {},
      ),
    ));
    await tester.tap(find.byIcon(Icons.visibility)); // show the balance
    await tester.pump();

    expect(overflows, isEmpty);
    expect(tester.takeException(), isNull);
    expectShownInFull(tester, '1234567890123456789012345678901234567890');
  });

  testWidgets('buttons, cards and tiles wrap long text', (tester) async {
    final overflows = await pumpAtPhoneWidth(tester, SizedBox(
      width: width,
      child: Column(children: [
        PrimaryButton(title: longText, onTap: () {}),
        SecondaryButton(title: longText, onTap: () {}),
        TransactionCardSingleButton(width: width, title: longText, onTap: () {}),
        TransactionDetailsCard(
          title: longText,
          type: TransactionType.secureSales,
          status: TransactionStatus.verification,
          amount: '₦100.00',
          date: DateTime(2026, 12, 31),
          members: const [],
          width: width,
        ),
        NoticeTile(width: width, richText: const Text(longText)),
        PayeePaymentIndicator(paymentFulfilled: 1, paymentsTotal: 2, width: width, payee: longText),
        ObligationListItem(title: longText, amount: 100, dateTime: DateTime(2026, 12, 31)),
        const Row(children: [
          Expanded(child: UserProfileTile(username: longText, image: '', size: 48, expanded: false)),
        ]),
      ]),
    ));

    expect(overflows, isEmpty);
    expectShownInFull(tester, longText);
  });

  testWidgets('quick menu titles wrap instead of being cut off', (tester) async {
    // At this size "Secure Sales" needs two lines.
    const size = 70.0;
    final overflows = await pumpAtPhoneWidth(tester, AppHorizontalMenu(
      itemSize: size,
      items: [
        for (final type in [TransactionType.secureSales, TransactionType.billSplitter])
          QuickMenuButton(type: type, size: size, color: Colors.white, onTap: () {}),
      ],
    ));

    expect(overflows, isEmpty);
    expectShownInFull(tester, 'Secure Sales');
    expect(tester.getSize(find.byType(QuickMenuButton).first).height, greaterThanOrEqualTo(size));
  });
}
