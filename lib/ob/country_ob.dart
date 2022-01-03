class CountryOb {
  late final String country;
  late final String slug;
  late final String iSO2;

  CountryOb({required this.country, required this.slug, required this.iSO2});

  CountryOb.fromJson(Map<String, dynamic> json) {
    country = json['Country'];
    slug = json['Slug'];
    iSO2 = json['ISO2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Country'] = country;
    data['Slug'] = slug;
    data['ISO2'] = iSO2;
    return data;
  }
}
