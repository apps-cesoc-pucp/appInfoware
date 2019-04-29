
import 'dart:convert';

import 'package:app_infoware/models/event.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

Future<List<Event>> getEvents() async {
  
  var res = await http.get("https://infoware-pucp.herokuapp.com/infoware/api/events");
  var eventsJson = json.decode(res.body);

  if (res.statusCode != 200) return [];

  List<Event> events = [];
  for (var ejson in eventsJson) events.add(Event.fromJson(ejson));
  return events;
}