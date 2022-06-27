import 'package:flutter/material.dart';
import 'package:stateful_widget_demo/models/basic_info_class.dart';
import 'package:stateful_widget_demo/screens/user_input_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool editMode = false;
  final List<BasicInfo> infoList = [];
  int? editIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade100,
      appBar: AppBar(title: const Text('TODO LIST'), centerTitle: true,
      actions: [IconButton(onPressed: (){

      }, icon: Icon(Icons.logout))],),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: infoList.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.blue.shade200,
                  margin: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: ListTile(
                    leading: Text('${index + 1}'),
                    title: Text((infoList[index].name).toString()),
                    subtitle: Text((infoList[index].department).toString()),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              editMode = true;
                              editIndex = index;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserInputScreen(
                                      name: infoList[index].name,
                                      depart: infoList[index].department,
                                      editMode: editMode),
                                ),
                              ).then((value) {
                                var existingValues = infoList[editIndex!];
                                existingValues.name = value[0];
                                existingValues.department = value[1];

                                setState(
                                  () {
                                    infoList[editIndex!] = existingValues;
                                    editIndex = null;
                                  },
                                );
                              });
                            }),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              infoList.removeAt(index);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Center(
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserInputScreen(),
                    ),
                  ).then((value) {
                    setState(() {
                      infoList.add(BasicInfo(value[0], value[1]));
                    });
                  });
                },
                child: const Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
