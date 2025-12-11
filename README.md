# Incubyte TDD Assessment

A simple implementation of the String Calculator using **Test-Driven Development**. 

## Features
- Returns `0` for an empty string.
- Return sum for given list of numbers
- Handles new line separators (`"1\n2,3"`).
- Supports custom delimiters (`"//;;\n1;;2"`).
- Throws `NegativeNumberException` when negative numbers are present and lists all negatives.

## Run
```bash
dart run lib/main.dart "//;\n1;2;3"
```
## Test
```bash
dart test
```

## Structure
```
├── lib
│   ├── exceptions.dart
│   ├── main.dart
│   └── utils.dart
└── test
    ├── main_test.dart
    └── utils_test.dart
```