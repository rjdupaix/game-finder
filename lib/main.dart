

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Game Finder',
      home: Landing(),
    );
  }
}

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {

  List<String> searchTerms = [
    "Talisman",
    "Exploding Kittens",
    "Catan",
    "Dominion",
    "Star Wars: Rebellion",
    "Monopoly",
    "Skull King",
    "Magic",
    "D&D"
  ];

  Column getAllGames() {
    Column games = Column(
      children: [
        getGameRow(searchTerms[0]),
        getGameRow(searchTerms[1]),
        getGameRow(searchTerms[2]),
        getGameRow(searchTerms[3]),
        getGameRow(searchTerms[4]),
        getGameRow(searchTerms[5]),
        getGameRow(searchTerms[6]),
        getGameRow(searchTerms[7]),
        getGameRow(searchTerms[8]),
      ],
    );

    return games;
  }

  Widget getGameRow(String title) {
    return ListTile(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      visualDensity: const VisualDensity(vertical: 3),
      title: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios),
        ],
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => GamePage(title: title,)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Finder',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Game FInder"),
        ),
        body: getAllGames(),
      ),
    );
  }
}

class GamePage extends StatelessWidget {
  final String title;

  GamePage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Text(title),
          backgroundColor: Colors.red,
          actions: <Widget> [
            IconButton(
              icon: const Icon(
                Icons.home,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                const Landing()), (Route<dynamic> route) => false);
              },
            )
          ],
        ),
        body: Column(
          children: [
            ListTile(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                visualDensity: const VisualDensity(vertical: 3),
                title: Row(
                  children: const [
                    Text(
                      'Find Games Near You',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CloseGames()),
                  );
                }
            ),
            ListTile(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                visualDensity: const VisualDensity(vertical: 3),
                title: Row(
                  children: [
                    Text(
                      'About $title',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutInfo(title: title,)),
                  );
                }
            ),
          ],
        )
    );
  }
}

class AboutInfo extends StatelessWidget {
  final String title;

  AboutInfo({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About $title'),
        backgroundColor: Colors.red,
        actions: <Widget> [
          IconButton(
            icon: const Icon(
              Icons.home,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
              const Landing()), (Route<dynamic> route) => false);
            },
          )
        ],
      ),
      body: Column(
        children: [
          ListTile(
            title: Text("$title is a very good game"),
          ),
        ],
      ),
    );
  }
}


class CloseGames extends StatelessWidget {
  const CloseGames({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Games Near You'),
        backgroundColor: Colors.red,
        actions: <Widget> [
          IconButton(
            icon: const Icon(
              Icons.home,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
              const Landing()), (Route<dynamic> route) => false);
            },
          )
        ],
      ),
      body: Column(
        children: [
          ListTile(
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(5),
            ),
            visualDensity: const VisualDensity(vertical: 3),
            title: Row(
              children: const [
                Text(
                  'Game 1',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Spacer(),
                Text('0.2 miles away'),
                Spacer(),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactInfo()),
              );
            },
          ),
          ListTile(
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(5),
            ),
            visualDensity: const VisualDensity(vertical: 3),
            title: Row(
              children: const [
                Text(
                  'Game 2',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Spacer(),
                Text('1.5 miles away'),
                Spacer(),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactInfo()),
              );
            },
          ),
          ListTile(
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(5),
            ),
            visualDensity: const VisualDensity(vertical: 3),
            title: Row(
              children: const [
                Text(
                  'Game 3',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Spacer(),
                Text('5.1 miles away'),
                Spacer(),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactInfo()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ContactInfo extends StatelessWidget {
  const ContactInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Contact Info'),
          backgroundColor: Colors.red,
          actions: <Widget> [
            IconButton(
              icon: const Icon(
                Icons.home,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                const Landing()), (Route<dynamic> route) => false);
              },
            )
          ],
        ),
        body: Column(
          children: const [
            ListTile(
              title: Text(
                'John Doe',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            ListTile(
              title: Text('123-456-7890'),
            ),
            ListTile(
              title: Text('Our group is tons of fun and really welcoming. \n'
                  'Feel free to text or call to join!'),
            ),
          ],
        )
    );
  }
}
