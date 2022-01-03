import 'package:covid_tracker/ob/country_ob.dart';
import 'package:covid_tracker/ob/response_ob.dart';
import 'package:covid_tracker/pages/countries_page/country_bloc.dart';
import 'package:flutter/material.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({Key? key}) : super(key: key);

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  CountryBloc _bloc = CountryBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc.getCountryData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(151, 191, 180, 1),
        title: const Text("Select Country"),
        centerTitle: true,
      ),
      body: StreamBuilder<ResponseOb>(
        stream: _bloc.getCountryStream(),
        initialData: ResponseOb(msgState: MsgState.loading),
        builder: (BuildContext context, AsyncSnapshot<ResponseOb> snapshot) {
          ResponseOb? respOb = snapshot.data;
          if (respOb!.msgState == MsgState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (respOb.msgState == MsgState.data) {
            List<CountryOb> cList = respOb.data;
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
        },
      ),
    );
  }

  Widget mainWidget(List<CountryOb> cList) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Card(
            color: const Color.fromRGBO(245, 238, 220, 1),
            child: ListTile(
              onTap: () {
                Navigator.of(context).pop(cList[index].slug);
              },
              leading: const Icon(Icons.location_city),
              title: Text(cList[index].country.toString()),
              trailing: const Icon(Icons.arrow_right),
            ),
          ),
        );
      },
      itemCount: cList.length,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _bloc.dipose();
    super.dispose();
  }
}
