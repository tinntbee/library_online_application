import 'package:flutter/material.dart';
import 'package:library_online_application/screens/reading-space/widgets/reading_space/reading_space.dart';

class ReadingBookItem extends StatelessWidget {
  const ReadingBookItem({Key? key, required this.isActive}) : super(key: key);
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                spreadRadius: 0,
                color: Color.fromRGBO(0, 0, 0, 0.25),
                offset: Offset(0, 2),
                blurRadius: 16,
              )
            ],
          ),
          clipBehavior: Clip.hardEdge,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ReadingSpace()),
                );
              }, // Handle your onTap
              child: Ink(
                  child: Container(
                width: 254,
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Image.network(
                        "https://edit.org/images/cat/book-covers-big-2019101610.jpg",
                        height: 234,
                        width: 234,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Toi Thay Hoa Vang Tren Co Xanh",
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF6D6D6D),
                          height: 1.2),
                    ),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.bottomRight,
                      child: const Text(
                        "27-09-2000",
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFA4A4A4)),
                      ),
                    )
                  ],
                ),
              )),
            ),
          ),
        ),
        Positioned(
            top: 15,
            left: 15,
            child: AnimatedOpacity(
              opacity: isActive ? 1 : 0,
              duration: Duration(milliseconds: 400),
              child: AnimatedRotation(
                turns: isActive ? 0.5 : 0,
                duration: Duration(milliseconds: 600),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF).withOpacity(0.5),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(50))),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
