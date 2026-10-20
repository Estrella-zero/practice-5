import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;
  int _step = 2;
  void _incrementCounter() {
    setState(() {
      _counter += _step;
    });
  }

  Future<void> _pickStep() async {
    final picked = await showModalBottomSheet<int>(
      context: context,
      builder: (_) => SafeArea(
        child:Column(
          mainAxisSize: MainAxisSize.min,
          children:[1,2,5]
          .map((s) => ListTile(
            title:Text('步长 $s'),
            onTap: ()=> Navigator.pop(context,s),
          ))
          .toList(),
        ),
      ),
    );
    if(picked!=null){
      setState(() => _step = picked);
    }
  }
  @override
  void initState(){
    super.initState();
    print('1 initState');
  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    print('2 didChangeDependencies');
  }

  @override
  void didUpdateWidget(MyHomePage oldWidget){
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  @override
  void dispose(){
    print('dispose');
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context){
    print('3 build');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        flexibleSpace:Image.asset('assets/images/flower.jpg',fit:BoxFit.cover),
        actions:[
          TextButton(
            onPressed: _pickStep,
            child:Text('步长 $_step'),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
