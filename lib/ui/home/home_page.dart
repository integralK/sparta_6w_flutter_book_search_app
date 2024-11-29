import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    // TextEditingController 사용시에는 반드시 dispose 호출해줘야 메모리에서 소거됨!
    textEditingController.dispose();
    super.dispose();
  }

  // 텍스트 입력 후 'done'을 눌렀을 때 검색될 수 있게 검색 함수를 만들어 준다.
  void onSearch(String text) {
    print('onSearch 호출됨');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // 화면의 빈 곳을 터치하면 키보드를 숨김
        // ios시뮬레이터 textfield 칸에 커서두고 커맨드K 누르면 키보드창 올라오지만,
        // 빈화면 다시 클릭해도 키보드 사라지지 않아서 이렇게 직접 Scaffold에 widget을 씌우고 작업해줘야함.
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () {
                onSearch(textEditingController.text);
              },
              // 버튼의 터치영역은 44 디바이스 픽셀 이상으로 해줘야함!! (UX)
              child: Container(
                width: 50,
                height: 50,
                // 컨테이너에 배경색이 없으면 자녀위젯에만 터치 이벤트가 적용됨
                color: Colors.transparent, //  투명한 색깔로 컨테이너를 설정
                child: Icon(Icons.search),
                // 검색 아이콘을 터치했을때 onSearch함수가 실행될 수 있게 GestureDetector로 감싸준다. Icon을 wrap with widget
              ),
            ),
          ],
          // AppBar에 TextField를 추가하여 검색 기능을 구현
          title: TextField(
            maxLines: 1, // TextField 속성
            onSubmitted: onSearch, // 'done' 버튼을 누르면 onSearch 함수가 호출됨
            controller: textEditingController,
            decoration: InputDecoration(
              hintText: "검색어를 입력해 주세요",
              border: MaterialStateOutlineInputBorder.resolveWith(
                (states) {
                  print(states);
                  if (states.contains(WidgetState.focused)) {
                    // 위에 states에 커맨드 누르고 마우스 대면 WidgetState인것 확인가능.
                    return OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      // 커서 찍으면(포커스 받았을때) 텍스트필드박스가 움찔움찔?!
                      borderSide: BorderSide(color: Colors.black),
                    );
                  }
                  return OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ); // 디폴트로 테두리가 있는 스타일로 적용
                },
              ),
            ),
          ),
        ),
        body: Text('HomePage'),
      ),
    );
  }
}
