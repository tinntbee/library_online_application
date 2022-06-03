import 'package:flutter/material.dart';
import 'package:library_online_application/models/book_in_bookcase.dart';
import 'package:library_online_application/screens/reading-space/widgets/reading_space/reading_space.dart';

class BookInReadingSpaceItem extends StatelessWidget {
  final BookInBookcase book;
  const BookInReadingSpaceItem({Key? key, required this.book})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Color(0xFF26905B).withOpacity(0.08),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      clipBehavior: Clip.hardEdge,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ReadingSpace(bookId: book.book!.id)),
            );
          }, // Handle your onTap
          child: Ink(
              child: Container(
            width: double.infinity,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.network(book.book!.image ?? ""),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Text(
                        book.book!.name,
                        style: const TextStyle(
                            color: Color(0xFF6D6D6D),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        book.book!.author ?? "-",
                        style: const TextStyle(
                            color: Color(0xFF6D6D6D),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}
