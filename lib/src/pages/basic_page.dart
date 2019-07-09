import 'package:flutter/material.dart';

class BasicPage extends StatelessWidget {

  @override
  Widget build( BuildContext context ) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _createImageSection( context ),
          _createTitleSection(),
          _createActionsSection(),
          _createTextSection(),
          _createTextSection(),
          _createTextSection(),
          _createTextSection()
        ]
      )
    );
  }

  Widget _createImageSection( BuildContext context ) {
    final screenSize = MediaQuery.of( context ).size;

    return Image(
      image: AssetImage( 'assets/img/lake.jpg' ),
      width: screenSize.width
    );
  }

  Widget _createTitleSection() {
    return Container(
      padding: EdgeInsets.all( 38.0 ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only( bottom: 8.0 ),
                  child: Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle( fontWeight: FontWeight.bold )
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle( color: Colors.grey[ 500 ] )
                )
              ]
            ),
          ),
          Icon( Icons.star, color: Colors.red[ 500 ] ),
          Text( '41' )
        ],
      ),
    );
  }

  Widget _createActionsSection() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _createIcon( Icons.phone, 'CALL' ),
          _createIcon( Icons.near_me, 'ROUTE' ),
          _createIcon( Icons.share, 'SHARE' )
        ],
      )
    );
  }

  Widget _createTextSection() {
    return Container(
      padding: EdgeInsets.all( 38.0 ),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
        textAlign: TextAlign.justify
      )
    );
  }

  Widget _createIcon( IconData icon, String description ) {
    final color = Colors.blue;
    return Column(
      children: <Widget>[
        Icon( icon, color: color ),
        Container(
          padding: EdgeInsets.only( top: 8.0 ),
          child: Text(
            description,
            style: TextStyle(
              color: color,
              fontSize: 12.0,
              fontWeight: FontWeight.w400
            )
          )
        )
      ],
    );
  }

}