import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController amoutController = TextEditingController();
  List<Expenses> expenses = List.empty(growable: true);

  int Index = -1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("FERUZI"),
          ),
          backgroundColor: Colors.cyan[300],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: amoutController,
                keyboardType: TextInputType.number,
                maxLength: 15,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)))),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    String name = nameController.text.trim();
                    String amount = amoutController.text.trim();
                    if (name.isNotEmpty && amount.isNotEmpty) {
                      setState(() {
                        expenses.add(
                            Expenses(name: name, amount: int.parse(amount)));
                        nameController.clear();
                        amoutController.clear();
                      });
                    }
                  },
                  child: const Text(
                    'SAVE',
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                ElevatedButton(
                  onPressed: () {
                    String name = nameController.text.trim();
                    String amount = amoutController.text.trim();
                    if (name.isNotEmpty && amount.isNotEmpty) {
                      setState(() {
                        expenses[Index].name = name;
                        expenses[Index].amount = int.parse(amount);
                        Index = -1;

                        nameController.clear();
                        amoutController.clear();
                      });
                    }
                  },
                  child: const Text('UPDATE'),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            expenses.isEmpty
                ? const Text('No data found')
                : Expanded(
                    child: ListView.builder(
                      itemCount: expenses.length,
                      itemBuilder: (context, index) => getList(index),
                    ),
                  )
          ],
        ),
        backgroundColor: Colors.grey[400],
      ),
    );
  }

  Widget getList(int index) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Container(
              child: CircleAvatar(
                backgroundColor: index % 2 == 0 ? Colors.amber : Colors.blue,
                foregroundColor: Colors.black87,
                child: Text(
                  expenses[index].name[0],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      expenses[index].name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(expenses[index].amount.toString()),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {
                          nameController.text = expenses[index].name;
                          amoutController.text =
                              expenses[index].amount.toString();
                          setState(() {
                            Index = index;
                          });
                        },
                        icon: const Icon(Icons.edit)),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            expenses.removeAt(index);
                          });
                        },
                        icon: const Icon(Icons.delete)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Expenses {
  String name;
  int amount;
  Expenses({required this.name, required this.amount});
}
