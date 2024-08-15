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
                  onPressed: () {},
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
      child: ListTile(
        leading: CircleAvatar(
          child: Text(expenses[index].name[0]),
          backgroundColor: index % 2 == 0 ? Colors.amber : Colors.blue,
          foregroundColor: Colors.black87,
        ),
        title: Column(
          children: [
            Text(expenses[index].name),
            Text(expenses[index].amount.toString()),
          ],
        ),
      ),
    );
  }
}

class Expenses {
  String name;
  int amount;
  Expenses({required this.name, required this.amount});
}
