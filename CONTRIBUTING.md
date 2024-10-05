# Contributing to taskup

Thank you for considering contributing to taskup! Your involvement is crucial to the growth and improvement of this project. Below are some guidelines to help you make meaningful contributions.

## 🌟 Why Contribute?

Contributing to open-source projects like taskup is a great way to:

- Improve your coding skills
- Collaborate with other developers
- Gain experience with Flutter, Riverpod and Firebase
- Enhance the functionality and usability of the application

## 🧑‍🤝‍🧑 How to Contribute

### 1. **Fork the Repository**

Start by forking the repository on GitHub to create your copy of the project.

### 2. **Clone Your Fork**

Clone your forked repository to your local machine:

```bash
git clone https://github.com/bedirhansaglam/taskup.git
```

### 3. **Install Firebase Files**
Make sure to configure Firebase for the project by adding the required Firebase configuration files (`google-services.json` for Android and `GoogleService-Info.plist` for iOS) to the appropriate directories. You can find the necessary files by setting up Firebase for your application in the Firebase console.

### 4. **Write Tests**
Tests are essential for maintaining the quality and reliability of the application. Before you submit your changes:

- Write unit tests for any new features or functions you - introduce.
- Ensure that existing tests still pass after your changes.
- Run all tests using the following command:

```bash
flutter test
```

### 5. **Check Code Style**
Before submitting your changes, ensure your code follows the project's style guidelines by running:

```bash
dart format .
```

### 6. **Avoid Side Effects**
Ensure that the changes you introduce do not cause any unintended side effects in the application. Do not add comments to your code, as the philosophy here is that code should be self-explanatory. If you feel a comment is necessary, it's a sign that the code may need to be improved for clarity.

### 7. **Submit a Pull Request**
Once you've made your changes and tested them, submit a pull request. Please provide a clear description of your changes and reference any relevant issues.

🤝 Code Reviews
All contributions will be reviewed.

🎉 Appreciation for Improvements
Even minor improvements are valuable! Whether it's a refactor, renaming a variable for better clarity, or optimizing a function, these changes contribute significantly to the overall health of the project. We appreciate your attention to detail and commitment to enhancing taskup!

Feel free to change any code that doesn't make sense to you. If you find that a part of the code is difficult to understand or follow, you're encouraged to improve it—because if you don't understand it, the code likely isn't written clearly enough. Clarity in code is crucial for maintainability and collaboration, so your changes will help everyone.

##### Why We Avoid Comments
As Uncle Bob explains in 'Clean Code' (Chapter 4: Comments, p. 54):

> "The proper use of comments is to compensate for our failure to express ourselves in code. Note that I used the word failure. I meant it. Comments are always failures. We must have them because we cannot always figure out how to express ourselves without them, but their use is not a cause for celebration.
>
> So when you find yourself in a position where you need to write a comment, think it through and see whether there isn’t some way to turn the tables and express yourself in code. Every time you express yourself in code, you should pat yourself on the back. Every time you write a comment, you should grimace and feel the failure of your ability of expression.
>
> Why am I so down on comments? Because they lie. Not always, and not intentionally, but too often. The older a comment is, and the farther away it is from the code it describes, the more likely it is to be just plain wrong. The reason is simple. Programmers can’t realistically maintain them.
>
> Code changes and evolves. Chunks of it move from here to there. Those chunks bifurcate and reproduce and come together again to form chimeras. Unfortunately the comments don’t always follow them—can’t always follow them. And all too often the comments get separated from the code they describe and become orphaned blurbs of ever-decreasing accuracy."

In taskup, we strive to write code that is self-explanatory and avoid comments as much as possible. If you feel the need to write a comment, take a moment to reconsider the structure of your code. Can you refactor it to make it clearer without needing an explanation?

📫 Questions and Support
If you have any questions about contributing, feel free to reach out via GitHub issues or contact me directly.
📧: bedirhansaglam270@gmail.com

Thank you for your interest in contributing to taskup!
