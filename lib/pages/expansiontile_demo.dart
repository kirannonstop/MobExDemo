import 'package:flutter/material.dart';

class SampleModel {
  String state;
  List<String> districts;

  SampleModel({required this.state, required this.districts});
}

class CheckExpansionTileList extends StatefulWidget {
  const CheckExpansionTileList({Key? key}) : super(key: key);

  @override
  State<CheckExpansionTileList> createState() => _HomePageState();
}

class _HomePageState extends State<CheckExpansionTileList> {
  // Generate a list of list items
  // In real app, data often is fetched from an API or a database
  final List<Map<String, dynamic>> _items = List.generate(
      50,
      (index) => {
            "id": index,
            "title": "Item $index",
            "content":
                "This is the main content of item $index. It is very long and you have to expand the tile to see it."
          });

  List<SampleModel> stateList = [];

  // This function is called when a "Remove" button associated with an item is pressed
  void _removeItem(int id) {
    setState(() {
      _items.removeWhere((element) => element['id'] == id);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(milliseconds: 600),
        content: Text('Item with id #$id has been removed')));
  }

  @override
  void initState() {
    // TODO: implement initState
    List<String> districtsList = ["aaa", "fdsfsdf", "tytryry", "756765765"];
    stateList.add(SampleModel(state: "MH", districts: districtsList));
    stateList.add(SampleModel(state: "UP", districts: districtsList));
    stateList.add(SampleModel(state: "MP", districts: districtsList));
    stateList.add(SampleModel(state: "HP", districts: districtsList));
    super.initState();
  }

  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('KindaCode.com')),
        body: ListView.builder(
            itemCount: _items.length,
            itemBuilder: (_, index) {
              final item = _items[index];


              return Card(
                // this key is required to save and restore ExpansionTile expanded state
                key: PageStorageKey(item['id']),
                color: Colors.amber.shade200,
                elevation: 4,
                child: ExpansionTile(
                  initiallyExpanded: true,
                  controlAffinity: ListTileControlAffinity.leading,
                  childrenPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  expandedCrossAxisAlignment: CrossAxisAlignment.end,
                  maintainState: true,
                  title: Text(item['title']),
                  // contents
                  children: [
                    Text(item['content']),
                    // This button is used to remove this item
                    TextButton.icon(
                      onPressed: () => _removeItem(item['id']),
                      icon: const Icon(Icons.delete),
                      label: const Text(
                        'Remove',
                      ),
                      style: TextButton.styleFrom(foregroundColor: Colors.red),
                    )
                  ],
                ),
              );
            }));
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('KindaCode.com')),
      body: ListView.builder(
          itemCount: stateList.length + 1,
          itemBuilder: (_, index) {
            if (index == 0) {
              return Card(
                // this key is required to save and restore ExpansionTile expanded state
                color: Colors.amber.shade200,
                elevation: 4,
                child: Text(
                  "  ${stateList[index].state}",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              );
            } else {
              var districtsList = stateList[index - 1].districts;
              return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: districtsList.length,
                  itemBuilder: (_, indexL) {
                    return Container(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        "  ${districtsList[indexL]}",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    );
                  });
            }
          }),
    );
  }
}
