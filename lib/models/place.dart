
class Place {
  String _name;

  Place(this._name);

  factory Place.fromJson(json) {
    return Place(json['name']);
  }


  get name => _name;
}