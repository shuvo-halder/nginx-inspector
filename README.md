
# Nginx Inspector
![Bash](https://img.shields.io/badge/Bash-Script-green)
![Linux](https://img.shields.io/badge/Platform-Linux-blue)
![License](https://img.shields.io/badge/License-MIT-yellow)

**Nginx Inspector** is a simple CLI tool that analyzes Nginx access logs.
It helps developers and system administrators quickly understand traffic, errors, and possible attacks.

The tool is written in **Bash** and works on most Linux systems.

GitHub Repository:
https://github.com/shuvo-halder/nginx-inspector

---

# Features

### Log Analysis

* Top IP address analysis
* Top requested URLs
* HTTP status code statistics
* User agent analysis
* 404 error report
* Suspicious IP detection
* Bandwidth usage statistics

### Security Detection

Using the attack detector script:

* SQL Injection detection
* XSS attack detection
* Directory traversal detection
* Command injection detection
* Scanner tool detection (sqlmap, nikto, etc.)
* Brute-force login detection
* Suspicious high request IP detection

---

# Installation

Clone the repository:

```
git clone https://github.com/shuvo-halder/nginx-inspector.git
```

Move into the project folder:

```
cd nginx-inspector
```

Simple run this command:

```
bash install.sh
```

---

# Usage

Run the main analyzer:

```
nginx-inspector start
```

The script will show a menu.
Choose the analysis option by entering the number.

Example:

```
1 → Top IP analysis
2 → Top URL analysis
3 → Status code analysis
4 → Run Attack Detection
5 → Real-time Monitor
6 → Generate JSON Report

```

---

Log Analyze

You can run the analyzer separately:

```
nginx-inspector analyze /var/log/nginx/access.log
```

This script scans logs for common web attacks and suspicious behavior.

---

Attack Detection

You can run the security analyzer separately:

```
nginx-inspector attack /var/log/nginx/access.log
```

Web Interface

```
nginx-inspector web
```

JSON API

```
nginx-inspector api
```




