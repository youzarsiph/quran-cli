# Contributing to Qur'an CLI

We appreciate your interest in contributing to the Qur'an CLI project. Your contributions help improve the tool, making it more reliable, efficient, and user-friendly for scholars, researchers, and enthusiasts. This guide provides detailed instructions on how to contribute, ensuring a smooth and effective process for collaboration.

## Code of Conduct

Before contributing, please review our [Code of Conduct](CODE_OF_CONDUCT.md). We expect all participants to adhere to these guidelines to maintain a positive and respectful community.

## Getting Started

1. **Fork the Repository:**
   - Click on the "Fork" button at the top of the [repository](https://github.com/youzarsiph/quran-cli) page to create your personal copy.

2. **Clone Your Fork:**

   ```bash
   git clone https://github.com/your-username/quran-cli.git
   cd quran-cli
   ```

3. **Set Up a Virtual Environment:**

   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows use: venv\Scripts\activate
   ```

4. **Install Dependencies:**

   ```bash
   pip install -r requirements.txt
   ```

5. **Install Pre-commit Hooks:**
   - We use pre-commit hooks to ensure code quality and consistency.

   ```bash
   pre-commit install
   ```

## How to Contribute

### Reporting Issues

- **Ensure the Issue is New:**
  - Check if the issue has already been reported by searching open issues in the [issue tracker](https://github.com/youzarsiph/quran-cli/issues).
  
- **Create a New Issue:**
  - Provide a clear and concise description of the problem, including steps to reproduce it.
  - If applicable, include error messages, screenshots, or logs to help identify the issue.

### Submitting Pull Requests

1. **Create a New Branch:**
   - Always branch from the `main` branch to create a fix or add a feature.

   ```bash
   git checkout -b <feature-or-fix-name>
   ```

2. **Make Changes and Commit:**
   - Commit your changes with clear, descriptive commit messages.

   ```bash
   git add .
   git commit -m "Add <feature-or-fix-name>"
   ```

3. **Run Tests:**
   - Ensure all existing tests pass and add new tests if necessary.

   ```bash
   pytest
   ```

4. **Push Changes:**

   ```bash
   git push origin <feature-or-fix-name>
   ```

5. **Create a Pull Request:**
   - Go to the [pull request page](https://github.com/youzarsiph/quran-cli/pulls) and click "New Pull Request".
   - Fill in the pull request template with a detailed description of your changes.
   - Reference any resolved issues by number, e.g., "Fixes #123".

6. **Code Review:**
   - A maintainer will review your pull request. Be prepared to address feedback and make additional changes if needed.

7. **Merge:**
   - Once your pull request is approved, it will be merged into the `main` branch.

## Coding Standards

### Style Guides

- **Python Code**: Follows [PEP 8](https://peps.python.org/pep-0008/).
- **Commit Messages**: Adhere to the [Conventional Commits](https://www.conventionalcommits.org/) specification.

### Dependency Management

- **Dependency Updates**: Use [`pip-tools`](https://github.com/jazzband/pip-tools) to manage dependency versions.
- **Submitting Dependency Updates**: Create a pull request with a description of the updates.

### Documentation

- **Updating Readme**: Ensure the [README](README.md) and [Contributing Guide](CONTRIBUTING.md) are up-to-date.
- **Writing Tests**: Include comprehensive tests for new features or modifications to existing functionality.

## Continuous Integration and Deployment (CI/CD)

- **Automated Testing**: Pull requests will trigger automated tests via GitHub Actions.
- **Linting and Formatting**: Automated code quality checks are performed on each commit.

## Security Best Practices

- **Regular Audits**: Regularly audit the codebase for security vulnerabilities.
- **Dependency Vulnerabilities**: Monitor for vulnerabilities in dependencies using tools like [Dependabot](https://docs.github.com/en/code-security/dependabot).

## Community Guidelines

- **Respect**: Treat all community members with respect and kindness.
- **Participation**: Promote constructive discussions and collaboration.
- **Feedback**: Provide and accept feedback professionally.

## License

By contributing to the Qur'an CLI project, you agree to abide by its [MIT License](LICENSE), ensuring that your contributions are freely available to the community.

## Contact

For any inquiries, issues, or feedback, please reach out via:

- **Maintainer**: Yousuf Abu Shanab
- **GitHub Issues**: [Open an Issue](https://github.com/youzarsiph/quran-cli/issues)

Your contributions are vital to the growth and success of the Qur'an CLI project. Thank you for your support!
