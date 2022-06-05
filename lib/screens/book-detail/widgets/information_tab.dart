import 'package:flutter/material.dart';
import 'package:library_online_application/icons/bee_app_icons.dart';
import 'package:library_online_application/models/tag.dart';
import 'package:flutter_html/flutter_html.dart';

class InformationTab extends StatelessWidget {
  final List<Tag> tags;
  final String description;
  const InformationTab(
      {Key? key, required this.tags, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          tagsList(),
          const SizedBox(
            height: 10,
          ),
          information()
        ],
      ),
    );
  }

  Widget tagsList() {
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          const Icon(
            BeeAppIcons.number_symbol,
            size: 18,
            color: Color(0xFF6D6D6D),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            width: double.infinity,
            height: 25,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: tags
                  .map((e) => Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(3),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xFF6D6D6D)),
                        child: Text(
                          e.name ?? "-",
                          style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic,
                              color: Colors.white),
                        ),
                      ))
                  .toList(),
            ),
          ))
        ],
      ),
    );
  }

  Widget information() {
    return SizedBox(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              const Icon(
                BeeAppIcons.quote,
                size: 11,
                color: Color(0xFFA4A4A4),
              ),
              Container(
                width: 2,
                height: 63,
                color: Color(0xFFA4A4A4),
              )
            ],
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
              child: SizedBox(
            width: double.infinity,
            child: Html(
              data: description,
              style: <String, Style>{"p": Style(color: Color(0xFF6D6D6D))},
            ),
          ))
        ],
      ),
    );
  }
}
