import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {

  @override
  Widget build( BuildContext context ) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          _createPage1(),
          _createPage2()
        ],
      )
    );
  }

  Widget _createPage1() {
    return Stack(
      children: <Widget>[
        _createBackgroundImage(),
        _createForegroundColumn()
      ]
    );
  }

  Widget _createBackgroundImage() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage( 'assets/img/scroll-1.png' ),
        fit: BoxFit.cover
      )
    );
  }

  Widget _createForegroundColumn() {
    final textStyle = TextStyle( color: Colors.white, fontSize: 50.0 );

    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric( vertical: 80.0 ),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric( vertical: 20.0 ),
              child: Text( '11°', style: textStyle )
            ),
            Container(
              padding: EdgeInsets.symmetric( vertical: 20.0 ),
              child: Text( 'Miércoles', style: textStyle )
            ),
            Expanded( child: Container() ),
            IconButton(
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
                size: 70.0
              ),
              onPressed: () {}
            )
          ]
        )
      )
    );
  }

  Widget _createPage2() {
    final textStyle = TextStyle( color: Colors.white, fontSize: 30.0 );

    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Color.fromRGBO( 108, 192, 218, 1.0 ),
      child: Center(
        child: RaisedButton(
          color: Colors.blue,
          padding: EdgeInsets.symmetric( horizontal: 70.0, vertical: 15.0 ),
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular( 15.0 ) ),
          child: Text( 'Bienvenido', style: textStyle ),
          onPressed: () {}
        )
      ),
    );
  }

}