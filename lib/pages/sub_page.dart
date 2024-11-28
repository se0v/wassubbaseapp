import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wassubapp/components/background_semicircles.dart';
import 'package:wassubapp/components/sub_tile.dart';

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
    return Scaffold(
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
                    padding: const EdgeInsets.only(top: 40),
                    child: GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Color.fromARGB(255, 94, 94, 94),
                        size: 28,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Text(
                      "Выберите подписку",
                      style: GoogleFonts.comfortaa(fontSize: 20),
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
                        TextButton(
                          onPressed: () {
                            setState(() {
                              selectedButton = "terms of use";
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: selectedButton == "terms of use"
                                  ? Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.1)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 10),
                            child: Text(
                              "terms of use",
                              style: GoogleFonts.comfortaa(
                                fontSize: 8,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              selectedButton = "policy privacy";
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: selectedButton == "policy privacy"
                                  ? Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.1)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 10),
                            child: Text(
                              "policy privacy",
                              style: GoogleFonts.comfortaa(
                                fontSize: 8,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              selectedButton = "Restore purchase";
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: selectedButton == "Restore purchase"
                                  ? Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.1)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 10),
                            child: Text(
                              "Restore purchase",
                              style: GoogleFonts.comfortaa(
                                fontSize: 8,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // BUTTON
          Positioned(
            bottom: 140,
            left: 40,
            right: 40,
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(36),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(255, 106, 102, 216),
                      Theme.of(context).colorScheme.primary
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(36),
                ),
                child: Center(
                  child: Text(
                    "Купить",
                    style: GoogleFonts.comfortaa(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
