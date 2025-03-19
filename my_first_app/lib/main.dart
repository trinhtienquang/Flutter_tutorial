// import 'book.dart';
// void main(List<String> args) {
//   // String name = "Tiến Quang";
//   // int age = 23;
//   // bool boolean = true;
//   // double number = 9.5;

//   // print(name);
//   // print(age);
//   // print(boolean);
//   // print(number);

//   // dynamic dynamicAll;
//   // var varAll; //khi chưa khai báo giá trị ban đầu var tương đương với dynamic, khi khai báo biến ban đầu (VD: một chuỗi) thì những biến gán lại sau bắt buộc phải là chuỗi

//   // List<String> name = ['Quang', 'Trường', 'Dung'];
//   // for(int i = 0; i < name.length; i++){
//   // print(name[i]);
//   // }

//   // Map<String, String> obj = {
//   //   'userName' : 'Tiến Quang',
//   //   'password' : '123456',
//   // };
//   // print(obj['password']);

//   // const TIME = 1;
//   // final TIME1 = 2; //Tương tự const

//   //hàm void là hàm không trả về giá trị (không dùng được return)
//   // void sum(int a, int b) {
//   //   print(a + b);
//   // }
//   // sum(3, 5);

//   var MyBook = Book('hihihi', 2025);

//   // print(MyBook._name)  //Lỗi vì _name là private
//   MyBook.showHello();
//   print(MyBook.getName);

//   MyBook.setName = "hehheeh";
//   print(MyBook.getName);

//   var YourBook = Book.bookNew('sách thời trang');
//   print(YourBook.year);

//   var newFunnyStories = funnyStories('Thỏ và rùa', 2010, "truyện cười");
//   print(newFunnyStories.type);
//   }

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomBox(content: 'box 1', alignment: Alignment.bottomRight),
                    CustomBox(content: 'box 2', alignment: Alignment.bottomLeft),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomBox(content: 'box 3', alignment: Alignment.topRight),
                    CustomBox(content: 'box 4', alignment: Alignment.topLeft),
                  ],
                ),
              ],
            ),
            Center(
              child: CustomBox(content: 'box 5', alignment: Alignment.center, boderRadius: 100),
            )
          ],
        ),
      ),
    );
  }
}

class CustomBox extends StatelessWidget {
  final String content;
  final Alignment alignment;
  final double boderRadius;
  const CustomBox({super.key, required this.content, required this.alignment, this.boderRadius = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(boderRadius),
        color: Colors.blue,
      ),
      child: Container(
        alignment: alignment,
        child: Text(
          content,
          textDirection: TextDirection.ltr,
          style: TextStyle(fontSize: 24, color: Colors.black87),
        ),
      ),
    );
  }
}
