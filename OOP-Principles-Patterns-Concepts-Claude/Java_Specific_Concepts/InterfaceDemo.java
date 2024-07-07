/**
 * This file demonstrates Java interface concepts:
 * - Default methods
 * - Static methods in interfaces
 * - Functional interfaces
 */

import java.util.function.Predicate;

interface Vehicle {
    void start();
    void stop();

    // Default method
    default void horn() {
        System.out.println("Beep beep!");
    }

    // Static method in interface
    static boolean isMoving(Vehicle vehicle) {
        return vehicle.getCurrentSpeed() > 0;
    }

    int getCurrentSpeed();
}

// Functional interface
@FunctionalInterface
interface SpeedCheck {
    boolean isSpeeding(int speed);
}

class Car implements Vehicle {
    private int currentSpeed = 0;

    @Override
    public void start() {
        System.out.println("Car started");
    }

    @Override
    public void stop() {
        System.out.println("Car stopped");
    }

    @Override
    public int getCurrentSpeed() {
        return currentSpeed;
    }

    public void accelerate(int speed) {
        currentSpeed += speed;
    }
}

public class InterfaceDemo {
    public static void main(String[] args) {
        Car car = new Car();
        car.start();
        car.horn(); // Using default method
        car.accelerate(50);

        System.out.println("Is car moving? " + Vehicle.isMoving(car)); // Using static method

        // Using functional interface
        SpeedCheck speedLimit = speed -> speed > 60;
        System.out.println("Is car speeding? " + speedLimit.isSpeeding(car.getCurrentSpeed()));

        // Using Predicate (built-in functional interface)
        Predicate<Integer> speedCheck = speed -> speed > 60;
        System.out.println("Is car speeding? " + speedCheck.test(car.getCurrentSpeed()));

        car.stop();
    }
}
