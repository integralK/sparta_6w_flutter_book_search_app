import 'package:flutter/material.dart';
import 'package:flutter_book_search_app/data/model/book.dart';
import 'package:flutter_book_search_app/ui/detail/detail_page.dart';

class HomeBottomSheet extends StatelessWidget {
  HomeBottomSheet(this.book);
  Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      padding: EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 50),
      child: Row(
        children: [
          Image.network(
            book.image,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 20),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                book.title,
                maxLines: 2,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                book.author,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
              Text(
                book.description,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  // 누르면 디테일 페이지로 넘어가게 Navigator.push
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return DetailPage(book);
                    }),
                  ); // 옵션 쉬프트 F 누르면 후행콤마에서 자동정렬됨
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  // 컨테이너 위젯 내에서 차일드의 정렬을 할 수 있는 속성.
                  child: Text(
                    // Text 자체에만 onTap 터치이벤트가 먹기때문에 컨테이너로 감싸줘야 한다.
                    '자세히 보기',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
