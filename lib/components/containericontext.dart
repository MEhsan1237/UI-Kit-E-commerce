import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconRowWithLabels extends StatelessWidget {
  final List<dynamic> icons;
  final List<String> labels;
  final double iconSize; // new parameter for icon size

  const IconRowWithLabels({
    super.key,
    required this.icons,
    required this.labels,
    this.iconSize = 24, // default icon size
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Icons Row
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(icons.length, (index) {
              return InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 50, // container size stays the same
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFBE9E7),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: _buildIcon(icons[index], iconSize),
                  ),
                ),
              );
            }),
          ),
        ),

        const SizedBox(height: 6),

        // Labels Row
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(labels.length, (index) {
              return Expanded(
                child: Text(
                  labels[index],

                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildIcon(dynamic iconSource, double size) {
    if (iconSource is IconData) {
      return Icon(iconSource, size: size, color: Colors.indigo);
    } else if (iconSource is String) {
      if (iconSource.endsWith(".svg")) {
        return SvgPicture.asset(iconSource, width: size, height: size);
      } else {
        return Image.asset(iconSource, width: size, height: size);
      }
    }
    return const SizedBox.shrink();
  }
}
