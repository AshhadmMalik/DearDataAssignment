
Car[] cars;

String[] dates = {
  "14/07/2026", "15/07/2026", "16/07/2026", "17/07/2026",
  "18/07/2026", "19/07/2026", "20/07/2026", "21/07/2026",
  "22/07/2026", "23/07/2026", "24/07/2026", "25/07/2026",
  "26/07/2026", "27/07/2026", "28/07/2026", "29/07/2026",
  "30/07/2026", "31/07/2026", "1/8/2026", "2/8/2026",
  "3/8/2026", "4/8/2026", "5/8/2026", "6/8/2026",
  "7/8/2026", "8/8/2026", "9/8/2026", "10/8/2026"
};

int[] counts = {
  8, 4, 6, 2, 5, 1, 4, 2, 6, 3,
  1, 5, 3, 7, 3, 1, 4, 6, 7, 3,
  1, 3, 6, 3, 1, 3, 4, 5
};

String[] colours = {
  "Black", "White", "Grey", "Blue", "Silver",
  "Black", "Red", "White", "Grey", "Blue",
  "Silver", "Black", "White", "Grey", "Blue",
  "Silver", "Black", "White", "Grey", "Red",
  "Blue", "Black", "Silver", "Red", "Red",
  "Green", "Silver", "Black"
};

String[] brands = {
  "BMW", "Kia", "Mercedez", "BMW", "BYD",
  "Corsa", "Vauxhall", "VolksWagon", "Mercedez",
  "BMW", "KIA", "Range Rover", "Toyota", "Audi",
  "Rolls Royce", "Ferrari", "Lamborghini", "BYD",
  "BMW", "BMW", "Kia", "Mercedez", "Toyota",
  "BYD", "Audi", "Corsa", "BMW", "Honda"
};

String[] vehicleTypes = {
  "Saloon", "SUV", "Hatchback", "SUV", "Saloon",
  "Saloon", "Hatchback", "Hatchback", "SUV", "Saloon",
  "SUV", "SUV", "Saloon", "Saloon", "Hatchback",
  "Hatchback", "Saloon", "SUV", "Saloon", "Saloon",
  "Hatchback", "SUV", "Saloon", "Hatchback", "Saloon",
  "SUV", "SUV", "Hatchback"
};

void setup() {
  size(1500, 850);
  smooth();
  textFont(createFont("Arial", 14));

  // Calculate the total number of cars.
  int totalCars = 0;

  for (int i = 0; i < counts.length; i++) {
    totalCars += counts[i];
  }

  // Create one Car object for every individual car.
  cars = new Car[totalCars];

  int index = 0;

  for (int i = 0; i < counts.length; i++) {

    for (int j = 0; j < counts[i]; j++) {

      cars[index] = new Car(
        colours[i],
        brands[i],
        dates[i],
        vehicleTypes[i],
        i,
        j,
        counts[i]
      );

      index++;
    }
  }
}

void draw() {
  background(248, 247, 243);

  // Main heading.
  fill(35);
  textAlign(CENTER);
  textSize(34);
  text("My Observation of Cars", width/2, 55);

  textSize(15);
  fill(110);
  text("A visual exploration of cars observed over time",
       width/2, 85);

  // Display the number of cars.
  fill(35);
  textSize(17);
  text(cars.length + " CARS RECORDED", width/2, 125);

  drawLegend();

  // Draw all individual cars.
  for (int i = 0; i < cars.length; i++) {
    cars[i].display();
  }

  // Display dates along the timeline.
  drawDates();

  // Display information when the mouse hovers over a car.
  for (int i = 0; i < cars.length; i++) {

    if (cars[i].isMouseOver()) {
      cars[i].displayInformation();
      break;
    }
  }
}

void drawDates() {
  fill(70);
  textSize(10);
  textAlign(CENTER);

  for (int i = 0; i < dates.length; i++) {

    float x = 90 + i * 48;

    pushMatrix();
    translate(x, 700);
    rotate(-HALF_PI);

    text(dates[i], 0, 0);

    popMatrix();
  }

  fill(35);
  textSize(14);
  text("OBSERVATION DATE", width/2, 790);
}

void drawLegend() {

  // Separate legend box.
  fill(255);
  stroke(210);
  rect(1080, 145, 370, 155, 12);

  fill(35);
  textAlign(LEFT);
  textSize(15);
  text("UNDERSTANDING THE DATA", 1100, 170);

  textSize(11);
  fill(80);

  // Colour examples.
  fill(35);
  ellipse(1110, 195, 15, 15);
  fill(60);
  text("Black", 1125, 199);

  fill(255);
  stroke(100);
  ellipse(1190, 195, 15, 15);
  fill(60);
  text("White", 1205, 199);

  fill(145);
  noStroke();
  ellipse(1280, 195, 15, 15);
  fill(60);
  text("Grey", 1295, 199);

  fill(55, 125, 210);
  ellipse(1110, 220, 15, 15);
  fill(60);
  text("Blue", 1125, 224);

  fill(190, 195, 200);
  ellipse(1190, 220, 15, 15);
  fill(60);
  text("Silver", 1205, 224);

  fill(215, 55, 65);
  ellipse(1280, 220, 15, 15);
  fill(60);
  text("Red", 1295, 224);

  fill(65, 155, 95);
  ellipse(1110, 245, 15, 15);
  fill(60);
  text("Green", 1125, 249);

  fill(60);
  text("Circle size: SUV = Large", 1190, 249);
  text("Saloon = Medium | Hatchback = Small",
       1100, 275);
}

// Car class.
class Car {

  String colour;
  String brand;
  String date;
  String vehicleType;

  int dateIndex;
  int positionInGroup;
  int groupCount;

  Car(String c, String b, String d, String v,
      int dateNumber, int position, int total) {

    colour = c;
    brand = b;
    date = d;
    vehicleType = v;

    dateIndex = dateNumber;
    positionInGroup = position;
    groupCount = total;
  }

  // Calculate the circle size from vehicle type.
  float getCircleSize() {

    if (vehicleType.equals("SUV")) {
      return 34;
    }
    else if (vehicleType.equals("Saloon")) {
      return 27;
    }
    else {
      return 20;
    }
  }

  // Convert the car colour into a Processing colour.
  color getCarColour() {

    if (colour.equals("Black")) {
      return color(40, 40, 40);
    }
    else if (colour.equals("White")) {
      return color(255, 255, 255);
    }
    else if (colour.equals("Grey")) {
      return color(145, 145, 145);
    }
    else if (colour.equals("Blue")) {
      return color(55, 125, 210);
    }
    else if (colour.equals("Silver")) {
      return color(190, 195, 200);
    }
    else if (colour.equals("Red")) {
      return color(215, 55, 65);
    }
    else if (colour.equals("Green")) {
      return color(65, 155, 95);
    }

    return color(150);
  }

  // Calculate the circle's position.
  float getX() {
    return 90 + dateIndex * 48;
  }

  float getY() {
    return 470 +
      (positionInGroup - (groupCount - 1) / 2.0) * 43;
  }

  // Draw one individual car.
  void display() {

    fill(getCarColour());
    stroke(75);
    strokeWeight(1);

    ellipse(getX(), getY(),
            getCircleSize(), getCircleSize());
  }

  // Check whether the mouse is over this circle.
  boolean isMouseOver() {

    float distance = dist(
      mouseX, mouseY, getX(), getY()
    );

    return distance < getCircleSize() / 2;
  }

  // Display a circular information panel.
  void displayInformation() {

    float panelX = constrain(mouseX + 115, 120, width - 120);
    float panelY = constrain(mouseY, 120, height - 120);

    fill(255);
    stroke(80);
    strokeWeight(2);

    ellipse(panelX, panelY, 215, 215);

    fill(35);
    textAlign(CENTER);

    textSize(16);
    text("CAR INFORMATION", panelX, panelY - 65);

    textSize(14);
    text(brand, panelX, panelY - 32);

    textSize(12);
    text("Colour: " + colour, panelX, panelY - 5);

    text("Type: " + vehicleType, panelX, panelY + 20);

    text("Date: " + date, panelX, panelY + 45);

    text("Cars recorded: " + groupCount,
         panelX, panelY + 70);
  }
}
