import 'package:flutter/material.dart';

class IconRowWithLabels extends StatelessWidget {
  final List<IconData> icons;
  final List<String> labels;

  const IconRowWithLabels({
    super.key,
    required this.icons,
    required this.labels,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row of containers with icons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(5, (index) {
            return Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: (){},
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: 		Color(0xFFFBE9E7),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icons[index], size: 30, color: Colors.indigo),
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 8),
        // Row of labels under each container
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(5, (index) {
            return SizedBox(
              width: 60,
              child: Text(
                labels[index],
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12),
              ),
            );
          }),
        ),
      ],
    );
  }
}
