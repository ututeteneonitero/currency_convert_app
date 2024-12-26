import 'package:flutter/material.dart';

class CurrencyMaterialPage extends StatelessWidget {
  const CurrencyMaterialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(29, 29, 29, 1),
      body: Center(
        child: ColoredBox(
          color: Color.fromRGBO(255, 0, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "0",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              TextField(
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: "Enter amount in USD",
                  hintStyle: TextStyle(color: Colors.white70),
                  label: Text(
                    "Enter amount in USD to convert",
                    style: TextStyle(color: Colors.white),
                  ),
                  prefixIcon: Icon(Icons.monetization_on_outlined,
                      color: Colors.white70),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
