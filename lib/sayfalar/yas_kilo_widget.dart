import 'package:flutter/material.dart';

class YasKiloWidget extends StatefulWidget {
  final Function(int) onChange;
  final String title;
  final int initValue;
  final int min;
  final int max;

  const YasKiloWidget({
    super.key,
    required this.onChange,
    required this.title,
    required this.initValue,
    required this.min,
    required this.max,
  });

  @override
  State<YasKiloWidget> createState() => _YasKiloWidgetState();
}

class _YasKiloWidgetState extends State<YasKiloWidget> {
  int sayac = 0;
  @override
  void initState() {
    super.initState();
    sayac = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 12,
        color: Colors.orange[800]!,
        shape: const RoundedRectangleBorder(),
        child: Column(
          children: [
            Text(
              widget.title,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                    child: const CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.black,
                      child: Icon(
                        Icons.remove,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        if (sayac < widget.min) {
                          sayac--;
                        }
                      });
                      widget.onChange(sayac);
                    },
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    sayac.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    child: const CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.black,
                      child: Icon(
                        Icons.add,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        if (sayac < widget.max) {
                          sayac++;
                        }
                      });
                      widget.onChange(sayac);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
