import 'package:flutter/material.dart';

class CoffeePageOrder extends StatefulWidget {
  @override
  _CoffeePageOrderState createState() => _CoffeePageOrderState();
}

class _CoffeePageOrderState extends State<CoffeePageOrder> {
  int _selectedSizeIndex = 0;
  int _selectedSugarIndex = 0;
  int _selectedCreamIndex = 0;

  final List<String> _sizes = ['Small', 'Medium', 'Large'];
  final List<String> _sugarLevels = ['0%', '25%', '50%', '75%'];
  final List<String> _creamLevels = ['0%', '25%', '50%', '75%'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coffee Order'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Select size:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildSizeOptions(),
            ),
            SizedBox(height: 32),
            Text(
              'Select sugar level:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildSugarOptions(),
            ),
            SizedBox(height: 32),
            Text(
              'Select cream level:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildCreamOptions(),
            ),
            SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                child: Text('Place Order'),
                onPressed: () {
                  _showOrderDialog();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildSizeOptions() {
    List<Widget> options = [];

    for (int i = 0; i < _sizes.length; i++) {
      options.add(
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedSizeIndex = i;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: _selectedSizeIndex == i
                  ? Theme.of(context).primaryColor
                  : Colors.grey[400],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              _sizes[i],
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );

      if (i < _sizes.length - 1) {
        options.add(SizedBox(width: 16));
      }
    }

    return options;
  }

  List<Widget> _buildSugarOptions() {
    List<Widget> options = [];

    for (int i = 0; i < _sugarLevels.length; i++) {
      options.add(
          GestureDetector(
          onTap: () {
        setState(() {
          _selectedSugarIndex = i;
        });
      },
    child: Container(
    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    decoration: BoxDecoration(
    color: _selectedSugarIndex == i
    ? Theme.of(context).primaryColor
        : Colors.grey[400],
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    )
    ),
      child: Text(
        _sugarLevels[i],
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
          ),
      );

      if (i < _sugarLevels.length - 1) {
        options.add(SizedBox(width: 16));
      }
    }

    return options;
  }

  List<Widget> _buildCreamOptions() {
    List<Widget> options = [];
    for (int i = 0; i < _creamLevels.length; i++) {
      options.add(
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedCreamIndex = i;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: _selectedCreamIndex == i
                  ? Theme.of(context).primaryColor
                  : Colors.grey[400],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              _creamLevels[i],
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );

      if (i < _creamLevels.length - 1) {
        options.add(SizedBox(width: 16));
      }
    }

    return options;
  }

  void _showOrderDialog() {
    String size = _sizes[_selectedSizeIndex];
    String sugar = _sugarLevels[_selectedSugarIndex];
    String cream = _creamLevels[_selectedCreamIndex];
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Confirm Order'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Size: $size'),
            SizedBox(height: 8),
            Text('Sugar Level: $sugar'),
            SizedBox(height: 8),
            Text('Cream Level: $cream'),
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          ElevatedButton(
            child: Text('Confirm'),
            onPressed: () {
              Navigator.of(context).pop();
              _showConfirmationSnackbar();
            },
          ),
        ],
      ),
    );
  }

  void _showConfirmationSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Your order has been placed!'),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Order App',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CoffeePageOrder(),
    );
  }
}

void main() {
  runApp(MyApp());
}
