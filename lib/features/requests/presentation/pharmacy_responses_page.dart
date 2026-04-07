import 'package:flutter/material.dart';
import '../../../shared/widgets/responsive_center.dart';
import 'widgets/pharmacy_responses_header.dart';
import 'widgets/request_summary_card.dart';
import 'widgets/responses_list.dart';

class PharmacyResponsesPage extends StatelessWidget {
  const PharmacyResponsesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const PharmacyResponsesHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: ResponsiveCenter(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: Column(
                    children: const [
                      RequestSummaryCard(),
                      ResponsesList(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
