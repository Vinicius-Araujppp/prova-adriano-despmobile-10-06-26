import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:contatos_app/main.dart';

void main() {
  testWidgets('exibe dashboard com opcoes de persistencia', (tester) async {
    await tester.pumpWidget(const ContatosApp());

    expect(find.text('Dashboard'), findsOneWidget);
    expect(find.text('Escolha onde persistir os contatos'), findsOneWidget);
    expect(find.text('SQLite local'), findsOneWidget);
    expect(find.text('API Render'), findsOneWidget);
    expect(find.byIcon(Icons.storage), findsOneWidget);
    expect(find.byIcon(Icons.cloud_sync), findsOneWidget);
  });
}
