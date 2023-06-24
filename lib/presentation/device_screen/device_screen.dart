import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watering_system/domain/models/device.dart';
import 'package:watering_system/infrastructure/di/di.dart';
import 'package:watering_system/presentation/device_screen/cubit/device_screen_cubit.dart';
import 'package:watering_system/presentation/utils/utils.dart';

class DeviceScreen extends StatelessWidget {
  const DeviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DeviceScreenCubit cubit = context.read();
    return Scaffold(
      body: SizedBox(
        child: StreamBuilder(
          stream: cubit.useCase.userStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Card(
                      elevation: 2,
                      child: ListTile(
                        title: Fonts.normalMediumText(
                          snapshot.data!.docs[index].get("name"),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Fonts.normalText("Ip: ${item.ip}", size: 12),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      getIt.get<Images>().humidity,
                                      fit: BoxFit.scaleDown,
                                      width: 14,
                                    ),
                                    Fonts.normalText(
                                        "%${snapshot.data!.docs[index].get("humidity")}",
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
                                      width: 12,
                                    ),
                                    // Fonts.normalText("%${item.ambHumidity}",
                                    //     size: 11)
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
                                      width: 12,
                                    ),
                                    // Fonts.normalText("%${item.temp}", size: 11)
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        leading:
                            SvgPicture.asset(getIt.get<Images>().deviceIcon),
                        trailing: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.30,
                          child: Row(
                            children: [
                              // SvgPicture.asset(
                              //   item.isConnected
                              //       ? getIt.get<Images>().yesConnect
                              //       : getIt.get<Images>().noConnect,
                              //   width: 20,
                              // ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.edit_sharp,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.delete_forever,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            if (snapshot.hasError) {
              print(snapshot.error);
              return Center(
                child: SvgPicture.asset(getIt.get<Images>().sad),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return Center(
              child: SvgPicture.asset(
                getIt.get<Images>().sad,
                width: 150,
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
