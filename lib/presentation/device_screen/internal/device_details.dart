import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watering_system/domain/models/device.dart';
import 'package:watering_system/infrastructure/di/di.dart';
import 'package:watering_system/presentation/utils/utils.dart';

class DeviceDetails extends StatelessWidget {
  const DeviceDetails({super.key, required this.ref});
  // final Device device;
  final DocumentReference ref;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.doc(ref.path).snapshots(),
        builder: (context, snapshot) {
          final Device device = Device.fromMap(snapshot.data!.data()!);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.appIconBlue,
              title: Fonts.normalMediumText("Detalles del dispositivo"),
              centerTitle: true,
            ),
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 50.0, horizontal: 8),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SvgPicture.asset(
                      getIt.get<Images>().devices,
                      width: 64,
                      colorFilter: ColorFilter.mode(
                          device.isActive ? AppColors.darkGreen : Colors.grey,
                          BlendMode.srcIn),
                    ),
                    Fonts.normalMediumText(device.name, size: 20),
                    const SizedBox(
                      height: 5,
                    ),
                    Fonts.normalMediumText("Ultima conexión: ${device.latest}",
                        size: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40.0),
                      child: Row(
                        children: [
                          //left
                          Column(
                            children: [
                              Fonts.normalMediumText(
                                "Encendido",
                                size: 20,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Fonts.normalMediumText("Modo Manual", size: 20),
                              const SizedBox(
                                height: 26,
                              ),
                              Fonts.normalMediumText("Estado", size: 20),
                              const SizedBox(
                                height: 20,
                              ),
                              Fonts.normalMediumText("IP", size: 20),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width *
                                          0.17)),
                          Column(
                            children: [
                              Switch(
                                  value: device.isActive,
                                  onChanged: (value) async {
                                    FirebaseFirestore.instance
                                        .doc(ref.path)
                                        .update({"isActive": value});
                                  }),
                              const SizedBox(
                                height: 10,
                              ),
                              Switch(
                                  value: device.isManual,
                                  onChanged: (value) async {
                                    FirebaseFirestore.instance
                                        .doc(ref.path)
                                        .update({"isManual": value});
                                  }),
                              const SizedBox(
                                height: 10,
                              ),
                              Fonts.normalMediumText(
                                  device.watering ? "Regando" : "En espera",
                                  size: 20,
                                  fontStyle: FontStyle.italic),
                              const SizedBox(
                                height: 20,
                              ),
                              Fonts.normalMediumText(device.ip, size: 20),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        if (!device.isManual) {
                          return;
                        }
                        FirebaseFirestore.instance
                            .doc(ref.path)
                            .update({"watering": !device.watering});
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            decoration: BoxDecoration(
                                color: device.isManual
                                    ? device.watering
                                        ? AppColors.darkGreen
                                        : Colors.red
                                    : Colors.grey,
                                shape: BoxShape.circle),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * 0.08),
                            child: Center(
                              child: Fonts.normalText(
                                  device.isManual
                                      ? device.watering
                                          ? "Regando"
                                          : "Regar"
                                      : "Para poder regar, \n activa el modo \n manual",
                                  size: device.isManual ? 20 : 16,
                                  textAlign: TextAlign.center,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
