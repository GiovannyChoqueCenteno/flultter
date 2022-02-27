import 'dart:ui';

import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards'),
      ),
      body: ListView(
        children: <Widget>[
          _cardTipo1(),
          _cardTipo2(),
        ],
        padding: const EdgeInsets.all(
          10.0,
        ),
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: <Widget>[
          const ListTile(
            title: Text('Soy el titulo de esta tarjeta'),
            leading: Icon(
              Icons.photo_album,
              color: Colors.blue,
            ),
            subtitle: Text('Esta es una descripcion xd'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                onPressed: () {},
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Ok'),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    final card = Container(
      child: Column(
        children: <Widget>[
          const FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              image: NetworkImage(
                  'https://photographylife.com/wp-content/uploads/2017/01/What-is-landscape-photography.jpg'),
              fadeInDuration: Duration(milliseconds: 200),
              height: 300,
              fit: BoxFit.cover),
          // Image(
          //   image: NetworkImage(
          //       'https://photographylife.com/wp-content/uploads/2017/01/What-is-landscape-photography.jpg'),
          // ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: const Text('No tengo idea de que poner'),
          )
        ],
      ),
    );
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              spreadRadius: 2.0,
              offset: Offset(2.0, -10.0),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: card,
        ));
  }
}
