void main() {
  print('Задание 1');
  Student student = Student(name: 'Азамат', age: 18, grade: 5);
  student.printInfo();
  student.checkGrade();

  Student student2 = Student(name: 'Иван', age: 19, grade: 3);
  student2.printInfo();
  student2.checkGrade();

  print('');
  print('Задание 2');
  BankAccount account = BankAccount(owner: 'Алина', balance: 5000);
  print('Начальный баланс: ${account.formatMoney(account.balance)} сом');
  account.deposit(2000);
  account.printBalance();
  account.withdraw(3000);
  account.printBalance();
  account.withdraw(10000);
  account.printBalance();

  print('');
  print('Задание 3');
  Car car = Car(brand: 'Toyota', year: 2020, mileage: 50000);
  car.printInfo();
  car.drive(150);
  car.printInfo();
}

// Задание 1
class Student {
  String name;
  int age;
  int grade;

  Student({required this.name, required this.age, required this.grade});

  void printInfo() {
    print('Имя: $name');
    print('Возраст: $age');
    print('Оценка: $grade');
  }

  void checkGrade() {
    if (grade == 4 || grade == 5) {
      print('Хорошая оценка');
    } else {
      print('Нужно подтянуть знания');
    }
  }
}

// Задание 2
class BankAccount {
  String owner;
  double balance;

  BankAccount({required this.owner, required this.balance});

  void deposit(double amount) {
    balance = balance + amount;
    print('Пополнение: ${formatMoney(amount)} сом');
  }

  void withdraw(double amount) {
    if (amount <= balance) {
      balance = balance - amount;
      print('Снятие: ${formatMoney(amount)} сом');
    } else {
      print('Недостаточно средств');
    }
  }

  void printBalance() {
    print('Баланс: ${formatMoney(balance)} сом');
  }

  // Убирает ".0" у целых сумм: 5000.0 -> 5000, а 99.5 остаётся 99.5
  String formatMoney(double value) {
    if (value == value.roundToDouble()) {
      return value.toInt().toString();
    } else {
      return value.toString();
    }
  }
}

// Задание 3
class Car {
  String brand;
  int year;
  int mileage;

  Car({required this.brand, required this.year, required this.mileage});

  void printInfo() {
    print('Марка: $brand');
    print('Год выпуска: $year');
    print('Пробег: $mileage км');
  }

  void drive(int distance) {
    mileage = mileage + distance;
    print('После поездки на $distance км:');
  }
}
