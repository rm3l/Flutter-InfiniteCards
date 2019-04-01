import 'package:flutter/material.dart';
import 'package:infinite_cards/infinite_cards.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  InfiniteCardsController _controller = InfiniteCardsController();
  AnimType _animType = AnimType.SWITCH;

  Widget _renderItem(BuildContext context, int index) {
    return Image(
      image: AssetImage('assets/pic${index + 1}.png'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InfiniteCards"),
      ),
      body: Column(
        children: <Widget>[
          InfiniteCards(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * 1.3,
            itemBuilder: _renderItem,
            itemCount: 5,
            controller: _controller,
            animType: _animType,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  _controller.previous();
                },
                child: Text("Pre"),
              ),
              RaisedButton(
                onPressed: () {
                  _controller.reset();
                },
                child: Text("Reset"),
              ),
              RaisedButton(
                onPressed: () {
                  _controller.next();
                },
                child: Text("Next"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
