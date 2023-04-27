import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Navigation bmi'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  TextEditingController weight = TextEditingController();
  TextEditingController height = TextEditingController();
  late String value;

  void decosta() {
    double wt = double.parse(weight.text);
    double ht = double.parse(height.text) / 100;
    double result = wt / (ht * ht);

    setState(() {
      value = "bmi is :${result.toStringAsFixed(2)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title,),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Enter your Weight ',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: weight,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "weight should be in kg"

              ),
            ),
            SizedBox(height: 20,),
            Text("Enter your Height", style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
            )),
            SizedBox(height: 10,),

            TextField(
              controller: height,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "height should be in cm",


              ),
            ),
            SizedBox(height: 20,),

            ElevatedButton(onPressed: () {
              decosta();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Calc(value),));
            },
              child: Text("SUBMIT", style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),),),
            //Text(value),
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Calc extends StatelessWidget {

  String? val;
  Calc(this.val);




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("callcuated bmi"),),
      body: Padding(
        padding: const EdgeInsets.only(top: 95.0),
        child: Center(
          child: Column(
            children: [
              Text("$val",style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),),
              ElevatedButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text("back"))
            ],
          ),
        ),
      ),
    );
  }
}







































