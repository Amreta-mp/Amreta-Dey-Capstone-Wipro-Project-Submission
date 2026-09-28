# 🛒 E-Commerce Web Automation Framework

### Wipro Capstone Project · Assignment 4

> **An end-to-end web automation framework built with Robot Framework, SeleniumLibrary, Python and Jenkins for testing critical e-commerce workflows.**

---

##  Overview

This project is an automated testing framework designed for an e-commerce web application.

The framework combines **Robot Framework** for readable keyword-driven test automation, **SeleniumLibrary** for browser automation, and **Python** for custom utilities, data handling and validation logic.

The framework is designed to automate and validate important user journeys such as:

**Login → Product Search → Add to Cart → Cart Validation → Logout**

It also includes structured test organization, reusable components, data-driven testing, execution reports, logs, screenshots and Jenkins-based CI execution.

---

##  Project Objectives

- Automate critical e-commerce user workflows.
- Build a reusable and maintainable Robot Framework structure.
- Integrate Selenium-based browser automation.
- Implement Page Object Model principles.
- Integrate Python for custom automation logic.
- Support data-driven testing using external test data.
- Separate smoke, regression and negative test scenarios.
- Generate execution reports and logs.
- Capture screenshots for failure analysis.
- Integrate automated test execution with Jenkins.

---

## 🧰 Technology Stack

| Technology | Purpose |
|---|---|
| **Robot Framework** | Keyword-driven test automation |
| **SeleniumLibrary** | Selenium-based browser automation |
| **Selenium WebDriver** | Browser interaction |
| **Python** | Custom utilities, validation and data handling |
| **CSV** | External test data |
| **Jenkins** | Continuous Integration and automated execution |
| **GitHub** | Source code management |
| **HTML Reports** | Test execution results |
| **Screenshots** | Failure/debugging evidence |

---

## 🏗️ Framework Architecture

```mermaid
flowchart TD

    A[Test Cases] --> B[Robot Framework]
    B --> C[Reusable Keywords]
    C --> D[SeleniumLibrary]
    D --> E[Selenium WebDriver]
    E --> F[Web Browser]

    C --> G[Page Objects]
    C --> H[Python Libraries]

    H --> I[Custom Validation]
    H --> J[Test Data Processing]
    H --> K[Utility Functions]

    L[CSV Test Data] --> H

    B --> M[Test Results]
    M --> N[HTML Reports]
    M --> O[Execution Logs]
    M --> P[Failure Screenshots]

    Q[Jenkins] --> B
