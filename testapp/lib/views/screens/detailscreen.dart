import 'package:flutter/material.dart';
import 'package:testapp/view_model/search_view_model.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({required this.eventData});

  final SearchViewModel eventData;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
//              title: Text("hello"),
            iconTheme: const IconThemeData(
              color: Colors.black, //change your color here
            ),
            expandedHeight: 120,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.eventData.title,
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: false,
              collapseMode: CollapseMode.parallax,
              background: Container(
                color: Colors.white,
                constraints: BoxConstraints.expand(height: 100),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Divider(
                      height: 1.0,
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: 250,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  NetworkImage(widget.eventData.eventImages)),
                          borderRadius: BorderRadius.circular(2)),
                    ),
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          widget.eventData.displaydate,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                      )),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        widget.eventData.displayLocation,
                        style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),
                    ),
                  )
                ],
              ),
            ]),
          )
        ],
      ),
    );
  }
}
