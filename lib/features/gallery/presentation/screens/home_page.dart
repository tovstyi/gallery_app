import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    // TODO: load list of small pics. (with title and author)
    // toast.init(context);
    // context.read<CollaborativesCubit>().loadPoints();
    // context.read<CollaborativesCubit>().getOrders();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // TODO: create list of small pics. (with title and author)
          ListView.builder(itemBuilder: (BuildContext context, int count) {
            return Container(
              color: Colors.black,
            );
          })
        ],
      ),
    );
  }
}
