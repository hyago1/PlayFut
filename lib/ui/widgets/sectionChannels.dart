import 'package:flutter/material.dart';

import 'channelPlayer.dart';

class SectionChannels extends StatelessWidget {
  final String title;
  final List<Map<String, String>> items;
  
  const SectionChannels({super.key, required this.title, required this.items, required BuildContext context});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 15, bottom: 10),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        SizedBox(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChannelPlayer(id: item["id"]!),
                    ),
                  );
                },

                child: Container(
                  width: 250,
                  margin: EdgeInsets.only(left: 12),

                  decoration: BoxDecoration(
                    color:  Color(0xFF64C387),
                    borderRadius: BorderRadius.circular(12),

                    image: DecorationImage(
                      image:
                      NetworkImage(item["img"]!),
                      fit: BoxFit.contain,
                      onError: (_, __) {},
                    ),

                  ),

                  child: Container(
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.bottomLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Text(
                      item["name"]!,
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
    
  }
}



