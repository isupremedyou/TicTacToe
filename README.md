
# TicTacToe

![App Icon](https://raw.githubusercontent.com/travischapman/TicTacToe/master/TicTacToe/Resources/Assets.xcassets/AppIcon.appiconset/noun_Tic%20Tac%20Toe_1210448-60@3x.png)

A simple tic-tac-toe game created in Swift. a simple game that allows two players to compete in a simple battle of the minds.

## Singleton Design Pattern

The app utilizes the singleton design pattern for the model controller (TicTacToeController) class.

```swift
class TicTacToeController {

// Singleton
static let shared = TicTacToeController()
private init() {}

...}
```
The code is organized thusly:

 - Models
	 - [TicTacToe.swift](https://github.com/travischapman/TicTacToe/blob/master/TicTacToe/Models/TicTacToe.swift)
 - Controllers
	 - [TicTacToeController.swift](https://github.com/travischapman/TicTacToe/blob/master/TicTacToe/ModelControllers/TicTacToeController.swift)
	 - [TicTacToeViewController.swift](https://github.com/travischapman/TicTacToe/blob/master/TicTacToe/ViewControllers/TicTacToeViewController.swift)
	 - [PlayerNameViewController.swift](https://github.com/travischapman/TicTacToe/blob/master/TicTacToe/ViewControllers/PlayerNameViewController.swift)
 - Storyboards
	 - [Main.storyboard](https://github.com/travischapman/TicTacToe/blob/master/TicTacToe/Storyboards/Base.lproj/Main.storyboard)

## Other Authors

* *Bailey McDaris* - [baileylynncodes](https://github.com/baileylynncodes)
