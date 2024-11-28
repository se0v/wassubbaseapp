import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return GestureDetector(
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
                  : const Color.fromRGBO(25, 25, 25, 1),
              borderRadius: BorderRadius.circular(32),
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
                        Icon(
                          widget.isSelected
                              ? Icons.check_circle
                              : Icons.circle_outlined,
                          color: widget.isSelected
                              ? Theme.of(context).colorScheme.primary
                              : Colors.white,
                        ),
                        const SizedBox(width: 16),

                        // Title + description
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.sub.title,
                              style: GoogleFonts.comfortaa(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              widget.sub.description,
                              style: GoogleFonts.comfortaa(
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
                          style: GoogleFonts.comfortaa(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        if (widget.originalPrice != null)
                          Text(
                            widget.originalPrice!,
                            style: GoogleFonts.comfortaa(
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
                                  style: GoogleFonts.comfortaa(
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
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "выгодно",
                  style: GoogleFonts.comfortaa(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
