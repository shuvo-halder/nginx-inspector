# Nginx Inspector

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

Make scripts executable:

```
chmod +x nginx-inspector.sh
chmod +x attack-detector.sh
```

---

# Usage

Run the main analyzer:

```
./nginx-inspector.sh /var/log/nginx/access.log
```

The script will show a menu.
Choose the analysis option by entering the number.

Example:

```
1 → Top IP analysis
2 → Top URL analysis
3 → Status code analysis
```

---

# Attack Detection

You can run the security analyzer separately:

```
./attack-detector.sh /var/log/nginx/access.log
```

This script scans logs for common web attacks and suspicious behavior.

---

# Example Output

```
Top 10 IP Addresses
1200 192.168.1.10
900  192.168.1.25

Top Requested URLs
/index.html
/login
/api/products

Possible SQL Injection Attempts
5

Possible XSS Attempts
2
```





