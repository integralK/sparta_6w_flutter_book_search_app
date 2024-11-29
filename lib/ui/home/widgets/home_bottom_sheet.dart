import 'package:flutter/material.dart';
import 'package:flutter_book_search_app/ui/detail/detail_page.dart';

class HomeBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      padding: EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 50),
      child: Row(
        children: [
          Image.network(
            'https://picsum.photos/200/300',
            fit: BoxFit.cover,
          ),
          SizedBox(width: 20),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Harry Potter and the Philosopher's Stone",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                'J.K.롤링',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                '새로운 분위기의 표지와 폰트 등으로 재발간된 영국판 Bloomsbury 해리포터 시리즈 탄생!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
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
                      return DetailPage();
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
