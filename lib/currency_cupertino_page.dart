import "package:flutter/cupertino.dart";

class CurrencyCupertinoPage extends StatefulWidget {
  const CurrencyCupertinoPage({super.key});
  @override
  State<CurrencyCupertinoPage> createState() => _CurrencyCupertinoPageState();
}

class _CurrencyCupertinoPageState extends State<CurrencyCupertinoPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  void convert() {
    result = double.parse(textEditingController.text) * 16230;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color.fromRGBO(29, 29, 29, 1),
      navigationBar: CupertinoNavigationBar(
        middle: const Text(
          "Currency Converter",
          style: TextStyle(color: CupertinoColors.white),
        ),
        backgroundColor: const Color.fromRGBO(29, 29, 29, 1),
      ),
      child: Center(
        child: ColoredBox(
          color: const Color.fromRGBO(255, 0, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Rp ${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}",
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: CupertinoTextField(
                  controller: textEditingController,
                  style: const TextStyle(
                    color: CupertinoColors.white,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(29, 29, 29, 1),
                    border: Border.all(color: CupertinoColors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  placeholder: "Enter amount in USD",
                  prefix: Icon(
                    CupertinoIcons.money_dollar,
                    color: CupertinoColors.white,
                  ),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: CupertinoButton(
                  onPressed: () {
                    setState(() {
                      try {
                        convert();
                      } catch (e) {
                        result = 0;
                        showCupertinoDialog(
                          context: context,
                          builder: (context) {
                            return CupertinoAlertDialog(
                              title: const Text("Invalid Input"),
                              content:
                                  const Text("Please enter a valid number."),
                              actions: [
                                CupertinoDialogAction(
                                  child: const Text("OK"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    });
                  },
                  color: CupertinoColors.white,
                  child: const SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Convert",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: CupertinoColors.black),
                    ),
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
