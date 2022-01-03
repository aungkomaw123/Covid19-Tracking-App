class CovidSummaryOb {
  CovidSummaryOb({
    required this.ID,
    required this.Message,
    required this.global,
    required this.countries,
    required this.Date,
  });
  late final String ID;
  late final String Message;
  late final Global global;
  late final List<Countries> countries;
  late final String Date;

  CovidSummaryOb.fromJson(Map<String, dynamic> json) {
    ID = json['ID'];
    Message = json['Message'];
    global = Global.fromJson(json['Global']);
    countries =
        List.from(json['Countries']).map((e) => Countries.fromJson(e)).toList();
    Date = json['Date'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ID'] = ID;
    _data['Message'] = Message;
    _data['Global'] = global.toJson();
    _data['Countries'] = countries.map((e) => e.toJson()).toList();
    _data['Date'] = Date;
    return _data;
  }
}

class Global {
  Global({
    required this.NewConfirmed,
    required this.TotalConfirmed,
    required this.NewDeaths,
    required this.TotalDeaths,
    required this.NewRecovered,
    required this.TotalRecovered,
    required this.Date,
  });
  late final int NewConfirmed;
  late final int TotalConfirmed;
  late final int NewDeaths;
  late final int TotalDeaths;
  late final int NewRecovered;
  late final int TotalRecovered;
  late final String Date;

  Global.fromJson(Map<String, dynamic> json) {
    NewConfirmed = json['NewConfirmed'];
    TotalConfirmed = json['TotalConfirmed'];
    NewDeaths = json['NewDeaths'];
    TotalDeaths = json['TotalDeaths'];
    NewRecovered = json['NewRecovered'];
    TotalRecovered = json['TotalRecovered'];
    Date = json['Date'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['NewConfirmed'] = NewConfirmed;
    _data['TotalConfirmed'] = TotalConfirmed;
    _data['NewDeaths'] = NewDeaths;
    _data['TotalDeaths'] = TotalDeaths;
    _data['NewRecovered'] = NewRecovered;
    _data['TotalRecovered'] = TotalRecovered;
    _data['Date'] = Date;
    return _data;
  }
}

class Countries {
  Countries({
    required this.ID,
    required this.Country,
    required this.CountryCode,
    required this.Slug,
    required this.NewConfirmed,
    required this.TotalConfirmed,
    required this.NewDeaths,
    required this.TotalDeaths,
    required this.NewRecovered,
    required this.TotalRecovered,
    required this.Date,
  });
  late final String ID;
  late final String Country;
  late final String CountryCode;
  late final String Slug;
  late final int NewConfirmed;
  late final int TotalConfirmed;
  late final int NewDeaths;
  late final int TotalDeaths;
  late final int NewRecovered;
  late final int TotalRecovered;
  late final String Date;

  Countries.fromJson(Map<String, dynamic> json) {
    ID = json['ID'];
    Country = json['Country'];
    CountryCode = json['CountryCode'];
    Slug = json['Slug'];
    NewConfirmed = json['NewConfirmed'];
    TotalConfirmed = json['TotalConfirmed'];
    NewDeaths = json['NewDeaths'];
    TotalDeaths = json['TotalDeaths'];
    NewRecovered = json['NewRecovered'];
    TotalRecovered = json['TotalRecovered'];
    Date = json['Date'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ID'] = ID;
    _data['Country'] = Country;
    _data['CountryCode'] = CountryCode;
    _data['Slug'] = Slug;
    _data['NewConfirmed'] = NewConfirmed;
    _data['TotalConfirmed'] = TotalConfirmed;
    _data['NewDeaths'] = NewDeaths;
    _data['TotalDeaths'] = TotalDeaths;
    _data['NewRecovered'] = NewRecovered;
    _data['TotalRecovered'] = TotalRecovered;
    _data['Date'] = Date;
    return _data;
  }
}
