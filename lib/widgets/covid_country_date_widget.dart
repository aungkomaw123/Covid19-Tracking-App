import 'package:covid_tracker/ob/covid_country_ob.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CovidCountryDateWidget extends StatelessWidget {
  CovidCountryOb covidcob;

  CovidCountryDateWidget(this.covidcob);
  @override
  Widget build(BuildContext context) {
    // return Card(
    //   color: const Color.fromRGBO(205, 222, 255, 1),
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(10),
    //   ),
    //   child: Padding(
    //     padding:
    //         const EdgeInsets.only(left: 8.0, right: 8.0, top: 13, bottom: 13),
    //     child: Column(
    //       children: [
    //         Text(
    //           covidcob.Country,
    //           style: TextStyle(
    //             color: Colors.lightGreen[700],
    //             fontWeight: FontWeight.bold,
    //             fontSize: 20,
    //           ),
    //         ),
    //         Text(
    //           "Last Date: " +
    //               DateFormat("EEEE, MMMM dd, yyyy, HH:MM").format(
    //                 DateTime.parse(covidcob.Date),
    //               ),
    //           style: const TextStyle(color: Colors.blue, fontSize: 15),
    //         ),
    //         const Divider(
    //           height: 10,
    //           color: Colors.black,
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.only(top: 5),
    //           child: Row(
    //             children: [
    //               //Confirm sa yinn
    //               Expanded(
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     const Text(
    //                       "Confirm",
    //                       style: TextStyle(
    //                         color: Colors.black,
    //                         fontWeight: FontWeight.bold,
    //                         fontSize: 15,
    //                       ),
    //                     ),
    //                     const SizedBox(
    //                       height: 8,
    //                     ),
    //                     Text(
    //                       covidcob.Confirmed.toString(),
    //                       style: const TextStyle(
    //                         color: Colors.blue,
    //                         fontSize: 18,
    //                         fontWeight: FontWeight.bold,
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               //Recovered
    //               Expanded(
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     const Text(
    //                       "Recovered",
    //                       style: TextStyle(
    //                         color: Colors.black,
    //                         fontWeight: FontWeight.bold,
    //                         fontSize: 15,
    //                       ),
    //                     ),
    //                     const SizedBox(
    //                       height: 8,
    //                     ),
    //                     Text(
    //                       covidcob.Recovered.toString(),
    //                       style: const TextStyle(
    //                         color: Colors.green,
    //                         fontSize: 18,
    //                         fontWeight: FontWeight.bold,
    //                       ),
    //                     ),
    //                     const SizedBox(
    //                       height: 5,
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               //Death
    //               Expanded(
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     const Text(
    //                       "Deaths",
    //                       style: TextStyle(
    //                         color: Colors.black,
    //                         fontWeight: FontWeight.bold,
    //                         fontSize: 15,
    //                       ),
    //                     ),
    //                     const SizedBox(
    //                       height: 8,
    //                     ),
    //                     Text(
    //                       covidcob.Deaths.toString(),
    //                       style: const TextStyle(
    //                         color: Colors.red,
    //                         fontSize: 18,
    //                         fontWeight: FontWeight.bold,
    //                       ),
    //                     ),
    //                     const SizedBox(
    //                       height: 5,
    //                     ),
    //                   ],
    //                 ),
    //               )
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );

    return Card(
      color: const Color.fromRGBO(151, 191, 180, 1),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: const Color.fromRGBO(243, 200, 146, 1),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "Confirmed",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(covidcob.Confirmed.toString()),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: const Color.fromRGBO(178, 234, 112, 1),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "Active",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(covidcob.Active.toString()),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: const Color.fromRGBO(222, 237, 240, 1),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "Recovered",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(covidcob.Recovered.toString()),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: const Color.fromRGBO(225, 120, 120, 1),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "Deaths",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(covidcob.Deaths.toString()),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
