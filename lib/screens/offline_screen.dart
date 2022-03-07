import 'package:flutter/material.dart';

class OfflineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset("assets/images/connected.jpg"),
              ),
              Text(
                'Please Check Your Connection With NetWork',
                style: TextStyle(color: Theme.of(context).dividerColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
