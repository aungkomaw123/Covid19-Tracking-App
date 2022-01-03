import 'package:covid_tracker/ob/covid_summary_ob.dart';
import 'package:covid_tracker/ob/response_ob.dart';
import 'package:covid_tracker/pages/home_page/home_bloc.dart';
import 'package:covid_tracker/pages/home_page/search_page/search_page.dart';
import 'package:covid_tracker/widgets/countries_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _numberformat = NumberFormat(",###");
  final _bloc = HomeBloc();

  @override
  void initState() {
    super.initState();

    _bloc.getCovidSummaryData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(151, 191, 180, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(151, 191, 180, 1),
        centerTitle: true,
        title: const Text(
          "Covid 19 Tracker",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(245, 238, 220, 1),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return SearchPage();
                }));
              },
              icon: const Icon(Icons.search_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: StreamBuilder<ResponseOb>(
          initialData: ResponseOb(msgState: MsgState.loading),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            ResponseOb respOb = snapshot.data;
            if (respOb.msgState == MsgState.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (respOb.msgState == MsgState.data) {
              CovidSummaryOb cob = respOb.data;
              return mainWidget(cob);
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
          },
          stream: _bloc.getCovidSummaryStream(),
        ),
      ),
    );
  }

  Widget mainWidget(CovidSummaryOb cob) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //summary
        Card(
          color: const Color.fromRGBO(245, 238, 220, 1),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(
                  "Update date: " +
                      DateFormat("EEEE, MMMM dd, yyyy, HH:MM")
                          .format(DateTime.parse(cob.Date)),
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Confirm sa yinn
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Total\nConfirm",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            _numberformat.format(cob.global.TotalConfirmed),
                            style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          RichText(
                            text: TextSpan(
                                text: "New:",
                                style: const TextStyle(
                                  color: Colors.black38,
                                ),
                                children: [
                                  TextSpan(
                                      text: _numberformat
                                          .format(cob.global.NewConfirmed),
                                      style: const TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ]),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 5),
                    //Recovered
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Total\nRecovered",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            _numberformat.format(cob.global.TotalRecovered),
                            style: const TextStyle(
                              color: Colors.green,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          RichText(
                            text: TextSpan(
                                text: "New: ",
                                style: const TextStyle(
                                  color: Colors.black38,
                                ),
                                children: [
                                  TextSpan(
                                      text: _numberformat
                                          .format(cob.global.NewRecovered),
                                      style: const TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ]),
                          ),
                        ],
                      ),
                    ),
                    //Death
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Total\nDeaths",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            _numberformat.format(cob.global.TotalDeaths),
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          RichText(
                            text: TextSpan(
                                text: "New:",
                                style: const TextStyle(
                                  color: Colors.black38,
                                ),
                                children: [
                                  TextSpan(
                                      text: _numberformat
                                          .format(cob.global.NewDeaths),
                                      style: const TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ]),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        // Country
        const Text(
          "Countries",
          style: TextStyle(
              color: Color.fromRGBO(245, 238, 220, 1),
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return CovidCountry(cob.countries[index]);
            },
            itemCount: cob.countries.length,
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _bloc.dipose();
    super.dispose();
  }
}
