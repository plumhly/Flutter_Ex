import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InheritedProvider<T> extends InheritedWidget {

  InheritedProvider({
    @required this.data,
    Widget child
  }): super (child: child);

  final T data;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}


Type _typeOf<T>() => T;

class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
  ChangeNotifierProvider({Key key, this.data, this.child}) : super(key: key);

  final Widget child;
  final T data;

  static T of<T>(BuildContext context, {bool listen = true}) {
    final type = _typeOf<InheritedProvider<T>>();
    final provider = listen ? context.inheritFromWidgetOfExactType(type) as InheritedProvider<T> 
                            : context.ancestorInheritedElementForWidgetOfExactType(type).widget as InheritedProvider<T> ;
    return provider.data;
  }

  _ChangeNotifierProviderState<T> createState() => _ChangeNotifierProviderState<T>();
}

class _ChangeNotifierProviderState<T extends ChangeNotifier> extends State<ChangeNotifierProvider> {

  void update() {
    setState(() {
      
    });
  }

  @override
  void didUpdateWidget(ChangeNotifierProvider<T> oldWidget) {
    if (oldWidget.data != widget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    widget.data.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    widget.data.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InheritedProvider<T>(
      data: widget.data,
      child: widget.child,
    );
  }
}

class Item {
  Item(this.price, this.count);
  double price;
  int count;
}

class CartModel extends ChangeNotifier {
  final List<Item> _items = [];
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  double get totalPrice => _items.fold(0, (value, item) => value + item.count * item.price);

  void add(Item item) {
    _items.add(item);
    notifyListeners();
  }
}

class ProviderRoute extends StatefulWidget {
  ProviderRoute({Key key}) : super(key: key);

  _ProviderRouteState createState() => _ProviderRouteState();
}

class _ProviderRouteState extends State<ProviderRoute> {
  @override
  Widget build(BuildContext context) {
    return Center(
       child: ChangeNotifierProvider<CartModel>(
         data: CartModel(),
         child: Builder(
           builder: (context) {
             return Column(
               children: <Widget>[
                 Consumer<CartModel>(
                   builder: (context, cart) => Text("总价:${cart.totalPrice}"),
                 ),
                Builder(
                  builder: (context) {
                    print("raise button");
                    return RaisedButton(
                      child: Text("商品"),
                      onPressed: () => ChangeNotifierProvider.of<CartModel>(context, listen: false).add(Item(20, 2)),
                    );
                  },
                )
               ],
             );
           },
         )
       ),
    );
  }
}

class Consumer<T> extends StatelessWidget {
  const Consumer({
    Key key, 
    @required this.builder, 
    this.child
    }) :assert (builder != null), 
        super(key: key);

  final Widget child;
  final Widget Function(BuildContext context, T value) builder; 
  @override
  Widget build(BuildContext context) {
    return builder(
      context,
      ChangeNotifierProvider.of<T>(context)
    );
  }
}