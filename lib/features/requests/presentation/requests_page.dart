import 'package:flutter/material.dart';
import '../../../shared/widgets/responsive_center.dart';
import 'pharmacy_responses_page.dart';
import 'widgets/requests_header.dart';
import 'widgets/upload_prescription_card.dart';
import 'widgets/request_form_fields.dart';
import 'widgets/broadcast_info_box.dart';
import 'widgets/send_broadcast_button.dart';

class RequestsPage extends StatefulWidget {
  const RequestsPage({Key? key}) : super(key: key);

  @override
  State<RequestsPage> createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  final _formKey = GlobalKey<FormState>();
  final _medicineController = TextEditingController();
  final _notesController = TextEditingController();

  @override
  void dispose() {
    _medicineController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const RequestsHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: ResponsiveCenter(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const UploadPrescriptionCard(),
                        const SizedBox(height: 24),
                        RequestFormFields(
                          medicineController: _medicineController,
                          notesController: _notesController,
                        ),
                        const SizedBox(height: 24),
                        const BroadcastInfoBox(),
                        const SizedBox(height: 32),
                        SendBroadcastButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (_) => const PharmacyResponsesPage()),
                            );
                          },
                        ),
                      ],
                    ),
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
