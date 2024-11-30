import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wassubapp/components/background_semicircles.dart';
import 'package:wassubapp/components/sub_tile.dart';
import 'package:wassubapp/themes/default_mode.dart';

import '../models/sub.dart';

class SubPage extends StatefulWidget {
  const SubPage({super.key});

  @override
  State<SubPage> createState() => _SubPageState();
}

class _SubPageState extends State<SubPage> {
  final List<Sub> subs = [
    Sub(
      title: "1 месяц",
      description: "Описание",
      price: "1000р",
      features: ["что входит", "что входит"],
    ),
    Sub(
      title: "6 месяц",
      description: "Описание",
      price: "10 000р",
      features: [
        "что входит",
        "что входит",
        "что входит",
        "что входит",
        "что входит"
      ],
    ),
  ];

  int? selectedSubIndex;
  String selectedButton = "Restore purchase";

  // BUILD UI
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: darkMode,
        child: Scaffold(
          body: Stack(
            children: [
              // Body
              BackgroundSemicircles(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 80, left: 3),
                        child: GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            'assets/Vector.png',
                            width: 10,
                            height: 18,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Text(
                          "Выберите подписку",
                          style: GoogleFonts.montserratAlternates(
                              fontSize: 20,
                              // SHADOW PARTICLEs
                              shadows: [
                                Shadow(
                                  offset: const Offset(2, 4),
                                  blurRadius: 18,
                                  color: Colors.white.withOpacity(0.5),
                                )
                              ]),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          itemCount: subs.length,
                          itemBuilder: (context, index) {
                            return SubTile(
                              sub: subs[index],
                              isSelected: selectedSubIndex == index,
                              onSubTap: () {
                                setState(() {
                                  selectedSubIndex = index;
                                });
                              },
                              isSpecial: index == 1,
                              originalPrice: index == 1 ? "12000р" : null,
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 12),
                        ),
                      ),
                      // Bottom Row
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildBottomButton("terms of use"),
                            _buildBottomButton("policy privacy"),
                            _buildBottomButton("Restore purchase"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // BUTTON
              Positioned(
                bottom: 100,
                left: 40,
                right: 40,
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(29),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15.0,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).colorScheme.primary,
                          Theme.of(context).colorScheme.tertiary,
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: Center(
                      child: Text(
                        "Купить",
                        style: GoogleFonts.montserratAlternates(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  // Bottom BUTTONs
  Widget _buildBottomButton(String label) {
    return TextButton(
      onPressed: () {
        setState(() {
          selectedButton = label;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: selectedButton == label
              ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(29),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Text(
          label,
          style: GoogleFonts.montserratAlternates(
            fontSize: 8,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
