import 'package:flutter/material.dart';

class OrderPreview extends StatefulWidget {
  @override
  _OrderPreviewState createState() => _OrderPreviewState();
}

class _OrderPreviewState extends State<OrderPreview> {
  int quantity = 3;
  double itemPrice = 15.50;
  double deliveryFee = 44.0;
  double platformFee = 5.0;
  double gstFee = 2.0;
  double discount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Preview"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDeliveryTypeSelection(),
              SizedBox(height: 20),
              _buildItemCard(),
              SizedBox(height: 16),
              _buildOfferSection(),
              SizedBox(height: 16),
              _buildDeliveryOptions(),
              SizedBox(height: 16),
              _buildBillDetails(),
              SizedBox(height: 16),
              _buildPaymentMethods(),
              SizedBox(height: 16),
              _buildTotalAndCheckoutButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeliveryTypeSelection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Standard Delivery",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        Text(
          "Lorem ipsum dolor sit am...",
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildItemCard() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Sweet Young Coconut",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text("Fruits", style: TextStyle(color: Colors.grey)),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                "AED 20.0",
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey,
                ),
              ),
              SizedBox(width: 8),
              Text(
                "AED $itemPrice",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
              _buildQuantitySelector(),
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add, color: Colors.grey),
              label:
                  Text("Add more items", style: TextStyle(color: Colors.grey)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantitySelector() {
    return Row(
      children: [
        _buildQuantityButton(Icons.remove, () {
          if (quantity > 1) setState(() => quantity--);
        }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(quantity.toString(), style: TextStyle(fontSize: 16)),
        ),
        _buildQuantityButton(Icons.add, () {
          setState(() => quantity++);
        }),
      ],
    );
  }

  Widget _buildQuantityButton(IconData icon, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(icon, size: 20, color: Colors.black),
      ),
    );
  }

  Widget _buildOfferSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Try New Coupon",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text("Save another ₹ 44 on this Order",
              style: TextStyle(color: Colors.red)),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text("Apply", style: TextStyle(color: Colors.red)),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text("View more Coupons"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Delivery Type", style: TextStyle(fontWeight: FontWeight.w500)),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildDeliveryOption("Standard\n30-35 Mins", 44.0, true),
            _buildDeliveryOption("Standard\n40-45 Mins", 60.0, false),
          ],
        ),
      ],
    );
  }

  Widget _buildDeliveryOption(String title, double fee, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          deliveryFee = fee;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: isSelected ? Colors.green : Colors.grey.shade300),
          color: isSelected ? Colors.green.shade50 : Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 14)),
            SizedBox(height: 4),
            Text("AED $fee Delivery Charges",
                style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildBillDetails() {
    double total =
        (itemPrice * quantity) + deliveryFee + platformFee + gstFee - discount;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Bill Details", style: TextStyle(fontWeight: FontWeight.bold)),
        Divider(),
        _buildBillDetailRow("Item total", itemPrice * quantity),
        _buildBillDetailRow("Delivery Fee", deliveryFee),
        _buildBillDetailRow("Platform fee", platformFee),
        _buildBillDetailRow("GST and Restaurant Charges", gstFee),
        Divider(),
        _buildBillDetailRow("To Pay", total, bold: true),
      ],
    );
  }

  Widget _buildBillDetailRow(String label, double value, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  fontWeight: bold ? FontWeight.bold : FontWeight.normal)),
          Text("AED ${value.toStringAsFixed(2)}",
              style: TextStyle(
                  fontWeight: bold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }

  Widget _buildPaymentMethods() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Select your payment Method",
            style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        _buildPaymentMethod("Gpay"),
        _buildPaymentMethod("Phone pay"),
        _buildPaymentMethod("Pay with UPI"),
        _buildPaymentMethod("Debit/Credit Card"),
      ],
    );
  }

  Widget _buildPaymentMethod(String method) {
    return ListTile(
      title: Text(method),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }

  Widget _buildTotalAndCheckoutButton() {
    double totalAmount =
        (itemPrice * quantity) + deliveryFee + platformFee + gstFee - discount;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("1 item | $quantity Qty"),
            Text("Total: AED ${totalAmount.toStringAsFixed(2)}",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(height: 12),
        ElevatedButton(
          onPressed: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 80, vertical: 12),
            child: Text("Pay now", style: TextStyle(fontSize: 16)),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
