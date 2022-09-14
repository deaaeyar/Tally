import 'package:flutter/material.dart';

class Components {
  static Container getContainer(text, screen, {bdr = true}) {
    return Container(
      height: 50,
      width: screen.width / 3,
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
      decoration: BoxDecoration(
          border: bdr
              ? Border.all(width: 1, color: Colors.grey)
              : const Border(
                  top: BorderSide(width: 1, color: Colors.grey),
                  bottom: BorderSide(width: 1, color: Colors.grey)),
          //borderRadius: BorderRadius.circular(10),
          color: Colors.deepPurple),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
