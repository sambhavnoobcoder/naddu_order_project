import 'package:flutter/material.dart';



class ShopkeeperPage extends StatefulWidget {
  @override
  _ShopkeeperPageState createState() => _ShopkeeperPageState();
}

class _ShopkeeperPageState extends State<ShopkeeperPage> {
  List<Order> _orders = [];
  List<Order> _completedOrders = [];

  void _addOrder(Order order) {
    setState(() {
      _orders.add(order);
    });
  }

  void _completeOrder(int index) {
    setState(() {
      Order completedOrder = _orders.removeAt(index);
      _completedOrders.add(completedOrder);
    });
  }

  void _removeCompletedOrder(int index) {
    setState(() {
      _completedOrders.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home:Scaffold(
      appBar: AppBar(
        title: Text('Shopkeeper Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
            child: Text(
              'Orders to be completed:',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _orders.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    'Order size: ${_orders[index].size}, sugar: ${_orders[index].sugar}, creme: ${_orders[index].creme}',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.check),
                    onPressed: () => _completeOrder(index),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
            child: Text(
              'Completed orders:',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _completedOrders.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: Key(_completedOrders[index].toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) => _removeCompletedOrder(index),
                  child: ListTile(
                    title: Text(
                      'Order size: ${_completedOrders[index].size}, sugar: ${_completedOrders[index].sugar}, creme: ${_completedOrders[index].creme}',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _removeCompletedOrder(index),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ),);
  }
}

class Order {
  final String size;
  final String sugar;
  final String creme;

  Order({
    required this.size,
    required this.sugar,
    required this.creme,
  });

  @override
  String toString() {
    return 'Order(size: $size, sugar: $sugar, creme: $creme)';
  }
}


void main() {
  runApp(ShopkeeperPage());
}
