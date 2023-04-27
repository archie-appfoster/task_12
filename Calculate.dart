class Calculate extends StatefulWidget {
  const Calculate({Key? key}) : super(key: key);
  @override
  State<Calculate> createState() => _Calculated();}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Welcome to bmi calculator")),
        body: Padding(
          padding: const EdgeInsets.all(45.0),
          child: Column(
            children: [
              Text("hi", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),),
              SizedBox(height: 20,),
              Center(
                child:
                ElevatedButton(onPressed: () {
                  Navigator.pop(context);
                }, child: Text("back")),
              ),
            ],
          ),
        )
    );
  }
}