import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wassubapp/themes/default_mode.dart';

import '../models/sub.dart';

class SubTile extends StatefulWidget {
  final Sub sub;
  final bool isSelected;
  final void Function()? onSubTap;
  final bool isSpecial;
  final String? originalPrice;

  const SubTile({
    super.key,
    required this.sub,
    required this.isSelected,
    required this.onSubTap,
    this.isSpecial = false,
    this.originalPrice,
  });

  @override
  State<SubTile> createState() => _SubTileState();
}

class _SubTileState extends State<SubTile> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: darkMode,
      child: GestureDetector(
        onTap: widget.onSubTap,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: widget.isSelected
                    ? Colors.transparent
                    : Theme.of(context).colorScheme.secondary.withOpacity(0.25),
                borderRadius: BorderRadius.circular(29),
                border: Border.all(
                  color: widget.isSelected ? Colors.white : Colors.transparent,
                ),
              ),
              // Column
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Content
                      Row(
                        children: [
                          Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: widget.isSelected
                                  ? LinearGradient(
                                      colors: [
                                        Theme.of(context).colorScheme.primary,
                                        Theme.of(context).colorScheme.tertiary,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    )
                                  : null,
                              border: widget.isSelected
                                  ? null
                                  : Border.all(
                                      color: Colors.white,
                                      width: 1,
                                    ),
                              color:
                                  widget.isSelected ? null : Colors.transparent,
                            ),
                            child: Center(
                              child: widget.isSelected
                                  ? Image.asset(
                                      'assets/Vector 1.png',
                                      width: 14,
                                      height: 11,
                                    )
                                  : const SizedBox.shrink(),
                            ),
                          ),
                          const SizedBox(width: 16),

                          // Title + description
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.sub.title,
                                style: GoogleFonts.montserratAlternates(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                widget.sub.description,
                                style: GoogleFonts.montserratAlternates(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      // Price
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.sub.price,
                            style: GoogleFonts.montserratAlternates(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          if (widget.originalPrice != null)
                            Text(
                              widget.originalPrice!,
                              style: GoogleFonts.montserratAlternates(
                                fontSize: 12,
                                color: Colors.white70,
                                decoration: TextDecoration.lineThrough,
                              ),
                            )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Features
                  if (widget.isSelected)
                    Padding(
                      padding: const EdgeInsets.only(left: 6.0, top: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: widget.sub.features.map((feature) {
                          return Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                children: [
                                  const Icon(Icons.circle,
                                      size: 8, color: Colors.white),
                                  const SizedBox(width: 14),
                                  Text(
                                    feature,
                                    style: GoogleFonts.montserratAlternates(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ));
                        }).toList(),
                      ),
                    )
                ],
              ),
            ),

            // Special badge
            if (widget.isSpecial)
              Positioned(
                top: -10,
                right: 14,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Text(
                    "выгодно",
                    style: GoogleFonts.montserratAlternates(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
