echo '# Single Responsibility Principle (SRP)
**Definition:** A class should have only one reason to change.

**Example:**
\`\`\`java
class ReportGenerator {
    public String generateReport() {
        return "Report content";
    }
}

class ReportPrinter {
    public void printReport(String report) {
        System.out.println(report);
    }
}
\`\`\`
' > OOP-Principles-Patterns-Concepts/SOLID_Principles/SRP.md

echo '# Open/Closed Principle (OCP)
**Definition:** Classes should be open for extension but closed for modification.

**Example:**
\`\`\`java
abstract class Shape {
    abstract double area();
}

class Circle extends Shape {
    private double radius;

    public Circle(double radius) {
        this.radius = radius;
    }

    @Override
    double area() {
        return Math.PI * radius * radius;
    }
}

class Rectangle extends Shape {
    private double width, height;

    public Rectangle(double width, double height) {
        this.width = width;
        this.height = height;
    }

    @Override
    double area() {
        return width * height;
    }
}
\`\`\`
' > OOP-Principles-Patterns-Concepts/SOLID_Principles/OCP.md

echo '# Liskov Substitution Principle (LSP)
**Definition:** Subtypes must be substitutable for their base types without altering the correctness of the program.

**Example:**
\`\`\`java
interface Flyable {
    void fly();
}

class FlyingBird implements Flyable {
    @Override
    public void fly() {
        System.out.println("Flying bird is flying");
    }
}

class NonFlyingBird {
    public void walk() {
        System.out.println("Non-flying bird is walking");
    }
}
\`\`\`
' > OOP-Principles-Patterns-Concepts/SOLID_Principles/LSP.md

echo '# Interface Segregation Principle (ISP)
**Definition:** Clients should not be forced to depend on interfaces they do not use.

**Example:**
\`\`\`java
interface Printer {
    void print();
}

interface Scanner {
    void scan();
}

class MultiFunctionPrinter implements Printer, Scanner {
    @Override
    public void print() {
        System.out.println("Printing document...");
    }

    @Override
    public void scan() {
        System.out.println("Scanning document...");
    }
}

class SimplePrinter implements Printer {
    @Override
    public void print() {
        System.out.println("Printing document...");
    }
}
\`\`\`
' > OOP-Principles-Patterns-Concepts/SOLID_Principles/ISP.md

echo '# Dependency Inversion Principle (DIP)
**Definition:** High-level modules should not depend on low-level modules. Both should depend on abstractions.

**Example:**
\`\`\`java
interface MessageSender {
    void sendMessage(String message);
}

class EmailSender implements MessageSender {
    @Override
    public void sendMessage(String message) {
        System.out.println("Sending email with message: " + message);
    }
}

class SmsSender implements MessageSender {
    @Override
    public void sendMessage(String message) {
        System.out.println("Sending SMS with message: " + message);
    }
}

class NotificationService {
    private MessageSender messageSender;

    public NotificationService(MessageSender messageSender) {
        this.messageSender = messageSender;
    }

    public void sendNotification(String message) {
        messageSender.sendMessage(message);
    }
}
\`\`\`
' > OOP-Principles-Patterns-Concepts/SOLID_Principles/DIP.md

# Object-Oriented Concepts
echo '# Encapsulation
**Definition:** Encapsulation is the technique of making the fields in a class private and providing access to the fields via public methods.

**Example:**
\`\`\`java
class Account {
    private double balance;

    public double getBalance() {
        return balance;
    }

    public void deposit(double amount) {
        if (amount > 0) {
            balance += amount;
        }
    }

    public void withdraw(double amount) {
        if (amount > 0 && amount <= balance) {
            balance -= amount;
        }
    }
}
\`\`\`
' > OOP-Principles-Patterns-Concepts/Object_Oriented_Concepts/Encapsulation.md

echo '# Inheritance
**Definition:** Inheritance is a mechanism wherein a new class is derived from an existing class.

**Example:**
\`\`\`java
class Vehicle {
    public void startEngine() {
        System.out.println("Engine started");
    }
}

class Car extends Vehicle {
    public void openTrunk() {
        System.out.println("Trunk opened");
    }
}
\`\`\`
' > OOP-Principles-Patterns-Concepts/Object_Oriented_Concepts/Inheritance.md

echo '# Polymorphism
**Definition:** Polymorphism allows methods to do different things based on the object it is acting upon.

**Example:**
\`\`\`java
interface Animal {
    void makeSound();
}

class Dog implements Animal {
    @Override
    public void makeSound() {
        System.out.println("Bark");
    }
}

class Cat implements Animal {
    @Override
    public void makeSound() {
        System.out.println("Meow");
    }
}
\`\`\`
' > OOP-Principles-Patterns-Concepts/Object_Oriented_Concepts/Polymorphism.md

echo '# Abstraction
**Definition:** Abstraction is the concept of hiding the complex implementation details and showing only the essential features of the object.

**Example:**
\`\`\`java
abstract class Shape {
    abstract double area();
}

class Circle extends Shape {
    private double radius;

    public Circle(double radius) {
        this.radius = radius;
    }

    @Override
    double area() {
        return Math.PI * radius * radius;
    }
}
\`\`\`
' > OOP-Principles-Patterns-Concepts/Object_Oriented_Concepts/Abstraction.md

# Java-Specific Concepts
echo '# IS-A Relationship
**Definition:** IS-A relationship is based on inheritance. It is a way to express a parent-child relationship between classes.

**Example:**
\`\`\`java
class Animal {
    void eat() {
        System.out.println("Animal is eating");
    }
}

class Dog extends Animal {
    void bark() {
        System.out.println("Dog is barking");
    }
}
\`\`\`
' > OOP-Principles-Patterns-Concepts/Java_Specific_Concepts/IS_A_Relationship.md

echo '# Method Visibility
**Definition:** Method visibility determines the accessibility of methods in different contexts.

**Example:**
\`\`\`java
public class Example {
    public void publicMethod() {}
    protected void protectedMethod() {}
    void defaultMethod() {}
    private void privateMethod() {}
}
\`\`\`
' > OOP-Principles-Patterns-Concepts/Java_Specific_Concepts/Method_Visibility.md

echo '# Checked Exceptions
**Definition:** Checked exceptions are exceptions that are checked at compile time.

**Example:**
\`\`\`java
public void readFile(String filePath) throws IOException {
    BufferedReader reader = new BufferedReader(new FileReader(filePath));
    // Read file
}
\`\`\`
' > OOP-Principles-Patterns-Concepts/Java_Specific_Concepts/Checked_Exceptions.md

echo '# Method Signature
**Definition:** A method signature is a combination of the method name and parameter list.

**Example:**
\`\`\`java
public void exampleMethod(int param1, String param2) {}
\`\`\`
' > OOP-Principles-Patterns-Concepts/Java_Specific_Concepts/Method_Signature.md

echo '# Abstract Class
**Definition:** An abstract class is a class that cannot be instantiated and is often used to define common characteristics for subclasses.

**Example:**
\`\`\`java
abstract class Animal {
    abstract void makeSound();
}

class Dog extends Animal {
    @Override
    void makeSound() {
        System.out.println("Bark");
    }
}
\`\`\`
' > OOP-Principles-Patterns-Concepts/Java_Specific_Concepts/Abstract_Class.md

echo '# Interfaces
**Definition:** An interface is a reference type in Java that can contain only constants, method signatures, default methods, static methods, and nested types.

**Example:**
\`\`\`java
interface Animal {
    void makeSound();
}

class Dog implements Animal {
    @Override
    public void makeSound() {
        System.out.println("Bark");
    }
}
\`\`\`
' > OOP-Principles-Patterns-Concepts/Java_Specific_Concepts/Interfaces.md

echo '# Generics
**Definition:** Generics enable types (classes and interfaces) to be parameters when defining classes, interfaces, and methods.

**Example:**
\`\`\`java
class Box<T> {
    private T content;

    public void setContent(T content) {
        this.content = content;
    }

    public T getContent() {
        return content;
    }
}
\`\`\`
' > OOP-Principles-Patterns-Concepts/Java_Specific_Concepts/Generics.md

echo '# Object Class
**Definition:** The `Object` class is the root of the class hierarchy. Every class has `Object` as a superclass.

**Example:**
\`\`\`java
class Example {
    @Override
    public String toString() {
        return "Example class";
    }
}
\`\`\`
' > OOP-Principles-Patterns-Concepts/Java_Specific_Concepts/Object_Class.md

echo '# Exception Hierarchy
**Definition:** The exception hierarchy in Java is a tree of classes that inherit from `Throwable`.

**Example:**
\`\`\`java
public void exampleMethod() {
    try {
        // Code that may throw an exception
    } catch (IOException e) {
        // Handle IOException
    } catch (Exception e) {
        // Handle other exceptions
    }
}
\`\`\`
' > OOP-Principles-Patterns-Concepts/Java_Specific_Concepts/Exception_Hierarchy.md

# Design Patterns
echo '# Factory Method
**Definition:** The Factory Method Pattern defines an interface for creating an object but lets subclasses alter the type of objects that will be created.

**Example:**
\`\`\`java
interface ShapeFactory {
    Shape createShape();
}

class CircleFactory implements ShapeFactory {
    @Override
    public Shape createShape() {
        return new Circle();
    }
}
\`\`\`
' > OOP-Principles-Patterns-Concepts/Design_Patterns/Creational_Patterns/Factory_Method.md

echo '# Abstract Factory
**Definition:** The Abstract Factory Pattern provides an interface for creating families of related or dependent objects without specifying their concrete classes.

**Example:**
\`\`\`java
interface GUIFactory {
    Button createButton();
    Checkbox createCheckbox();
}
\`\`\`
' > OOP-Principles-Patterns-Concepts/Design_Patterns/Creational_Patterns/Abstract_Factory.md

echo '# Builder
**Definition:** The Builder Pattern allows constructing complex objects step by step. It separates the construction of a complex object from its representation.

**Example:**
\`\`\`java
class Computer {
    private String CPU;
    private String RAM;

    public static class Builder {
        private String CPU;
        private String RAM;

        public Builder setCPU(String CPU) {
            this.CPU = CPU;
            return this;
        }

        public Builder setRAM(String RAM) {
            this.RAM = RAM;
            return this;
        }

        public Computer build() {
            return new Computer(this);
        }
    }

    private Computer(Builder builder) {
        this.CPU = builder.CPU;
        this.RAM = builder.RAM;
    }
}
\`\`\`
' > OOP-Principles-Patterns-Concepts/Design_Patterns/Creational_Patterns/Builder.md

echo '# Prototype
**Definition:** The Prototype Pattern is used to create a duplicate object or clone of the current object to enhance performance.

**Example:**
\`\`\`java
abstract class Shape implements Cloneable {
    @Override
    protected Object clone() throws CloneNotSupportedException {
        return super.clone();
    }
}
\`\`\`
' > OOP-Principles-Patterns-Concepts/Design_Patterns/Creational_Patterns/Prototype.md

echo '# Singleton
**Definition:** The Singleton Pattern ensures that a class has only one instance and provides a global point of access to it.

**Example:**
\`\`\`java
class Singleton {
    private static Singleton instance;

    private Singleton() {}

    public static Singleton getInstance() {
        if (instance == null) {
            instance = new Singleton();
        }
        return instance;
    }
}
\`\`\`
' > OOP-Principles-Patterns-Concepts/Design_Patterns/Creational_Patterns/Singleton.md

echo '# Adapter
**Definition:** The Adapter Pattern allows incompatible interfaces to work together. It acts as a bridge between two incompatible interfaces.

**Example:**
\`\`\`java
interface MediaPlayer {
    void play(String audioType, String fileName);
}

class AudioPlayer implements MediaPlayer {
    MediaAdapter mediaAdapter;

    @Override
    public void play(String audioType, String fileName) {
        if (audioType.equalsIgnoreCase("mp3")) {
            System.out.println("Playing mp3 file. Name: " + fileName);
        } else if (audioType.equalsIgnoreCase("vlc") || audioType.equalsIgnoreCase("mp4")) {
            mediaAdapter = new MediaAdapter(audioType);
            mediaAdapter.play(audioType, fileName);
        } else {
            System.out.println("Invalid media. " + audioType + " format not supported");
        }
    }
}
\`\`\`
' > OOP-Principles-Patterns-Concepts/Design_Patterns/Structural_Patterns/Adapter.md

echo '# Decorator
**Definition:** The Decorator Pattern allows behavior to be added to an individual object, dynamically, without affecting the behavior of other objects from the same class.

**Example:**
\`\`\`java
interface Shape {
    void draw();
}

class Circle implements Shape {
    @Override
    public void draw() {
        System.out.println("Shape: Circle");
    }
}

abstract class ShapeDecorator implements Shape {
    protected Shape decoratedShape;

    public ShapeDecorator(Shape decoratedShape) {
        this.decoratedShape = decoratedShape;
    }

    public void draw() {
        decoratedShape.draw();
    }
}

class RedShapeDecorator extends ShapeDecorator {
    public RedShapeDecorator(Shape decoratedShape) {
        super(decoratedShape);
    }

    @Override
    public void draw() {
        decoratedShape.draw();
        setRedBorder(decoratedShape);
    }

    private void setRedBorder(Shape decoratedShape) {
        System.out.println("Border Color: Red");
    }
}
\`\`\`
' > OOP-Principles-Patterns-Concepts/Design_Patterns/Structural_Patterns/Decorator.md

echo '# Proxy
**Definition:** The Proxy Pattern provides a surrogate or placeholder for another object to control access to it.

**Example:**
\`\`\`java
interface Image {
    void display();
}

class RealImage implements Image {
    private String fileName;

    public RealImage(String fileName) {
        this.fileName = fileName;
        loadFromDisk(fileName);
    }

    private void loadFromDisk(String fileName) {
        System.out.println("Loading " + fileName);
    }

    @Override
    public void display() {
        System.out.println("Displaying " + fileName);
    }
}

class ProxyImage implements Image {
    private RealImage realImage;
    private String fileName;

    public ProxyImage(String fileName) {
        this.fileName = fileName;
    }

    @Override
    public void display() {
        if (realImage == null) {
            realImage = new RealImage(fileName);
        }
        realImage.display();
    }
}
\`\`\`
' > OOP-Principles-Patterns-Concepts/Design_Patterns/Structural_Patterns/Proxy.md

echo '# Observer
**Definition:** The Observer Pattern defines a one-to-many dependency between objects so that when one object changes state, all its dependents are notified and updated automatically.

**Example:**
\`\`\`java
import java.util.ArrayList;
import java.util.List;

interface Observer {
    void update(String message);
}

class ConcreteObserver implements Observer {
    private String name;

    public ConcreteObserver(String name) {
        this.name = name;
    }

    @Override
    public void update(String message) {
        System.out.println(name + " received: " + message);
    }
}

class Subject {
    private List<Observer> observers = new ArrayList<>();

    public void addObserver(Observer observer) {
        observers.add(observer);
    }

    public void notifyObservers(String message) {
        for (Observer observer : observers) {
            observer.update(message);
        }
    }
}
\`\`\`
' > OOP-Principles-Patterns-Concepts/Design_Patterns/Behavioral_Patterns/Observer.md

echo '# Strategy
**Definition:** The Strategy Pattern defines a family of algorithms, encapsulates each one, and makes them interchangeable. Strategy lets the algorithm vary independently from clients that use it.

**Example:**
\`\`\`java
interface Strategy {
    int execute(int a, int b);
}

class AdditionStrategy implements Strategy {
    @Override
    public int execute(int a, int b) {
        return a + b;
    }
}

class SubtractionStrategy implements Strategy {
    @Override
    public int execute(int a, int b) {
        return a - b;
    }
}

class Context {
    private Strategy strategy;

    public Context(Strategy strategy) {
        this.strategy = strategy;
    }

    public int executeStrategy(int a, int b) {
        return strategy.execute(a, b);
    }
}
\`\`\`
' > OOP-Principles-Patterns-Concepts/Design_Patterns/Behavioral_Patterns/Strategy.md

echo '# Command
**Definition:** The Command Pattern is a behavioral design pattern in which an object is used to encapsulate all information needed to perform an action or trigger an event at a later time.

**Example:**
\`\`\`java
interface Command {
    void execute();
}

class Light {
    public void on() {
        System.out.println("Light is ON");
    }

    public void off() {
        System.out.println("Light is OFF");
    }
}

class LightOnCommand implements Command {
    private Light light;

    public LightOnCommand(Light light) {
        this.light = light;
    }

    @Override
    public void execute() {
        light.on();
    }
}

class LightOffCommand implements Command {
    private Light light;

    public LightOffCommand(Light light) {
        this.light = light;
    }

    @Override
    public void execute() {
        light.off();
    }
}

class RemoteControl {
    private Command command;

    public void setCommand(Command command) {
        this.command = command;
    }

    public void pressButton() {
        command.execute();
    }
}
\`\`\`
' > OOP-Principles-Patterns-Concepts/Design_Patterns/Behavioral_Patterns/Command.md

echo '# State
**Definition:** The State Pattern allows an object to alter its behavior when its internal state changes. The object will appear to change its class.

**Example:**
\`\`\`java
interface State {
    void doAction(Context context);
}

class StartState implements State {
    @Override
    public void doAction(Context context) {
        System.out.println("Player is in start state");
        context.setState(this);
    }

    @Override
    public String toString() {
        return "Start State";
    }
}

class StopState implements State {
    @Override
    public void doAction(Context context) {
        System.out.println("Player is in stop state");
        context.setState(this);
    }

    @Override
    public String toString() {
        return "Stop State";
    }
}

class Context {
    private State state;

    public void setState(State state) {
        this.state = state;
    }

    public State getState() {
        return state;
    }
}
\`\`\`
' > OOP-Principles-Patterns-Concepts/Design_Patterns/Behavioral_Patterns/State.md

echo '# Visitor
**Definition:** The Visitor Pattern represents an operation to be performed on the elements of an object structure. It lets you define a new operation without changing the classes of the elements on which it operates.

**Example:**
\`\`\`java
interface ComputerPart {
    void accept(ComputerPartVisitor computerPartVisitor);
}

class Keyboard implements ComputerPart {
    @Override
    public void accept(ComputerPartVisitor computerPartVisitor) {
        computerPartVisitor.visit(this);
    }
}

class Monitor implements ComputerPart {
    @Override
    public void accept(ComputerPartVisitor computerPartVisitor) {
        computerPartVisitor.visit(this);
    }
}

class Computer implements ComputerPart {
    ComputerPart[] parts;

    public Computer() {
        parts = new ComputerPart[]{new Keyboard(), new Monitor()};
    }

    @Override
    public void accept(ComputerPartVisitor computerPartVisitor) {
        for (int i = 0; i < parts.length; i++) {
            parts[i].accept(computerPartVisitor);
        }
        computerPartVisitor.visit(this);
    }
}

interface ComputerPartVisitor {
    void visit(Keyboard keyboard);
    void visit(Monitor monitor);
    void visit(Computer computer);
}

class ComputerPartDisplayVisitor implements ComputerPartVisitor {
    @Override
    public void visit(Keyboard keyboard) {
        System.out.println("Displaying Keyboard.");
    }

    @Override
    public void visit(Monitor monitor) {
        System.out.println("Displaying Monitor.");
    }

    @Override
    public void visit(Computer computer) {
        System.out.println("Displaying Computer.");
    }
}
\`\`\`
' > OOP-Principles-Patterns-Concepts/Design_Patterns/Behavioral_Patterns/Visitor.md

echo '# Iterator
**Definition:** The Iterator Pattern provides a way to access the elements of an aggregate object sequentially without exposing its underlying representation.

**Example:**
\`\`\`java
interface Iterator {
    boolean hasNext();
    Object next();
}

class NameRepository {
    public String[] names = {"John", "Jane", "Jack", "Jill"};

    public Iterator getIterator() {
        return new NameIterator();
    }

    private class NameIterator implements Iterator {
        int index;

        @Override
        public boolean hasNext() {
            return index < names.length;
        }

        @Override
        public Object next() {
            if (this.hasNext()) {
                return names[index++];
            }
            return null;
        }
    }
}
\`\`\`
' > OOP-Principles-Patterns-Concepts/Design_Patterns/Behavioral_Patterns/Iterator.md

echo '# Template Method
**Definition:** The Template Method Pattern defines the skeleton of an algorithm in a method, deferring some steps to subclasses. Template Method lets subclasses redefine certain steps of an algorithm without changing the algorithms structure.

**Example:**
\`\`\`java
abstract class Game {
    abstract void initialize();
    abstract void startPlay();
    abstract void endPlay();

    // template method
    public final void play() {
        initialize();
        startPlay();
        endPlay();
    }
}

class Cricket extends Game {
    @Override
    void initialize() {
        System.out.println("Cricket Game Initialized.");
    }

    @Override
    void startPlay() {
        System.out.println("Cricket Game Started.");
    }

    @Override
    void endPlay() {
        System.out.println("Cricket Game Finished.");
    }
}

class Football extends Game {
    @Override
    void initialize() {
        System.out.println("Football Game Initialized.");
    }

    @Override
    void startPlay() {
        System.out.println("Football Game Started.");
    }

    @Override
    void endPlay() {
        System.out.println("Football Game Finished.");
    }
}
\`\`\`
' > OOP-Principles-Patterns-Concepts/Design_Patterns/Behavioral_Patterns/Template_Method.md

# Programming Principles
echo '# DRY (Dont Repeat Yourself)
**Definition:** DRY is a principle aimed at reducing the repetition of code by abstracting out commonalities into a single location.

**Example:**
\`\`\`java
public class User {
    private String name;
    private String email;

    // Other fields and methods

    public void printUserDetails() {
        System.out.println("Name: " + name);
        System.out.println("Email: " + email);
    }
}
\`\`\`
' > OOP-Principles-Patterns-Concepts/Programming_Principles/DRY.md

echo '# YAGNI (You Arent Gonna Need It)
**Definition:** YAGNI is a principle of extreme programming that states a programmer should not add functionality until deemed necessary.
' > OOP-Principles-Patterns-Concepts/Programming_Principles/YAGNI.md

echo '# KISS (Keep It Simple, Stupid)
**Definition:** KISS is a principle that states that most systems work best if they are kept simple rather than made complicated.
' > OOP-Principles-Patterns-Concepts/Programming_Principles/KISS.md

echo '# Separation of Concerns
**Definition:** Separation of concerns is a design principle for separating a computer program into distinct sections, such that each section addresses a separate concern.
' > OOP-Principles-Patterns-Concepts/Programming_Principles/Separation_of_Concerns.md

echo '# Law of Demeter (Principle of Least Knowledge)
**Definition:** The Law of Demeter is a design guideline for developing software, particularly object-oriented programs. In its general form, the LoD is a specific case of loose coupling.

**Example:**
\`\`\`java
class Engine {
    public void start() {
        // Start the engine
    }
}

class Car {
    private Engine engine;

    public Car() {
        engine = new Engine();
    }

    public void start() {
        engine.start();
    }
}
\`\`\`
' > OOP-Principles-Patterns-Concepts/Programming_Principles/Law_of_Demeter.md

echo '# Composition over Inheritance
**Definition:** Composition over inheritance is a principle that suggests using composition instead of inheritance to achieve code reuse.

**Example:**
\`\`\`java
class Engine {
    public void start() {
        System.out.println("Engine started");
    }
}

class Car {
    private Engine engine;

    public Car(Engine engine) {
        this.engine = engine;
    }

    public void start() {
        engine.start();
    }
}
\`\`\`
' > OOP-Principles-Patterns-Concepts/Programming_Principles/Composition_over_Inheritance.md

# Other Concepts
echo '# Lazy Initialization
**Definition:** Lazy initialization is a tactic of delaying the creation of an object or the calculation of a value until it is needed.

**Example:**
\`\`\`java
class ExpensiveObject {
    private ExpensiveResource resource;

    public ExpensiveResource getResource() {
        if (resource == null) {
            resource = new ExpensiveResource();
        }
        return resource;
    }
}
\`\`\`
' > OOP-Principles-Patterns-Concepts/Other_Concepts/Lazy_Initialization.md

echo '# Type Safety
**Definition:** Type safety is a feature of the Java language that ensures that the code does not perform invalid or unsafe operations on objects.

**Example:** Use generics to ensure type safety in collections.
' > OOP-Principles-Patterns-Concepts/Other_Concepts/Type_Safety.md

echo '# Method Overriding
**Definition:** Method overriding occurs when a subclass provides a specific implementation of a method that is already defined in its superclass.

**Example:**
\`\`\`java
class Animal {
    void makeSound() {
        System.out.println("Animal sound");
    }
}

class Dog extends Animal {
    @Override
    void makeSound() {
        System.out.println("Bark");
    }
}
\`\`\`
' > OOP-Principles-Patterns-Concepts/Other_Concepts/Method_Overriding.md

echo '# instanceof Operator
**Definition:** The `instanceof` operator is used to test whether the object is an instance of the specified type.

**Example:**
\`\`\`java
if (obj instanceof Dog) {
    Dog dog = (Dog) obj;
    dog.bark();
}
\`\`\`
' > OOP-Principles-Patterns-Concepts/Other_Concepts/instanceof_Operator.md

echo '# Incompatible Return Types
**Definition:** Ensures method overriding maintains compatible return types.
' > OOP-Principles-Patterns-Concepts/Other_Concepts/Incompatible_Return_Types.md

# Advanced Concepts
echo '# Inversion of Control (IoC)
**Definition:** Inversion of Control (IoC) is a design principle in which the control of objects or portions of a program is transferred to a container or framework.
' > OOP-Principles-Patterns-Concepts/Advanced_Concepts/IoC.md

echo '# Aspect-Oriented Programming (AOP)
**Definition:** Aspect-Oriented Programming (AOP) is a programming paradigm that aims to increase modularity by allowing the separation of cross-cutting concerns.
' > OOP-Principles-Patterns-Concepts/Advanced_Concepts/AOP.md

echo '# GRASP Patterns
**Definition:** General Responsibility Assignment Software Patterns (GRASP) are a set of design principles for assigning responsibilities to objects in object-oriented design.
' > OOP-Principles-Patterns-Concepts/Advanced_Concepts/GRASP.md

# Software Development Practices
echo '# Test-Driven Development (TDD)
**Definition:** Test-Driven Development (TDD) is a software development process in which tests are written before the code they are testing.
' > OOP-Principles-Patterns-Concepts/Software_Development_Practices/TDD.md

echo '# Continuous Integration/Continuous Deployment (CI/CD)
**Definition:** Continuous Integration/Continuous Deployment (CI/CD) is a method to frequently deliver apps to customers by introducing automation into the stages of app development.
' > OOP-Principles-Patterns-Concepts/Software_Development_Practices/CI_CD.md

echo '# Agile Methodologies
**Definition:** Agile methodologies are practices that promote continuous iteration of development and testing throughout the software development lifecycle of the project.
' > OOP-Principles-Patterns-Concepts/Software_Development_Practices/Agile_Methodologies.md

# Add README.md
echo '# Principles, Patterns, and Concepts

## Table of Contents
1. [SOLID Principles](SOLID_Principles/)
2. [Object-Oriented Concepts](Object_Oriented_Concepts/)
3. [Java-Specific Concepts](Java_Specific_Concepts/)
4. [Design Patterns](Design_Patterns/)
5. [Programming Principles](Programming_Principles/)
6. [Other Concepts](Other_Concepts/)
7. [Advanced Concepts](Advanced_Concepts/)
8. [Software Development Practices](Software_Development_Practices/)
' > OOP-Principles-Patterns-Concepts/README.md