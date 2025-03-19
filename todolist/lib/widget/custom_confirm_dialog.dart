import 'package:flutter/material.dart';

Future<bool> customConfirmDialog(BuildContext context) async {
  return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: Text(
              "Xác nhận xóa?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            content: Text(
              "Bạn có chắc chắn muốn xóa mục này không?",
              style: TextStyle(fontSize: 16),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text("Hủy", style: TextStyle(color: Colors.red)),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () => Navigator.of(context).pop(true),
                child: Text("Xác nhận", style: TextStyle(color: Colors.white)),
              ),
            ],
          );
        },
      ) ??
      false; // Nếu người dùng đóng dialog bằng cách khác, trả về false
}
