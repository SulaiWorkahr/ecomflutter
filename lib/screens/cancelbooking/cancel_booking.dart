import 'package:e_commerce/widgets/custom_text_field.dart';
import 'package:e_commerce/widgets/heading_widget.dart';
import 'package:e_commerce/widgets/sub_heading_widget.dart';
import 'package:flutter/material.dart';

class CancelBooking extends StatefulWidget {
  @override
  _CancelBookingState createState() => _CancelBookingState();
}

class _CancelBookingState extends State<CancelBooking> {
  String? selectedReason;
  final TextEditingController _descriptionController = TextEditingController();

  final List<String> reasons = [
    'Schedule change',
    'Weather condition',
    'My regular servicer’s is not available',
    'Parking availability',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: HeadingWidget(
          title: 'Cancel Purchasing',
          color: Colors.black,
          fontSize: 20,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubHeadingWidget(
              title: 'Please Select the Reason of Cancellation',
              color: Colors.grey,
              fontSize: 16,
            ),
            SizedBox(height: 16),
            Column(
              children: reasons.map((reason) {
                return RadioListTile<String>(
                  value: reason,
                  groupValue: selectedReason,
                  onChanged: (value) {
                    setState(() {
                      selectedReason = value;
                    });
                  },
                  title: Text(reason),
                  activeColor: Color(0xFF009444),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            CustomeTextField(
              control: _descriptionController,
              lines: 4,
              hint: 'Description',
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF009444),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: HeadingWidget(
                    title: 'Cancel Booking', fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
