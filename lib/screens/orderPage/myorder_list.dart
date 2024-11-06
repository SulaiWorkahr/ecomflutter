import 'package:e_commerce/widgets/heading_widget.dart';
import 'package:e_commerce/widgets/sub_heading_widget.dart';
import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';

import '../../constants/app_assets.dart';

class OrderListScreen extends StatefulWidget {
  @override
  _OrderListScreenState createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _expandedIndex = -1;
  int all_expandedIndex = -1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final List<Map<String, dynamic>> orders = [
    {'id': '0012345', 'items': 12, 'status': 'On Delivery'},
    {'id': '0012345', 'items': 12, 'status': 'Completed'},
    {'id': '0012345', 'items': 12, 'status': 'Cancelled'},
    {'id': '0012345', 'items': 12, 'status': 'Completed'},
  ];

  Widget getStatusIcon(String status) {
    switch (status) {
      case 'On Delivery':
        return Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.orange.shade100,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Image.asset(
            AppAssets.shoopingbag,
            color: getStatusColor(status),
          ),
        );

      case 'Completed':
        return Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.green,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Image.asset(
            AppAssets.shoopingbag,
            color: getStatusColor(status),
          ),
        );
      case 'Cancelled':
        return Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Image.asset(
            AppAssets.shoopingbag,
            color: getStatusColor(status),
          ),
        );
      default:
        return Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.green,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Image.asset(
            AppAssets.shoopingbag,
            color: getStatusColor(status),
          ),
        );
    }
  }

  Color getStatusColor(String status) {
    switch (status) {
      case 'On Delivery':
        return Colors.yellow.shade900;
      case 'Completed':
        return Colors.white;
      case 'Cancelled':
        return Colors.white;
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back, color: Colors.black),
        title: Text(
          'My Order',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: TabBar(
            controller: _tabController,
            indicatorColor: Colors.green,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            dividerColor: Colors.transparent,
            tabs: [
              Tab(text: 'All'),
              Tab(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.circle,
                      size: 8,
                      color: Colors.orange[400],
                    ),
                    SizedBox(width: 4),
                    Text('On Delivery'),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.circle,
                      size: 8,
                      color: Colors.green[600],
                    ),
                    SizedBox(width: 4),
                    Text('Completed'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              final status = order['status'] as String;
              final color = getStatusColor(status);
              final icon = getStatusIcon(status);

              return Card(
                  margin: EdgeInsets.all(8.0),
                  child: Column(children: [
                    ListTile(
                      leading: getStatusIcon(status),
                      title: HeadingWidget(title: 'Order ID#${order['id']}'),
                      subtitle: Row(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SubHeadingWidget(title: '${order['items']} Items'),
                          Icon(
                            Icons.circle,
                            size: 11,
                            color: Colors.green[600],
                          ),
                          SubHeadingWidget(
                            title: status,
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          all_expandedIndex == index
                              ? Icons.expand_less
                              : Icons.expand_more,
                        ),
                        onPressed: () {
                          setState(() {
                            all_expandedIndex =
                                all_expandedIndex == index ? -1 : index;
                          });
                        },
                      ),
                      onTap: () {},
                    ),
                    if (all_expandedIndex == index)
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 15,
                                  color: Colors.green,
                                ),
                                SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    HeadingWidget(
                                      title: 'Order Placed',
                                    ),
                                    SubHeadingWidget(
                                      title: 'January 19th 12:02 AM',
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 15,
                                  color: Colors.green,
                                ),
                                SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    HeadingWidget(
                                      title: 'Order Confirmed',
                                    ),
                                    SubHeadingWidget(
                                      title: 'January 19th 12:02 AM',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 15,
                                  color: Colors.green,
                                ),
                                SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    HeadingWidget(
                                      title:
                                          'Your Order On Delivery by Courier',
                                    ),
                                    SubHeadingWidget(
                                      title: 'January 19th 12:02 AM',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            //  SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('Order Cancel'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF027335),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ]));
            },
          ),
          ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: 3,
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 3,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: [
                    ListTile(
                      leading: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.orange[100],
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.asset(
                          AppAssets.shoopingbag,
                          color: Colors.yellow.shade900,
                        ),
                      ),
                      title: Text(
                        'Order ID #0012345',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '12 Items · ',
                            style: TextStyle(color: Color(0xFF91A0B8)),
                          ),
                          Icon(
                            Icons.circle,
                            size: 10,
                            color: Colors.green,
                          ),
                          Text(
                            'On Delivery',
                            style: TextStyle(color: Color(0xFF91A0B8)),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          _expandedIndex == index
                              ? Icons.expand_less
                              : Icons.expand_more,
                        ),
                        onPressed: () {
                          setState(() {
                            _expandedIndex =
                                _expandedIndex == index ? -1 : index;
                          });
                        },
                      ),
                    ),
                    if (_expandedIndex == index)
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.green,
                                          width: 3,
                                        ),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.circle,
                                          color: Colors.green,
                                          size: 12,
                                        ),
                                      ),
                                    ),
                                    DottedLine(
                                      direction: Axis.vertical,
                                      dashColor: Colors.green,
                                      lineLength: 50,
                                      dashLength: 2,
                                      dashGapLength: 2,
                                    ),
                                  ],
                                ),
                                SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Order Placed',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'January 19th 12:02 AM',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.green,
                                          width: 3,
                                        ),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.circle,
                                          color: Colors.green,
                                          size: 12,
                                        ),
                                      ),
                                    ),
                                    DottedLine(
                                      direction: Axis.vertical,
                                      dashColor: Colors.green,
                                      lineLength: 50,
                                      dashLength: 2,
                                      dashGapLength: 2,
                                    ),
                                  ],
                                ),
                                SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Order Confirmed',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'January 19th 12:02 AM',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: Colors.grey,
                                  size: 18,
                                ),
                                SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Your Order On Delivery by Courier',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'January 19th 12:02 AM',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('Order Cancel'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF027335),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
          ListView(
            padding: EdgeInsets.all(10),
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 3,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  title: Text(
                    'Completed Order #0012345',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('Delivered on January 19th'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}








// import 'package:dotted_border/dotted_border.dart';
// import 'package:e_commerce/constants/app_assets.dart';
// import 'package:e_commerce/widgets/heading_widget.dart';
// import 'package:e_commerce/widgets/sub_heading_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:dotted_line/dotted_line.dart';

// class OrderListScreen extends StatefulWidget {
//   @override
//   _OrderListScreenState createState() => _OrderListScreenState();
// }

// class _OrderListScreenState extends State<OrderListScreen>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: Icon(Icons.arrow_back, color: Colors.black),
//         title: HeadingWidget(
//           title: 'My Order',
//           color: Colors.black,
//           fontWeight: FontWeight.bold,
//           fontSize: 20,
//         ),
//         bottom: PreferredSize(
//           preferredSize: Size.fromHeight(50.0),
//           child: Column(
//             children: [
//               TabBar(
//                 controller: _tabController,
//                 indicatorColor: Colors.green,
//                 labelColor: Colors.black,
//                 unselectedLabelColor: Colors.grey,
//                 dividerColor: Colors.transparent,
//                 tabs: [
//                   Tab(text: 'All'),
//                   Tab(text: 'On Delivery'),
//                   Tab(text: 'Completed'),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: [
//           OrderListView(statusFilter: 'All'),
//           OrderListView(statusFilter: 'On Delivery'),
//           OrderListView(statusFilter: 'Completed'),
//         ],
//       ),
//     );
//   }
// }

// class OrderListView extends StatelessWidget {
//   final String statusFilter;

//   const OrderListView({required this.statusFilter});

//   @override
//   Widget build(BuildContext context) {
//     if (statusFilter == 'All') {
//       return Center(
//         child: Text(
//           'Hi',
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//       );
//     }

//     return ListView(
//       padding: EdgeInsets.all(10),
//       children: List.generate(
//         3,
//         (index) => OrderTile(orderId: '#0012345'),
//       ),
//     );
//   }
// }

// class OrderTile extends StatefulWidget {
//   final String orderId;

//   const OrderTile({required this.orderId});

//   @override
//   _OrderTileState createState() => _OrderTileState();
// }

// class _OrderTileState extends State<OrderTile> {
//   bool _expanded = false;

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       elevation: 3,
//       margin: EdgeInsets.symmetric(vertical: 8),
//       child: Column(
//         children: [
//           ListTile(
//             leading: Container(
//                 padding: EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   color: Colors.orange[100],
//                   shape: BoxShape.rectangle,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Image.asset(AppAssets.shoopingbag)),
//             title: Text(
//               'Order ID${widget.orderId}',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//             subtitle: Row(
//               children: [
//                 SubHeadingWidget(
//                   title: '12 Items · ',
//                   color: Color(0xFF91A0B8),
//                 ),
//                 SubHeadingWidget(
//                   title: 'On Delivery',
//                   color: Color(0xFF91A0B8),
//                 ),
//               ],
//             ),
//             trailing: IconButton(
//               icon: Icon(
//                 _expanded ? Icons.expand_less : Icons.expand_more,
//               ),
//               onPressed: () {
//                 setState(() {
//                   _expanded = !_expanded;
//                 });
//               },
//             ),
//           ),
//           if (_expanded)
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   OrderStatusItem(
//                     status: 'Order Placed',
//                     date: 'January 19th 12:02 AM',
//                     completed: true,
//                   ),
//                   OrderStatusItem(
//                     status: 'Order Confirmed',
//                     date: 'January 19th 12:02 AM',
//                     completed: true,
//                   ),
//                   OrderStatusItem(
//                     status: 'Your Order On Delivery by Courier',
//                     date: 'January 19th 12:02 AM',
//                     completed: false,
//                   ),
//                   SizedBox(height: 8),
//                   ElevatedButton(
//                     onPressed: () {},
//                     child: Text('Order Cancel'),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Color(0xFF027335),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }

// class OrderStatusItem extends StatelessWidget {
//   final String status;
//   final String date;
//   final bool completed;

//   const OrderStatusItem({
//     required this.status,
//     required this.date,
//     required this.completed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Column(
//           children: [
//             Icon(
//               Icons.run_circle_outlined,
//               color: completed ? Colors.green : Colors.grey,
//             ),
//             if (status != 'Your Order On Delivery by Courier')
//               DottedLine(
//                 direction: Axis.vertical,
//                 dashColor: completed ? Colors.green : Colors.grey,
//                 lineLength: 50,
//                 dashLength: 2,
//                 dashGapLength: 2,
//               ),
//           ],
//         ),
//         SizedBox(width: 8),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               status,
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Text(
//               date,
//               style: TextStyle(color: Colors.grey),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
