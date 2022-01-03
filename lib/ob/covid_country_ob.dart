class CovidCountryOb {
  CovidCountryOb({
    required this.ID,
    required this.Country,
    required this.CountryCode,
    required this.Province,
    required this.City,
    required this.CityCode,
    required this.Lat,
    required this.Lon,
    required this.Confirmed,
    required this.Deaths,
    required this.Recovered,
    required this.Active,
    required this.Date,
  });
  late final String ID;
  late final String Country;
  late final String CountryCode;
  late final String Province;
  late final String City;
  late final String CityCode;
  late final String Lat;
  late final String Lon;
  late final int Confirmed;
  late final int Deaths;
  late final int Recovered;
  late final int Active;
  late final String Date;

  CovidCountryOb.fromJson(Map<String, dynamic> json) {
    ID = json['ID'];
    Country = json['Country'];
    CountryCode = json['CountryCode'];
    Province = json['Province'];
    City = json['City'];
    CityCode = json['CityCode'];
    Lat = json['Lat'];
    Lon = json['Lon'];
    Confirmed = json['Confirmed'];
    Deaths = json['Deaths'];
    Recovered = json['Recovered'];
    Active = json['Active'];
    Date = json['Date'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ID'] = ID;
    _data['Country'] = Country;
    _data['CountryCode'] = CountryCode;
    _data['Province'] = Province;
    _data['City'] = City;
    _data['CityCode'] = CityCode;
    _data['Lat'] = Lat;
    _data['Lon'] = Lon;
    _data['Confirmed'] = Confirmed;
    _data['Deaths'] = Deaths;
    _data['Recovered'] = Recovered;
    _data['Active'] = Active;
    _data['Date'] = Date;
    return _data;
  }
}
