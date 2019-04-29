
class Company {
  String _name;

  Company(this._name);

  factory Company.fromJson(json) {
    return Company(json['name']);
  }

  get name => _name;
}