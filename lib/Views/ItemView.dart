import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prova/Utils/Assets.dart';
import 'package:prova/Views/CartView.dart';
import 'package:prova/Utils/FontConstants.dart';
import 'package:prova/Utils/colors.dart';


class ItemView extends StatefulWidget {
  final int? index;
  final int? initNumber;
  final Function(int)? counterCallback;
  final Function? increaseCallback;
  final Function? decreaseCallback;
  final int? minNumber;
  ItemView({this.index , this.initNumber,  this.counterCallback,  this.increaseCallback,  this.decreaseCallback,  this.minNumber});

  @override
  _ItemView createState() => _ItemView();
}

class _ItemView extends State <ItemView>{
  int? _index;
  late int _currentCount;
  late Function _counterCallback;
  late Function _increaseCallback;
  late Function _decreaseCallback;
  late int _minNumber;

  @override
  void initState(){
    _index = widget.index ?? 0;
    _currentCount = widget.initNumber ?? 0;
    _counterCallback = widget.counterCallback ?? (int number) {};
    _increaseCallback = widget.increaseCallback ?? () {};
    _decreaseCallback = widget.decreaseCallback ?? () {};
    _minNumber = widget.minNumber ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: const Text('Item View'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartView()),
              );
            },
            child: const Text("Cart", style: TextStyle(color: black)),
          ),
        ],
          bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
            child: Divider(
              height: 1,
              thickness: 1,
              color: gray300,
            )
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(14),
        child: Column(
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  color: Colors.green.shade900,
                  padding: EdgeInsets.all(10),
                  child: Image.asset(
                    Assets.starbucks,
                    height: 270,
                    width: 270,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Product Name#$_index",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "12,30 ₺",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.green.shade900,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 240),
            Center(
              child: Container(
                padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 5),
                      _createIncrementDicrementButton(Icons.add, () => _increment()),
                      SizedBox(width: 5),
                      Text(_currentCount.toString(), style: TextStyle(fontSize:20)),
                      SizedBox(width: 5),
                      _createIncrementDicrementButton(Icons.remove, () => _dicrement()),
                      SizedBox(width: 10),
                      ElevatedButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CartView()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black12, width: 0.5),
                              borderRadius: BorderRadius.circular(35),
                            ),
                            fixedSize: Size(180, 50),
                          ),
                        child: Text("Add to Cart", style: TextStyle(fontSize: 17)),
                      ),
                    ],
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _increment() {
    setState(() {
      _currentCount++;
      _counterCallback(_currentCount);
      _increaseCallback();
    });
  }

  void _dicrement() {
    setState(() {
      if (_currentCount > _minNumber) {
        _currentCount--;
        _counterCallback(_currentCount);
        _decreaseCallback();
      }
    });
  }

  Widget _createIncrementDicrementButton(IconData icon, VoidCallback onPressed) {
    return RawMaterialButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      constraints: BoxConstraints(minWidth: 50.0, minHeight: 50.0),
      onPressed: onPressed,
      elevation: 0,
      fillColor: Colors.white,
      child: Icon(
        icon,
        color: Colors.black,
        size: 20.0,
      ),
      shape: CircleBorder(
        side: BorderSide(
          color: Colors.black12,
          width: 1,
        )
      ),
    );
  }
}





