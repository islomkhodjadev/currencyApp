

import "package:flutter/material.dart";
import "apiCall.dart";


class CurrencyConverterMaterialPage extends StatefulWidget {
    const CurrencyConverterMaterialPage({super.key}); 

    @override
    State createState() =>  _CurrencyConverterMaterialPageState();
      


}


class _CurrencyConverterMaterialPageState extends State{
  
  double result = 0;
  final TextEditingController currency = TextEditingController();
  CurrencyService currencyservice = CurrencyService();
  double exchanegRate = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadExchangeRate();



  }

  void loadExchangeRate() async {
    exchanegRate = await currencyservice.getExchangeRate();
    print(exchanegRate);
  }

   @override
   Widget build(BuildContext context) {
    
    final border = UnderlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.black54,
          width: 2,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(60.0));

    return Scaffold(
        backgroundColor: Colors.blueGrey,
        
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(
                  "${result != 0 ? result.toStringAsFixed(2):  "0"} \$",
                style: const TextStyle(
                  fontSize: 35,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.w900,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  // scrollPadding: ,
                  controller: currency,
                  decoration: InputDecoration(
                    
                    contentPadding: const EdgeInsets.all(20),
                    hintText: "Enter amount in sums",
                    hintStyle: const TextStyle(color: Colors.black54),
                    suffixIcon: const Icon(Icons.monetization_on),
                    suffixIconColor: Colors.black54,
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: border,
                    focusedBorder: border,
                  ),
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  
                  onPressed: () {
                    
                    setState(() {
                      
                      result = parseCurrency(currency.text)/exchanegRate;
                      print(exchanegRate);
                    });

                  },
                  style: const ButtonStyle(
                    elevation: WidgetStatePropertyAll(10.0),
                    backgroundColor: WidgetStatePropertyAll(Colors.white),
                    foregroundColor: WidgetStatePropertyAll(Colors.black54),
                    minimumSize : WidgetStatePropertyAll(Size(50, 50)), 
                    shape: WidgetStatePropertyAll(CircleBorder())
                  ),
                  child: const Icon(Icons.change_circle)
                ),
              )
            ],
          ),
        ));
        
  }
double parseCurrency(String input) {
    if (input.isEmpty) {
      return 0.0; // Return 0.0 if the input is empty
    }
    double? value = double.tryParse(input);
    if (value == null) {
      return 0.0; // Return 0.0 if the input is not a valid number
    }
    return value;
  }
}



class CurrencyConverterMaterialPagee extends StatelessWidget {
  const CurrencyConverterMaterialPagee({super.key});
  
  
  @override
  Widget build(BuildContext context) {
    final TextEditingController currency = TextEditingController();
  
    double result = 0;
    
    final border = UnderlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.black54,
          width: 2,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(60.0));

    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          elevation: 0,
          title: const Text("Currency converter uz to us",
          style: TextStyle(
            color: Colors.white,
          ),
          ),
          
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(
                 result.toString(),
                style: const TextStyle(
                  fontSize: 35,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.w900,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  // scrollPadding: ,
                  controller: currency,
                  decoration: InputDecoration(
                    
                    contentPadding: const EdgeInsets.all(20),
                    hintText: "Enter amount in sums",
                    hintStyle: const TextStyle(color: Colors.black54),
                    suffixIcon: const Icon(Icons.monetization_on),
                    suffixIconColor: Colors.black54,
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: border,
                    focusedBorder: border,
                  ),
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  
                  onPressed: () {
                    result = double.parse(currency.text)*12654.26; 
                    print(result);
                    build(context);

                  },
                  style: const ButtonStyle(
                    elevation: WidgetStatePropertyAll(10.0),
                    backgroundColor: WidgetStatePropertyAll(Colors.white),
                    foregroundColor: WidgetStatePropertyAll(Colors.black54),
                    minimumSize : WidgetStatePropertyAll(Size(50, 50)), 
                    shape: WidgetStatePropertyAll(CircleBorder())
                  ),
                  child: const Icon(Icons.change_circle)
                ),
              )
            ],
          ),
        ));
  }

  static void convertCurrency() {
    print("hey man");
  }
}
