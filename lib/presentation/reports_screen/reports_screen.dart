import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:watering_system/infrastructure/di/inject_config.dart';
import 'package:watering_system/presentation/utils/dummy.dart';
import 'package:watering_system/presentation/utils/resources/fonts.dart';
import 'package:watering_system/presentation/utils/resources/images.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  String selected = months[DateTime.now().month -1];
  String week = DateFormat.yMMMEd('es_MX').format(DateTime.now());
  bool isWeek = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 15, left: 5, right: 5),
            child: Column(
              children: [
                Fonts.normalMediumText("Reportes", size: 26),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Fonts.normalText("Mensual"),
                      SizedBox(
                        width: 60,
                        child: Switch(value: isWeek, onChanged: (value){
                          setState(() {
                            isWeek = value;
                          });
                        }),
                        
                      ),
                      Fonts.normalText("Semanal"),
                    ],
                  ),
                ),
               !isWeek ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Fonts.normalMediumText("Mes:  "),
                    DropdownButton<String>(
                        items: months
                            .map((e) => DropdownMenuItem<String>(
                                  value: e,
                                  child: Text(e.toUpperCase()),
                                ))
                            .toList(),
                        value: selected.isEmpty ? months.first : selected,
                        onChanged: (value) {
                          setState(() {
                            selected = value!;
                          });
                        }),
                  ],
                ): Fonts.normalText("Ultima Semana", size: 16),
                ...(isWeek 
                ?  filtrarSeisDiasAnteriores(reports):reports)
                    .where((element) => element.fecha
                        .contains(selected.isNotEmpty ? selected : ''))
                    .map((e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            shape: const StadiumBorder(
                                side: BorderSide(
                                    color: Colors.green, strokeAlign: 10)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Fonts.normalText(
                                      "Dia de riego: ${e.fecha}"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Fonts.normalText(
                                      "Riego: ${e.isManual ? 'Manual' : 'Automatico'}"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            getIt.get<Images>().humidity,
                                            fit: BoxFit.scaleDown,
                                            width: 16,
                                          ),
                                          Fonts.normalText(
                                              "${e.humidity.toStringAsFixed(2)}%",
                                              size: 14)
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            getIt.get<Images>().rain,
                                            fit: BoxFit.scaleDown,
                                            width: 16,
                                          ),
                                          Fonts.normalText(
                                              "${e.humidityA.toStringAsFixed(2)}%",
                                              size: 14)
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            getIt.get<Images>().temperature,
                                            fit: BoxFit.scaleDown,
                                            width: 16,
                                          ),
                                          Fonts.normalText(
                                              "${e.temp.toStringAsFixed(2)}°C",
                                              size: 14)
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ))
                    .toList()
              ],
            ),
          ),
        ));
  }
}
