import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Todos()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // key is a special prorperty that allows flutter to identify and differentiate between different widgets. By including super.key as a named parameter in the MyApp constructor, we are telling flutter to use the same key value for the MyApp widget as the parent stateless widget.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 160, 55, 55),
        title: const Text("AppBar"),
      ),
      body: const ListbuilderView(),
    );
  }
}

class UserButton extends StatelessWidget {
  const UserButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print("Hello Worldqwdq"),
      child: Center(
        child: Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 148, 240, 161),
              border:
                  Border.all(color: const Color.fromARGB(255, 14, 123, 212)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text(
                "Click Me",
                style: TextStyle(color: Color.fromARGB(255, 15, 15, 15)),
              ),
            )),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.red,
            // margin: const EdgeInsets.all(10),
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.green[800],
            // margin: const EdgeInsets.all(10),
          )
        ],
      ),
    );
  }
}

// Arrow functions

class ArrowFunctionMyWidget extends StatelessWidget {
  const ArrowFunctionMyWidget({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
              // margin: const EdgeInsets.all(10),
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.green[800],
              // margin: const EdgeInsets.all(10),
            )
          ],
        ),
      );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // initializing a variable
  bool isButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (isButtonPressed) {
            setState(() {
              isButtonPressed = false;
              print(isButtonPressed);
            });
          } else {
            setState(() {
              isButtonPressed = true;
              print(isButtonPressed);
            });
          }
        },
        child: Center(
            child: Container(
          width: 100,
          height: 100,

          // color: getColor(),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: getColor(), width: 5)),
          child: const Center(child: Text("click me")),
        )));
  }

  Color getColor() {
    if (isButtonPressed) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }
}

class Counter extends StatefulWidget {
  const Counter({super.key});
  @override
  // State<Counter> createState() => _CounterState();
  //or
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("count  $counter"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        counter++;
                      });
                    },
                    child: const Text("Increment")),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        counter--;
                      });
                    },
                    child: Text("decrement")),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MyHomePages extends StatefulWidget {
  const MyHomePages({super.key});

  @override
  State<MyHomePages> createState() => _MyHomePagesState();
}

class _MyHomePagesState extends State<MyHomePages> {
  String _inputText = "";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextField(
          decoration: const InputDecoration(
              hintText: "Enter some text field",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              )),
          onChanged: (value) {
            setState(() {
              _inputText = value;
            });
          },
        ),
        Container(
          alignment: Alignment.center,
          height: 50,
          child: Text('you types: $_inputText'),
        )
      ]),
    );
  }
}

class UseAlertBox extends StatefulWidget {
  const UseAlertBox({super.key});

  @override
  State<UseAlertBox> createState() => _UseAlertBoxState();
}

class _UseAlertBoxState extends State<UseAlertBox> {
  String _inputText = "";

  void _showInputDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          TextEditingController controller = TextEditingController();

          return AlertDialog(
            title: const Text("Enter some text:"),
            content: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: "Enter some text",
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text("Cancel", style: TextStyle(fontSize: 20)),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  setState(() {
                    _inputText = controller.text;
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _inputText.isEmpty ? 'Tap icon to enter text' : "$_inputText",
            style: TextStyle(
              fontSize: 20,
              color: _inputText.isEmpty ? Colors.red : Colors.green,
            ),
          ),
          FloatingActionButton(
            onPressed: _showInputDialog,
            child: const Icon(Icons.edit),
          )
        ],
      ),
    );
  }
}

class ListBody extends StatelessWidget {
  const ListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Person One"),
            subtitle: Text("shashwatPal@gmail.com"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () => print("Person One"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Person One"),
            subtitle: Text("shashwatPal@gmail.com"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () => print("Person One"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Person One"),
            subtitle: Text("shashwatPal@gmail.com"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () => print("Person One"),
          )
        ],
      ),
    );
  }
}

class ListbuilderView extends StatelessWidget {
  const ListbuilderView({super.key});

  @override
  Widget build(BuildContext context) {
    final items = ["item1", "item2", "item3", "item4"];
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index]),
          onTap: () => print(items[index]),
        );
      },
    );
  }
}

class Todos extends StatefulWidget {
  const Todos({super.key});

  @override
  State<Todos> createState() => _TodosState();
}

class _TodosState extends State<Todos> {
  // initial variable
  List<String> _todos = ["Todo 1", "Todo 2", "Todo 3", "Todo 4"];

  // Dialog Boc pop-up
  // Text input --> add to the _todos

  void _addTodo() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          String newTodo = "";

          return AlertDialog(
            title: const Text("Enter New Task Below:"),
            content: TextField(
              onChanged: (value) {
                newTodo = value;
              },
            ),
            actions: <Widget>[
              TextButton(
                child: const Text("Cancel"),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: const Text("Add"),
                onPressed: () {
                  setState(() {
                    _todos.add(newTodo);
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  // ListView.builder --> ListTiles _todos
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do List"),
        centerTitle: true,
        backgroundColor: Colors.amber[800],
      ),
      body: ListView.builder(
          itemCount: _todos.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                _todos[index],
                style: TextStyle(
                    decoration: _todos[index].startsWith("-")
                        ? TextDecoration.lineThrough
                        : null),
              ),
              onTap: () => (setState(() {
                _todos[index].startsWith('-')
                    ? _todos[index] = _todos[index].substring(1)
                    : _todos[index] = '- ${_todos[index]}';
              })),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    _todos.removeAt(index);
                  });
                },
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodo,
        child: const Icon(Icons.add),
      ),
    );
  }
}



