import 'dart:async';
import 'dart:convert';

import 'package:covid_tracker/ob/covid_country_ob.dart';
import 'package:covid_tracker/ob/response_ob.dart';
import 'package:covid_tracker/utils/app_constants.dart';
import 'package:http/http.dart' as http;

class SearchBloc {
  StreamController<ResponseOb> _searchController = StreamController();

  Stream<ResponseOb> getSearchStream() => _searchController.stream;

  getSearchData(String country, String from, String to) async {
    ResponseOb respOb = ResponseOb(msgState: MsgState.loading);
    _searchController.sink.add(respOb);

    var respose = await http.get(Uri.parse(
        "http://api.covid19api.com/country/$country?from=$from&to=$to"));
    // print(respose.body);

    if (respose.statusCode == 200) {
      List<CovidCountryOb> covidCountryList = [];
      List<dynamic> list = jsonDecode(respose.body);
      list.forEach((element) {
        covidCountryList.add(CovidCountryOb.fromJson(element));
      });

      respOb.data = covidCountryList;
      respOb.msgState = MsgState.data;
      _searchController.sink.add(respOb);
    } else if (respose.statusCode == 404) {
      print(country);
      print(from);
      print(to);
      respOb.data = null;
      respOb.msgState = MsgState.error;
      respOb.errState = ErrState.noFoundErr;
      _searchController.sink.add(respOb);
    } else if (respose.statusCode == 500) {
      respOb.data = null;
      respOb.msgState = MsgState.error;
      respOb.errState = ErrState.serverErr;
      _searchController.sink.add(respOb);
    } else {
      respOb.data = null;
      respOb.msgState = MsgState.error;
      respOb.errState = ErrState.unknownErr;
      _searchController.sink.add(respOb);
    }
  }

  void dispose() {
    _searchController.close();
  }
}
