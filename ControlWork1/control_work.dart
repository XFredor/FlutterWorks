void main() {
  print('Задание 1');
  checkAge(15);
  checkAge(5);
  checkAge(30);

  print('Задание 2');
  showEvenNumbers();

  print('Задание 3 ');
  findStudent('Азамат');
  findStudent('Иван');

  print('Задание 4 ');
  calculateSalary(170, 200);
  calculateSalary(160, 250);

  print('Задание 5');
  countNumbers();
}

// Задание 1
void checkAge(int age) {
  if (age < 7) {
    print('Дошкольник');
  } else if (age <= 17) {
    print('Школьник');
  } else {
    print('Взрослый');
  }
}

// Задание 2
void showEvenNumbers() {
  List<int> numbers = [12, 7, 4, 9, 16, 3, 8];
  List<int> evenNumbers = [];
  int evenSum = 0;

  for (int i = 0; i < numbers.length; i++) {
    if (numbers[i] % 2 == 0) {
      evenNumbers.add(numbers[i]);
      evenSum += numbers[i];
    } else {
      continue;
    }
  }

  print('Чётные числа: $evenNumbers');
  print('Сумма: $evenSum');
}

// Задание 3
List<String> students = ['Алина', 'Руслан', 'Азамат', 'Мария', 'Данияр'];

void findStudent(String name) {
  bool isFound = false;

  for (int i = 0; i < students.length; i++) {
    if (students[i] == name) {
      print('Студент: ${students[i]}');
      print('Индекс: $i');
      isFound = true;
      break;
    }
  }

  if (!isFound) {
    print('Студент не найден');
  }
}

// Задание 4
void calculateSalary(int hours, int hourlyRate) {
  int baseSalary = hours * hourlyRate;
  int bonus;

  if (hours > 160) {
    bonus = 2000;
  } else {
    bonus = 0;
  }

  int totalSalary = baseSalary + bonus;

  print('Основная зарплата: $baseSalary сом');
  print('Премия: $bonus сом');
  print('Итого: $totalSalary сом');
}

// Задание 5
void countNumbers() {
  List<int> numbers = [5, -3, 8, -1, 0, 12, -7];
  int positiveCount = 0;
  int negativeCount = 0;
  int zeroCount = 0;

  for (int i = 0; i < numbers.length; i++) {
    if (numbers[i] > 0) {
      positiveCount++;
    } else if (numbers[i] < 0) {
      negativeCount++;
    } else {
      zeroCount++;
    }
  }

  print('Положительных чисел: $positiveCount');
  print('Отрицательных чисел: $negativeCount');
  print('Нулей: $zeroCount');
}
