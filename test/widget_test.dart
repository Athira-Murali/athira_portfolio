import 'package:athira_portfolio/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('portfolio renders primary content', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1440, 1000));
    await tester.pumpWidget(const PortfolioApp());
    await tester.pumpAndSettle();

    expect(find.text('ATHIRA / SM'), findsOneWidget);
    expect(find.text('Cortado Café'), findsOneWidget);
    expect(find.text('NAD Rewards'), findsOneWidget);
    expect(find.text('Cortado Kiosk'), findsOneWidget);
    expect(find.text('Trings'), findsOneWidget);
    expect(find.text('D-Global'), findsOneWidget);
  });

  testWidgets('portfolio has no mobile layout overflow', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(const PortfolioApp());
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
  });
}
