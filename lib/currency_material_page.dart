// import 'dart:ffi' as ffi;

import 'package:flutter/material.dart';

class CurrencyMaterialPage extends StatefulWidget {
  const CurrencyMaterialPage({super.key});
  @override
  State<CurrencyMaterialPage> createState() => _CurrencyMaterialPageState();
}

class _CurrencyMaterialPageState extends State<CurrencyMaterialPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  void convert() {
    result = double.parse(textEditingController.text) * 16230;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(29, 29, 29, 1),
      appBar: AppBar(
        title: const Text(
          "Currency Converter",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(29, 29, 29, 1),
      ),
      body: Center(
        child: ColoredBox(
          color: const Color.fromRGBO(255, 0, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Rp ${result.toString()}",
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: TextField(
                  controller: textEditingController,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    hintText: "Enter amount in USD",
                    hintStyle: TextStyle(color: Colors.white70),
                    prefixIcon: Icon(Icons.monetization_on_outlined,
                        color: Colors.white70),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white54),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      try {
                        convert();
                      } catch (e) {
                        // result = 0;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Enter a valid number")),
                        );
                      }
                    });
                  },
                  style: TextButton.styleFrom(
                    shadowColor: Color.fromRGBO(255, 255, 255, 0.3),
                    elevation: 5,
                    backgroundColor: Colors.white70,
                    foregroundColor: Colors.black,
                    minimumSize: const Size(double.infinity, 50),
                    textStyle:
                        const TextStyle(fontSize: 18, color: Colors.black87),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text("Convert"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class CurrencyMaterialPage1 extends StatelessWidget {
//   const CurrencyMaterialPage1({super.key});

//   @override

// }
