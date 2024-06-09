import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pretty_gauge/pretty_gauge.dart';

class SonucEkran extends StatelessWidget {
  final double vkiSonuc;
  final int yas;
  String? vkiDurumu;
  String? vkiYorum;
  Color? vkiDurumRenk;

  SonucEkran({super.key, required this.vkiSonuc, required this.yas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[800]!,
        centerTitle: true,
        title: const Text(
          "VKİ SONUÇ",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(12),
        child: Card(
          color: Colors.grey[700]!,
          elevation: 12,
          shape: const RoundedRectangleBorder(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Senin Sonucun",
                style: TextStyle(fontSize: 30, color: Colors.orange[800]!),
              ),
              const SizedBox(
                height: 10,
              ),
              PrettyGauge(
                gaugeSize: 300,
                minValue: 0,
                maxValue: 40,
                segments: [
                  GaugeSegment("Düşük Kilolu", 18.5, Colors.red),
                  GaugeSegment("normal Kilolu", 6.4, Colors.green),
                  GaugeSegment("fazla kilolu", 5, Colors.orange[800]!),
                  GaugeSegment("Obez", 10.1, Colors.pink),
                ],
                valueWidget: Text(
                  vkiSonuc.toStringAsFixed(1),
                  style: const TextStyle(fontSize: 40),
                ),
                currentValue: vkiSonuc.toDouble(),
                needleColor: Colors.orange[800]!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
