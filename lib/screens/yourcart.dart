import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:e_ui_comm_kit/global_cart.dart';

class YourCartScreen extends StatefulWidget {
  const YourCartScreen({super.key});

  @override
  State<YourCartScreen> createState() => _YourCartScreenState();
}

class _YourCartScreenState extends State<YourCartScreen> {
  double get totalAmount =>
      globalCart.fold(0, (sum, item) => sum + item.price * item.quantity);

  int get totalItems => globalCart.fold(0, (sum, item) => sum + item.quantity);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset("assets/icons/back_icon.svg"),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Your Cart"),
            Text(
              "$totalItems item${totalItems > 1 ? 's' : ''}",
              style: const TextStyle(fontSize: 12, color: Colors.white70),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: globalCart.length,
                itemBuilder: (context, index) {
                  final item = globalCart[index];
                  return

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image.asset(item.image, width: 70, height: 70),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.label,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "\$${(item.price * item.quantity)
                                    .toStringAsFixed(2)}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                    PopupMenuButton(
                      child: Icon(Icons.more_vert),
                      onSelected: (value) {
                        if (value == "delete") {
                          setState(() {
                            globalCart.removeAt(index);
                          });
                        }
                      },
                      itemBuilder: (context) =>
                      [
                        PopupMenuItem(
                        value: "delete",

                          child: ListTile(leading: Icon(Icons.delete),
                          title: Text("delete"),),),
                        PopupMenuItem(

                          child: ListTile(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            leading: Icon(Icons.delete),
                            title: Text("cancel"),),),



                      ],)
                      ],

                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    "assets/icons/receipt.svg",
                    width: 24,
                    height: 24,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Add voucher code >",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Total",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "\$${totalAmount.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrangeAccent,
                    ),
                    child: const Text(
                      "Check Out",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
