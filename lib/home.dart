import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HomePage")),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          AppButton(
            icon: Icons.search,
            detail: "Search Advice Id",
            cardColor: Colors.amber,
            route: '/search',
          ),
          AppButton(
            icon: Icons.person,
            detail: "Random Advice",
            cardColor: Colors.deepPurple,
            route: '/random',
          ),
        ],
      ),
    );
  }
}

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.icon,
    required this.route,
    required this.detail,
    this.iconColor = Colors.white,
    this.cardColor = Colors.grey,
  });

  final IconData icon;
  final Color iconColor;
  final Color cardColor;
  final String route;
  final String detail;

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        color: cardColor,
        child: InkWell(
          splashColor: cardColor,
          onTap: () {
            Navigator.pushNamed(context, route);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              Icon(icon, color: iconColor, size: 100),
              Text(detail,textScaler: TextScaler.linear(1.2),style:TextStyle(color: iconColor),),
            ],
          ),
        ),
      ),
    );
  }
}
