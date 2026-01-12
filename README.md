# Nginx Log Analyser

A simple **shell script** to analyze Nginx access logs and extract useful insights.  
This project is hosted here: [nginx-log-analyser](https://github.com/shuvo-halder/nginx-log-analyser)

---

## 📂 Files
- `analyze_nginx.sh` → The main shell script
- `access.log` → Sample Nginx access log file (input)

---

## ⚙️ Requirements
- Linux/Unix environment
- Bash shell
- Standard tools: `awk`, `sort`, `uniq`, `head`

---

## ▶️ Usage
Clone the repository and run the script with your Nginx access log file:

```bash
git clone https://github.com/shuvo-halder/nginx-log-analyser.git
cd nginx-log-analyser
chmod +x analyze_nginx.sh
./analyze_nginx.sh access.log
```

Project: [project](https://roadmap.sh/projects/nginx-log-analyser)
