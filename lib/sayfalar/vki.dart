import 'dart:math';

import 'package:fitly/sayfalar/boy_widget.dart';
import 'package:fitly/sayfalar/cinsiyet_widget.dart';
import 'package:fitly/sayfalar/sonuc_ekran.dart';
import 'package:fitly/sayfalar/yas_kilo_widget.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class VkiSayfasi extends StatefulWidget {
  const VkiSayfasi({super.key});

  @override
  State<VkiSayfasi> createState() => _VkiSayfasiState();
}

class _VkiSayfasiState extends State<VkiSayfasi> {
  int _cinsiyet = 0;
  int _boy = 150;
  int _yas = 30;
  int _kilo = 50;
  bool _bitti = false;
  double _vkisonuc = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Card(
            color: Colors.orange[800]!,
            elevation: 12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                // Cinsiyet seçimi
                CinsiyetWidget(
                  onChange: (cinsiyetVal) {
                    setState(() {
                      _cinsiyet = cinsiyetVal;
                    });
                  },
                ),
                BoyWidget(
                  onChange: (boyVal) {
                    setState(() {
                      _boy = boyVal;
                    });
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    YasKiloWidget(
                      onChange: (yasVal) {
                        setState(() {
                          _yas = yasVal;
                        });
                      },
                      initValue: 30,
                      max: 100,
                      min: 0,
                      title: 'Yaş',
                    ),
                    YasKiloWidget(
                      onChange: (kiloVal) {
                        setState(() {
                          _kilo = kiloVal;
                        });
                      },
                      initValue: 50,
                      max: 200,
                      min: 0,
                      title: 'Kilo',
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: SwipeableButtonView(
                      isFinished: _bitti,
                      onFinish: () async {
                        await Navigator.push(
                            context,
                            PageTransition(
                                child:
                                    SonucEkran(vkiSonuc: _vkisonuc, yas: _yas),
                                type: PageTransitionType.fade));
                        setState(() {
                          _bitti = false;
                        });
                      },
                      onWaitingProcess: () {
                        vkihesapla();

                        Future.delayed(const Duration(seconds: 1), () {
                          setState(() {
                            _bitti = true;
                          });
                        });
                      },
                      activeColor: Colors.black,
                      buttonWidget: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.black,
                      ),
                      buttonText: "HESAPLA"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  vkihesapla() {
    _vkisonuc = _kilo / pow(_boy / 100, 2);
  }
}
