import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/view_model/search_list_viewmodel.dart';
import 'package:testapp/views/widgets/eventlist.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final key = new GlobalKey<ScaffoldState>();
  final TextEditingController _controller = TextEditingController();
  Widget appBarTitle = const Text(
    "Search Sample",
    style: TextStyle(color: Colors.white),
  );
  Icon actionIcon = const Icon(
    Icons.search,
    color: Colors.white,
  );
  late bool _IsSearching;
  String _searchText = "";

  @override
  void initState() {
    super.initState();
    Provider.of<SearchListViewModel>(context, listen: false)
        .fetchEvents("Texas");
//you can use anything you like or not use anything here. I call it just to have a content on the screen rather than having a blank screen
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<SearchListViewModel>(context);
    return Scaffold(
      key: key,
      appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade900,
          centerTitle: true,
          title: appBarTitle,
          actions: <Widget>[
            IconButton(
              icon: actionIcon,
              onPressed: () {
                setState(() {
                  if (actionIcon.icon == Icons.search) {
                    actionIcon = const Icon(
                      Icons.close,
                      color: Colors.white,
                    );
                    appBarTitle = TextField(
                      controller: _controller,
                      onSubmitted: (value) {
                        if (value.isNotEmpty) {
                          vm.fetchEvents(value);
                          // _controller.clear();
                        }
                      },
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search, color: Colors.white),
                          hintText: "Search...",
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.white)),
                    );
                    _handleSearchStart();
                  } else {
                    _handleSearchEnd();
                  }
                });
              },
            ),
          ]),
      body: Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Expanded(
                child: EventList(
                    events: vm.events)) //we will create this further down
          ],
        ),
      ),
    );
  }

  void _handleSearchStart() {
    setState(() {
      _IsSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.actionIcon = Icon(
        Icons.search,
        color: Colors.white,
      );
      this.appBarTitle = new Text(
        "Search Sample",
        style: new TextStyle(color: Colors.white),
      );
      _IsSearching = false;
      _controller.clear();
    });
  }
}
