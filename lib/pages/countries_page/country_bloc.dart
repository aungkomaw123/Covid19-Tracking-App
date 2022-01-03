import 'dart:async';
import 'dart:convert';

import 'package:covid_tracker/ob/country_ob.dart';
import 'package:covid_tracker/ob/response_ob.dart';
import 'package:covid_tracker/utils/app_constants.dart';
import 'package:http/http.dart' as http;

class CountryBloc {
  final StreamController<ResponseOb> _controller =
      StreamController<ResponseOb>();

  Stream<ResponseOb> getCountryStream() => _controller.stream;

  getCountryData() async {
    ResponseOb respOb = ResponseOb(msgState: MsgState.loading);
    _controller.sink.add(respOb);

    var respose = await http.get(Uri.parse(COUNTRY_URL));
    // print(respose.body);

    if (respose.statusCode == 200) {
      List<CountryOb> countryList = [];
      List<dynamic> list = jsonDecode(respose.body);
      list.forEach((element) {
        countryList.add(CountryOb.fromJson(element));
      });

      respOb.data = countryList;
      respOb.msgState = MsgState.data;
      _controller.sink.add(respOb);
    } else if (respose.statusCode == 404) {
      respOb.data = null;
      respOb.msgState = MsgState.error;
      respOb.errState = ErrState.noFoundErr;
      _controller.sink.add(respOb);
    } else if (respose.statusCode == 500) {
      respOb.data = null;
      respOb.msgState = MsgState.error;
      respOb.errState = ErrState.serverErr;
      _controller.sink.add(respOb);
    } else {
      respOb.data = null;
      respOb.msgState = MsgState.error;
      respOb.errState = ErrState.unknownErr;
      _controller.sink.add(respOb);
    }
  }

  dipose() {
    _controller.close();
  }
}
