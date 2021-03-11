import 'package:flutter/material.dart';
import 'package:flutterapp/pages/patdetails.dart';
import 'patList.dart';

class Docdrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.green[400],
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 50,
                      bottom: 20,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image:
                          NetworkImage('https://picsum.photos/250?image=9'),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Text(
                    'Nanthagopan',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'nanthagopan1999@gmail.com',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'Profile',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              /*Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Details(),
                  ));

               */
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'Patient details',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'Settings',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.arrow_back),
            title: Text(
              'Log out',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: null,
          ),
        ],
      ),
    );
  }
}