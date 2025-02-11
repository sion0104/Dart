abstract class Drinks {
  String name;
  int price;
  bool isHot;
  Size size;

  Drinks(this.name, this.price, this.isHot, this.size);

  void setMenu(String name, int price, Size size) {
    this.name = name;
    this.price = price;
    this.isHot = isHot;
    this.size = size;
  }
}

mixin ShotOption on Drinks {
  int shots = 2;

  void setShots(int shots) {
    this.shots = shots;
  }
}

mixin MilkOption on Drinks {
  MilkType milkType = MilkType.regular;

  void setMilkType(MilkType milkType) {
    this.milkType = milkType;
  }
}

class Coffee extends Drinks with ShotOption {
  Coffee(String name, int price, bool isHot, int shots, Size size)
      : super(name, price, isHot, size) {
    setShots(shots);
  }

  @override
  String toString() {
    return 'Coffee: $name, Price $price, Hot: $isHot, Size: $size';
  }
}

class Decaf extends Drinks with ShotOption {
  Decaf(String name, int price, bool isHot, int shots, Size size)
      : super(name, price, isHot, size) {
    setShots(shots);
  }

  @override
  String toString() {
    return 'Decaf: $name, Price $price, Hot: $isHot, Size: $size';
  }
}

class Latte extends Drinks with ShotOption, MilkOption {
  bool containsCoffee;

  Latte(String name, int price, bool isHot, int shots, MilkType milkType,
      Size size, this.containsCoffee)
      : super(name, price, isHot, size) {
    setShots(shots);
    setMilkType(milkType);
  }

  @override
  String toString() {
    return 'Latte: $name, Price: $price, Size: $size, Hot: $isHot, Shots: $shots, MilkType: $milkType, Contains Coffee: $containsCoffee';
  }
}

class Dessert {
  String name;
  int price;

  Dessert(this.name, this.price);

  void setMenu(String name, int price) {
    this.name = name;
    this.price = price;
  }

  @override
  String toString() {
    return 'Dessert: $name, Price: $price';
  }
}

class ADE extends Drinks {
  bool isSparklingWater;

  ADE(String name, int price, Size size, bool isHot, this.isSparklingWater)
      : super(name, price, isHot, size) {
    this.isSparklingWater = isSparklingWater;
  }

  @override
  String toString() {
    return 'ADE: $name, Price: $price, Size: $size, Hot: $isHot, SparklingWater: $isSparklingWater';
  }
}

void main() {
  var americano = Coffee('Americano', 4000, true, 1, Size.m);
  print(americano);

  var caramelMacchiato = Decaf('Caramel Macchiato', 5000, false, 2, Size.l);
  print(caramelMacchiato);

  // 라떼 예제 (커피 포함)
  var latteWithCoffee =
      Latte('Cafe Latte', 5500, true, 1, MilkType.oat, Size.m, true);
  print(latteWithCoffee);

  // 라떼 예제 (커피 미포함)
  var latteWithoutCoffee =
      Latte('Milk Latte', 5000, true, 0, MilkType.regular, Size.m, false);
  print(latteWithoutCoffee);

  // ADE 예제
  var lemonAde = ADE('Lemon ADE', 6000, Size.l, false, true); // 탄산수 사용
  print(lemonAde);

  // 디저트 예제
  var cheesecake = Dessert('Cheesecake', 6000);
  print(cheesecake);

  // 추가 다양성 있는 예제
  var soyLatte = Latte('Soy Latte', 5200, true, 1, MilkType.soy, Size.s, true);
  print(soyLatte);

  var almondLatte = Latte(
      'Almond Milk Latte', 5300, false, 0, MilkType.almond, Size.l, false);
  print(almondLatte);

  var smallAmericano = Coffee('Small Americano', 3500, false, 1, Size.s);
  print(smallAmericano);
}

enum Size { s, m, l }

enum MilkType { regular, soy, oat, almond }
