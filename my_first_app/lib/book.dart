class Book {
  //khai báo thuộc tính
  late String _name; //đặt biến có "_": biến private không gợi ý ra bên ngoài
  late int year;
  static int age = 5; //không phải cấp độ object, mà là cấp độ class VD: gọi tới age Book.age

  //Khai báo hàm khởi tạo (constructor)
  Book(this._name, this.year); //cách 1: generate contructor: dạng phố biến của hàm khởi tạo

  Book.bookNew(String name) { //cách 2: name contructor: đặt tên cụ thể cho hàm khởi tạo
    _name = name;
     year = 2022;
  }

  //khai báo các phương thức

  String get getName => _name;

  set setName(String name) {
    _name = name;
  }

  void showHello(){
    print('Xin chào $_name');
  }
}

class funnyStories extends Book {
  late String type;
  funnyStories(super.name, super.year, this.type);
}