
// List<Device> deviceList = [
//   Device(
//       ip: "192.168.0.1",
//       humidityA: 92,
//       humidity: 86,
//       isConnected: false,
//       name: 'Jardin',
//       temp: 66,
//       userId: 'Kennet', latest: null),
//   Device(
//       ip: "192.168.0.2",
//       humidityA: 92,
//       humidity: 86,
//       isConnected: true,
//       name: 'Jardin',
//       temp: 66,
//       userId: 'Kennet')
// ];
import 'dart:math';

import 'package:intl/intl.dart';

List<String> days = [
  'Lunes',
  'Martes',
  'Miércoles',
  'Jueves',
  'Viernes',
  'Sábado',
  'Domingo',
];

List<ReportsC> reports = [
  ReportsC.ramdom(),
  ReportsC.ramdom(),
  ReportsC.ramdom(),
  ReportsC.ramdom(),
  ReportsC.ramdom(),
  ReportsC.ramdom(),
  ReportsC.ramdom(),
  ReportsC.ramdom(),
  ReportsC.ramdom(),
  ReportsC.ramdom(),
  ReportsC.ramdom(),
  ReportsC.ramdom(),
  ReportsC.ramdom(),
];

class ReportsC {
  final double humidity;
  final double humidityA;
  final double temp;
  final bool isManual;
  final String day;
  final String fecha;
  ReportsC( {required this.temp, required this.humidity,  required this.humidityA,required  this.isManual, required this.day,required this.fecha});

  factory ReportsC.ramdom() => ReportsC(temp: Random().nextDouble() *40, humidity: Random().nextDouble()*100, humidityA: Random().nextDouble()*100, isManual: Random().nextBool(), day: days[Random().nextInt(days.length-1)], fecha: DateFormat.yMMMEd('es_MX').format(generarFechaAleatoria(fechaInicio, fechaFin)));
    
  
  
}

DateTime generarFechaAleatoria(DateTime fechaInicio, DateTime fechaFin) {
if (fechaInicio.isAfter(fechaFin)) {
    throw ArgumentError('La fecha de inicio debe ser anterior a la fecha de fin.');
  }

  // Calcular el rango en días
  int rangoEnDias = fechaFin.difference(fechaInicio).inDays;

  // Generar un valor aleatorio dentro del rango en días
  int diasAleatorios = Random().nextInt(rangoEnDias + 1);

  // Crear y retornar la fecha aleatoria sumando los días aleatorios al inicio del rango
  return fechaInicio.add(Duration(days: diasAleatorios));
}
DateTime fechaInicio = DateTime(2023, 5, 25);
  DateTime fechaFin = DateTime(2023, 7, 24);

List<String> months = [
  'enero',
  'febrero',
  'marzo',
  'abril',
  'mayo',
  'junio',
  'julio',
  'agosto',
  'septiembre',
  'octubre',
  'noviembre',
  'diciembre',
];

List<ReportsC> filtrarSeisDiasAnteriores(List<ReportsC> reports) {
  DateTime hoy = DateTime.now();

  // Filtramos la lista para obtener las fechas dentro de los últimos 6 días anteriores a la fecha actual
  List<ReportsC> fechasSeisDiasAnteriores = reports.where((report) {
    DateTime fecha = DateFormat.yMMMEd('es_MX').parse(report.fecha);
    return fecha.isAfter(hoy.subtract(const Duration(days: 6))) && fecha.isBefore(hoy);
  }).toList();

  return fechasSeisDiasAnteriores;
}