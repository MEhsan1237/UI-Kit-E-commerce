import 'package:flutter/material.dart';

class PopularImageContainer extends StatelessWidget {
  final List<String> imagePath;
  final List<String> labels;
   // image ka size

  const PopularImageContainer({
    super.key,
    required this.imagePath,
    required this.labels,
     // default image size
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Images Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(imagePath.length, (index) {
            return InkWell(
              onTap: () {

              },
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFFFBE9E7),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Image.asset(
                    imagePath[index],
                    width:140,
                    height:40,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            );
          }),
        ),

        const SizedBox(height: 6),

        // Labels Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(labels.length, (index) {
            return Expanded(
              child: Text(
                labels[index],
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14),
                overflow: TextOverflow.ellipsis,
              ),
            );
          }),
        ),
      ],
    );
  }
}
