# Incubyte TDD Assessment
A simple implementation of the String Calculator using **Test-Driven Development**. 

## Features
- Returns `0` for an empty string.
- Return sum for given list of numbers
- Handles new line separators (`"1\n2,3"`).
- Supports custom delimiters (`"//;;\n1;;2"`).
- Throws `NegativeNumberException` when negative numbers are present and lists all negatives.

## Dependencies
- Flutter ~3.32.8

### Install dependencies
```
dart pub get
```

## Run
```bash
dart run incubyte_tdd_assignment "//;\n1;2;3"
```
## Test
```bash
dart test
```

## Structure
```
├── bin
│   └── incubyte_tdd_assignment.dart
├── lib
│   ├── add.dart
│   └── core
│       ├── exceptions.dart
│       └── utils.dart
└── test
    ├── add_test.dart
    └── core
        └── utils_test.dart

```