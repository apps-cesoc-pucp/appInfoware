
import 'package:app_infoware/models/company.dart';

class Speaker {
  String _name;
  String _lastname;

  Company company;

  Speaker(this._name, this._lastname, this.company);

  factory Speaker.fromJson(json) {
    Company company = Company.fromJson(json['company']);
    return Speaker(json['name'], json['lastname'], company);
  }

  get name => _name;
  get lastname => _lastname;
  get fullname => _name + " " + _lastname;
}