import 'package:flutter/material.dart';
import '../../../shared/widgets/responsive_center.dart';
//import '../../../main.dart'; // To access the navigation key or method if needed
import 'widgets/home_header.dart';
import 'widgets/emergency_request_card.dart';
import 'widgets/quick_actions.dart';
import 'widgets/pharmacies_list.dart';

class HomePage extends StatelessWidget {
  final Function(int)? onNavigate;

  const HomePage({Key? key, this.onNavigate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const HomeHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: ResponsiveCenter(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      EmergencyRequestCard(onNavigate: onNavigate),
                      const QuickActionsRow(),
                      const PharmaciesSection(),
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
