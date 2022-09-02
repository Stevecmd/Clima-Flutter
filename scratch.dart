import 'dart:io';

void main() {
  performTasks();
}

void performTasks()  {
  task1();
  task2();
  task3();
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

void task2()  {
  Duration fourSeconds = Duration(seconds: 4);
  Future.delayed(fourSeconds, (){ //Creating an asynchronous method
    String result = 'task 2 data';
    print('Task 2 complete');
  });

  // sleep(fourSeconds);
  // String result = 'task 2 data';
  // print('Task 2 complete');
}

void task3() {
  String result = 'task 3 data';
  print('Task 3 complete');
}