import 'package:covid_tracker/ob/covid_country_ob.dart';
import 'package:covid_tracker/ob/response_ob.dart';
import 'package:covid_tracker/pages/countries_page/country_page.dart';
import 'package:covid_tracker/pages/home_page/search_page/search_bloc.dart';
import 'package:covid_tracker/widgets/covid_country_date_widget.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _cityController = TextEditingController();
  String fromdate = "";
  String todate = "";
  String dateRange = "Select Date Range";
  final SearchBloc _searchBloc = SearchBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 238, 220, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(151, 191, 180, 1),
        title: const Text(
          "Search",
          style: TextStyle(
              color: Color.fromRGBO(245, 238, 220, 1),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //city
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const CountryPage();
                })).then((value) {
                  if (value != null) {
                    print(value);
                    _cityController.text = value.toString();
                  }
                });
              },
              child: TextFormField(
                controller: _cityController,
                enabled: false,
                decoration: const InputDecoration(
                    label: Text("Select City"),
                    labelStyle: TextStyle(
                      color: Colors.black,
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //date range
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                      width: 2, color: Color.fromRGBO(151, 191, 180, 1))),
              onPressed: () {
                showDateRangePicker(
                  context: context,
                  firstDate: DateTime(2020),
                  lastDate: DateTime.now(),
                ).then((value) {
                  if (value != null) {
                    setState(() {
                      fromdate = value.start.toString();
                      todate = value.end.toString();
                      dateRange = "From " +
                          value.start.toString().split(" ")[0] +
                          " to " +
                          value.end.toString().split(" ")[0];
                      print(value.start);
                      print(value.end);
                    });
                  }
                });
              },
              child: Text(
                dateRange,
                style: const TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //search button
            MaterialButton(
              color: const Color.fromRGBO(151, 191, 180, 1),
              onPressed: () {
                if (_cityController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                      "You need to select city",
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Color.fromRGBO(151, 191, 180, 1),
                  ));
                  return;
                }
                if (fromdate.isEmpty || todate.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                      "You need to select Start Data and End Date",
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Color.fromRGBO(151, 191, 180, 1),
                  ));
                  return;
                } else {
                  _searchBloc.getSearchData(
                      _cityController.text, fromdate, todate);
                }
              },
              child: const Text("Search"),
            ),
            //streambuilder for search data
            Expanded(
              child: StreamBuilder<ResponseOb>(
                stream: _searchBloc.getSearchStream(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    ResponseOb? respOb = snapshot.data;
                    if (respOb!.msgState == MsgState.loading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (respOb.msgState == MsgState.data) {
                      List<CovidCountryOb> cList = respOb.data;
                      return mainWidget(cList);
                    } else {
                      if (respOb.errState == ErrState.unknownErr) {
                        return const Text(
                          "Unknown Error",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        );
                      } else if (respOb.errState == ErrState.noFoundErr) {
                        return const Center(
                          child: Text("404 Not Found Error",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold)),
                        );
                      } else if (respOb.errState == ErrState.serverErr) {
                        return const Center(
                            child: Text("500 Server Error",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold)));
                      }
                    }
                    return const Text("");
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          width: 400,
                          height: 400,
                          child: Image.asset(
                            "images/img.jpg",
                            fit: BoxFit.fill,
                          ),
                        ),
                        const Text(
                          "You can search data by country and date",
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget mainWidget(List<CovidCountryOb> covidCountryList) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return CovidCountryDateWidget(covidCountryList[index]);
      },
      itemCount: covidCountryList.length,
    );
  }
}
