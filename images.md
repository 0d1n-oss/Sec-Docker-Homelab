# Instalar las imagenes vulnerables

## Imagenes vulnerables.

Estas son algunas imagenes vulnerables recomendadas, las cuales poseen caracteristicas entretenidas para explorar, aprender y practicar conceptos de pentesting, analisis, explotacion, etc...

---

### DVWA

**Damn Vulnerable Web Application**
Aplicación web intencionalmente vulnerable en PHP/MySQL para practicar vulnerabilidades clásicas como SQLi, XSS, CSRF y command injection. Permite cambiar el nivel de dificultad (Low → Impossible).

``` bash
docker run --rm -it -p 80:80 sagikazarmark/dvwa
```

---

### SSRF Vulnerable Lab

Laboratorio diseñado específicamente para practicar **Server-Side Request Forgery (SSRF)**. Permite aprender cómo forzar a un servidor a realizar peticiones internas (localhost, metadata cloud, etc.) y entender cómo se mitiga.


``` bash
docker run -d --name ssrf-lab -p 9000:80 youyouorz/ssrf-vulnerable-lab
```

---

### DVWS

**Damn Vulnerable Web Services**
Similar a DVWA pero enfocado en **servicios web y APIs REST**, no en aplicaciones web tradicionales. Ideal para practicar ataques contra APIs (auth bypass, tokens, inyecciones).


``` bash
docker run -d -p 80:80 -p 8088:8080 tssoffsec/dvws
```

---

### bWAPP

**bWAPP**
“Buggy Web Application”. Contiene más de 100 vulnerabilidades distintas (OWASP Top 10 y más). Muy completo para practicar múltiples vectores en una sola app.


``` bash
docker run -d -p 8000:80 raesene/bwapp
```

---

### WebGoat

**OWASP WebGoat**
Proyecto educativo de OWASP con lecciones guiadas. Enseña paso a paso vulnerabilidades web y cómo explotarlas y mitigarlas.


``` bash
docker run -p 127.0.0.1:9000:8080 -p 127.0.0.1:9090:9090 webgoat/webgoat
```

---

### Juice Shop

**OWASP Juice Shop**
Aplicación moderna tipo e-commerce vulnerable. Muy usada en CTFs. Incluye retos progresivos y cubre OWASP Top 10 actual.


``` bash
docker run --rm -p 3000:3000 bkimminich/juice-shop
```

---

### SQLi Vulnerable Lab

Laboratorio específico para practicar **SQL Injection** (boolean-based, union-based, blind, time-based). Enfocado únicamente en inyecciones SQL para dominar esta técnica.


``` bash
docker run -d -p 8080:80 acgpiano/sqli-labs:latest
```

---

