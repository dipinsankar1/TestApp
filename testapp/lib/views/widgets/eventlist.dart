import 'package:flutter/material.dart';
import 'package:testapp/view_model/search_view_model.dart';
import 'package:testapp/views/screens/detailscreen.dart';

class EventList extends StatelessWidget {
  final List<SearchViewModel> events;
  EventList({required this.events});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: this.events.length,
      separatorBuilder: (BuildContext context, int index) => Divider(height: 1),
      itemBuilder: (context, index) {
        final events = this.events[index];
        return ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailScreen(
                          eventData: events,
                        )));
          },
          contentPadding: EdgeInsets.all(10),
          leading: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(events.eventImages),
                ),
                borderRadius: BorderRadius.circular(9)),
            width: 50,
            height: 50,
          ),
          title: Text(
            events.title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  events.displayLocation,
                  style: const TextStyle(color: Colors.grey, fontSize: 12.0),
                ),
              ),
              const SizedBox(
                height: 1.0,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  events.displaydate,
                  style: const TextStyle(color: Colors.grey, fontSize: 12.0),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
