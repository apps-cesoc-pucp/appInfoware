
import 'package:app_infoware/models/place.dart';
import 'package:app_infoware/models/speaker.dart';

class Event {
  
  String _name;
  String _url;
  Speaker speaker;
  Place place;

  Event(this._name, this._url, this.speaker, this.place);

  get name => _name;
  get url => _url;

  factory Event.fromJson(json) {
    Speaker speaker = Speaker.fromJson(json['speaker']);
    Place place = Place.fromJson(json['place']);
    
    return Event(json['name'], json['url'], speaker, place);
  }
}