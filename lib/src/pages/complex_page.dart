import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class ComplexPage extends StatelessWidget {

  @override
  Widget build( BuildContext context ) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _createBackground( context ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _createTexts(),
                _createTable()
              ]
            )
          )
        ],
      ),
      bottomNavigationBar: _customBottomNavigator( context )
    );
  }

  Widget _createBackground( BuildContext context ) {
    final screenSize = MediaQuery.of( context ).size;

    final purpleGradient = Container(
      height: screenSize.height,
      width: screenSize.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end:  Alignment.bottomCenter,
          colors: <Color>[
            Color.fromRGBO( 52, 54, 101, 1.0 ),
            Color.fromRGBO( 35, 37, 57, 1.0 )
          ]
        )
      )
    );

    final pinkGradient = Transform.rotate(
      angle: -pi / 4.0,
      child: Container(
        height: screenSize.width * 0.8,
        width: screenSize.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular( 50.0 ),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end:  Alignment.bottomLeft,
            colors: <Color>[
              Color.fromRGBO( 241, 142, 172, 1.0 ),
              Color.fromRGBO( 236, 98, 188, 1.0 )
            ]
          )
        )
      )
    );

    return Stack(
      children: <Widget>[
        purpleGradient,
        Positioned(
          top: -screenSize.width * 0.2,
          left: -screenSize.width * 0.05,
          child: pinkGradient
        )
      ],
    );
  }

  Widget _createTexts() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.fromLTRB( 25.0, 35.0, 25.0, 5.0 ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only( bottom: 15.0 ),
              child: Text(
                'Classify transaction',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold
                )
              ),
            ),
            Text(
              'Classify this transaction in a particular category',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0
              )
            )
          ]
        )
      ),
    );
  }

  Widget _customBottomNavigator( BuildContext context ) {
    return Theme(
      data: Theme.of( context ).copyWith(
        canvasColor: Color.fromRGBO( 55, 57, 84, 1.0 ),
        primaryColor: Color.fromRGBO( 236, 98, 188, 1.0 ),
        textTheme: Theme.of( context ).textTheme.copyWith( caption: TextStyle( color: Colors.grey ) )
      ),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon( Icons.calendar_today, size: 30.0 ),
            title: Container()
          ),
          BottomNavigationBarItem(
            icon: Icon( Icons.bubble_chart, size: 30.0 ),
            title: Container()
          ),
          BottomNavigationBarItem(
            icon: Icon( Icons.supervised_user_circle, size: 30.0 ),
            title: Container()
          )
        ],
      )
    );
  }

  Widget _createTable() {
    return Container(
      padding: EdgeInsets.symmetric( horizontal: 10.0 ),
      child: Table(
        children: <TableRow> [
          TableRow(
            children: <Widget> [
              _createCell( Icons.apps, 'General', Colors.blue ),
              _createCell( Icons.directions_bus, 'Transport', Colors.deepPurple )
            ]
          ),
          TableRow(
            children: <Widget> [
              _createCell( Icons.shopping_cart, 'Shopping', Colors.pinkAccent ),
              _createCell( Icons.train, 'Bills', Colors.orangeAccent[ 700 ] )
            ]
          ),
          TableRow(
            children: <Widget> [
              _createCell( Icons.local_movies, 'Entertainment', Colors.indigo ),
              _createCell( Icons.fastfood, 'Grocery', Colors.greenAccent[ 400 ] )
            ]
          )
        ],
      ),
    );
  }

  Widget _createCell( IconData icon, String description, Color color ) {
    final textStyle = TextStyle( color: color, fontSize: 18.0 );

    return Container(
      padding: EdgeInsets.all( 20.0 ),
      margin: EdgeInsets.all( 15.0 ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular( 20.0 ),
        color: Color.fromRGBO( 55, 57, 84, 0.8 )
      ),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur( sigmaX: 10.0, sigmaY: 10.0 ),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric( vertical: 15.0 ),
                child: CircleAvatar(
                  backgroundColor: color,
                  foregroundColor: Colors.white,
                  radius: 30.0,
                  child: Icon( icon, size: 25.0 )
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric( vertical: 15.0 ),
                child: Text( description, style: textStyle )
              )
            ]
          ),
        ),
      )
    );
  }
}