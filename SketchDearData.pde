
Car[] cars = {
  new Car(1, "Black", "BMW", "14/07/2026", "Saloon"),
  new Car(2, "White", "Kia", "15/07/2026", "SUV"),
  new Car(3, "Grey", "Mercedes", "16/07/2026", "Hatchback"),
  new Car(4, "Blue", "BMW", "17/07/2026", "SUV"),
  new Car(5, "Silver", "BYD", "18/07/2026", "Saloon"),
  new Car(6, "Black", "Corsa", "19/07/2026", "Saloon"),
  new Car(7, "Red", "Vauxhall", "20/07/2026", "Hatchback"),
  new Car(8, "White", "Volkswagen", "21/07/2026", "Hatchback"),
  new Car(9, "Grey", "Mercedes", "22/07/2026", "SUV"),
  new Car(10, "Blue", "BMW", "23/07/2026", "Saloon"),
  new Car(11, "Silver", "Kia", "24/07/2026", "SUV"),
  new Car(12, "Black", "Range Rover", "25/07/2026", "SUV"),
  new Car(13, "White", "Toyota", "26/07/2026", "Saloon"),
  new Car(14, "Grey", "Audi", "27/07/2026", "Saloon"),
  new Car(15, "Blue", "Rolls-Royce", "28/07/2026", "Hatchback"),
  new Car(16, "Silver", "Ferrari", "29/07/2026", "Hatchback"),
  new Car(17, "Black", "Lamborghini", "30/07/2026", "Saloon"),
  new Car(18, "White", "BYD", "31/07/2026", "SUV"),
  new Car(19, "Grey", "BMW", "01/08/2026", "Saloon"),
  new Car(20, "Red", "BMW", "02/08/2026", "Saloon"),
  new Car(21, "Blue", "Kia", "03/08/2026", "Hatchback"),
  new Car(22, "Black", "Mercedes", "04/08/2026", "SUV"),
  new Car(23, "Silver", "Toyota", "05/08/2026", "Saloon"),
  new Car(24, "Red", "BYD", "06/08/2026", "Hatchback"),
  new Car(25, "Red", "Audi", "07/08/2026", "Saloon"),
  new Car(26, "Green", "Corsa", "08/08/2026", "SUV"),
  new Car(27, "Silver", "BMW", "09/08/2026", "SUV"),
  new Car(28, "Black", "Honda", "10/08/2026", "Hatchback")
};

void setup() {
  size(1200, 1100);
  smooth();
  textFont(createFont("Arial", 14));
}

void draw() {
  background(248, 247, 243);

  // Project title
  fill(35);
  textAlign(CENTER);
  textSize(34);
  text("THE CARS AROUND US", width/2, 55);

  textSize(15);
  fill(100);
  text("A visual exploration of 100 car observations",
       width/2, 85);

  // Observation counter
  fill(35);
  textSize(17);
  text(cars.length + " / 100 OBSERVATIONS",
       width/2, 125);

  // Draw all car observations
  for (int i = 0; i < cars.length; i++) {
    int column = i % 10;
    int row = i / 10;

    float x = 70 + column * 118;
    float y = 215 + row * 85;

    cars[i].display(x, y);
  }

  // Legend
  drawLegend();
}

void drawLegend() {
  fill(35);
  textAlign(CENTER);
  textSize(19);
  text("UNDERSTANDING THE DATA", width/2, 1080);

  // Circle sizes
  fill(110);
  textSize(12);
  text("Hatchback = Small     Saloon = Medium     SUV = Large",
       width/2, 1050);
}

// Car class
class Car {

  int number;
  String colour;
  String brand;
  String date;
  String vehicleType;

  Car(int n, String c, String b, String d, String v) {
    number = n;
    colour = c;
    brand = b;
    date = d;
    vehicleType = v;
  }

  // Returns the circle size based on vehicle type
  float getCircleSize() {
    if (vehicleType.equals("SUV")) {
      return 40;
    } else if (vehicleType.equals("Saloon")) {
      return 30;
    } else {
      return 21;
    }
  }

  // Returns the correct colour
  color getCarColour() {
    if (colour.equals("Black")) {
      return color(40, 40, 40);
    } else if (colour.equals("White")) {
      return color(255, 255, 255);
    } else if (colour.equals("Grey")) {
      return color(145, 145, 145);
    } else if (colour.equals("Blue")) {
      return color(55, 125, 210);
    } else if (colour.equals("Silver")) {
      return color(190, 195, 200);
    } else if (colour.equals("Red")) {
      return color(215, 55, 65);
    } else if (colour.equals("Green")) {
      return color(65, 155, 95);
    }

    return color(150);
  }

  // Displays one car observation
  void display(float x, float y) {

    // Observation number
    fill(100);
    textAlign(CENTER);
    textSize(11);
    text(number, x, y - 38);

    // Car circle
    fill(getCarColour());
    stroke(70);
    strokeWeight(1);
    ellipse(x, y, getCircleSize(), getCircleSize());

    // Brand
    fill(40);
    textSize(11);
    text(brand, x, y + 32);

    // Date
    fill(120);
    textSize(9);
    text(date, x, y + 46);
  }
}
