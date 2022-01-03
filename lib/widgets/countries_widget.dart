import 'package:covid_tracker/ob/covid_summary_ob.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CovidCountry extends StatelessWidget {
  var numberformat = NumberFormat(",###");
  Countries country;

  CovidCountry(this.country);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromRGBO(245, 238, 220, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              country.Country,
              style: TextStyle(
                color: Colors.lightGreen[700],
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              "Last Date: " +
                  DateFormat("EEEE, MMMM dd, yyyy, HH:MM").format(
                    DateTime.parse(country.Date),
                  ),
              style: const TextStyle(color: Colors.blue, fontSize: 15),
            ),
            const Divider(
              height: 10,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
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
                          numberformat.format(country.TotalConfirmed),
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
                                    text: numberformat
                                        .format(country.NewConfirmed),
                                    style: const TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ]),
                        ),
                      ],
                    ),
                  ),
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
                          numberformat.format(country.TotalRecovered),
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
                                    text: numberformat
                                        .format(country.NewRecovered),
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
                          numberformat.format(country.TotalDeaths),
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
                                    text:
                                        numberformat.format(country.NewDeaths),
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
            ),
          ],
        ),
      ),
    );
  }
}
