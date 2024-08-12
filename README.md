# Hangman Game 🎮

This repository contains the source code for a classic Hangman game built using Swift and UIKit. The game challenges players to guess a randomly selected word, one letter at a time, while trying to avoid completing the hangman.

## Features ✨

- **Random Word Selection**: Words are randomly chosen from a predefined list for each new round.
- **Dynamic UI**: The hangman image updates with each incorrect guess, adding suspense to the game.
- **Win/Loss Tracking**: The game keeps track of your wins and losses throughout your session.
- **Interactive Gameplay**: Players can select letters to guess, with the interface providing instant feedback.
- **Alert Dialogs**: The game provides alerts at the end of each round, offering options to replay or end the game.

## Installation 🛠️

To run this project on your local machine, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/HangmanGame.git

### Open in Xcode:
- Open the `.xcodeproj` file in Xcode.

### Build and Run:
- Select a simulator or connected device, then click the **Run** button in Xcode to build and launch the game.

### Usage 📲
1. **Launch the app**.
2. A new word is randomly selected at the beginning of each round.
3. Use the on-screen keyboard to guess letters.
4. The hangman image updates with each incorrect guess.
5. If you guess the word before completing the hangman, you win the round. Otherwise, you lose.
6. An alert will appear at the end of each round, allowing you to start a new game or end the session.

### Code Overview 📝
- **Hangman.swift**: Contains the `Hangman` struct, which manages the word list and selects random words for each game.
- **ViewController.swift**: Handles the main game logic, including UI updates, win/loss tracking, and user interactions.

### Contributing 🤝
Contributions are welcome! If you have any improvements or bug fixes, feel free to submit a pull request.

### Contact 📧
If you have any questions or feedback, feel free to reach out via [LinkedIn](https://www.linkedin.com/in/raj-rana-a9b8a5138/) or open an issue on this repository.
