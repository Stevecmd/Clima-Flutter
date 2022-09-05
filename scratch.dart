import 'dart:io';

void main() {
  performTasks();
}

void performTasks()  async {
  task1();
  String task2Result = await task2();
  task3(task2Result);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String> task2()  async{    //You may or not use <String> but the <datatype> indicate that we are expecting a Future input
  Duration fourSeconds = Duration(seconds: 4);
  String result;

  await Future.delayed(fourSeconds, (){ //Creating an asynchronous method
    result = 'task 2 data';
    print('Task 2 complete');
  });

  return result;

  // sleep(fourSeconds);
  // String result = 'task 2 data';
  // print('Task 2 complete');
}

void task3(String task2Data) {
  String result = 'task 3 data';
  print('Task 3 complete with $task2Data');
}

// Not used in the project but is a good reference for async and await