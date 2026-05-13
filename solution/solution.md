# Solution — LinkedIn SQL Mystery

> ⚠️ Contém spoilers completos do mistério.

---

# Objetivo da Investigação

Descobrir:

1. Qual vaga estava sendo usada na fraude.
2. Quem eram os perfis falsos.
3. Quem coordenou os comentários.
4. Qual empresa estava envolvida.
5. Quem era o mentor intelectual da operação.

---

# Etapa 1 — Encontrar a vaga suspeita

A primeira pista dizia que:

* a vaga foi criada no dia do incidente;
* recebeu muitas candidaturas;
* pertence a uma empresa de tecnologia.

Consulta:

```sql
SELECT v.IDVagaEmp,
       v.TtloVaga,
       c.NomComerc,
       COUNT(*) AS total_candidaturas
FROM VAGAEMPREGO v
JOIN CORPORATIVA c
    ON c.fk_CONTA = v.fk_CORPORATIVA
JOIN APLICAAVAGA a
    ON a.fk_VAGAEMPREGO = v.IDVagaEmp
WHERE v.DtCrcaoVaga = '2026-03-14'
GROUP BY v.IDVagaEmp, v.TtloVaga, c.NomComerc;
```

Resultado:

| Vaga                 | Empresa            |
| -------------------- | ------------------ |
| Senior Data Engineer | TechLink Solutions |

---

# Etapa 2 — Encontrar os perfis falsos

A segunda pista dizia que os perfis:

* foram criados recentemente;
* possuem as mesmas competências;
* estão conectados entre si.

Consulta:

```sql
SELECT p.NomPsso,
       p.SobnomPsso,
       c.DtCrcaoConta
FROM PESSOAL p
JOIN CONTA c
    ON c.IDConta = p.fk_CONTA
WHERE c.DtCrcaoConta >= '2026-03-10';
```

Perfis suspeitos:

* Arnaldo Bertoldi
* Marlon Alves
* Israel Marcelino

---

Consulta das competências:

```sql
SELECT p.NomPsso,
       comp.NomeComp
FROM POSSCOMP pc
JOIN PESSOAL p
    ON p.fk_CONTA = pc.fk_PESSOAL
JOIN COMPETENCIA comp
    ON comp.IDComp = pc.fk_COMPETENCIA
WHERE p.fk_CONTA IN (7,8,9)
ORDER BY comp.NomeComp;
```

Resultado:

Todos possuíam exatamente:

* Python
* SQL
* Docker

---

Consulta das conexões:

```sql
SELECT *
FROM CONEXAO
WHERE fk_PESSOAL_1 IN (7,8,9)
  AND fk_PESSOAL_2 IN (7,8,9);
```

Conclusão:

Os três perfis foram criados artificialmente para aumentar o volume de candidaturas e interações.

---

# Etapa 3 — Encontrar o coordenador dos comentários

A terceira pista dizia que o coordenador:

* comentou no post;
* reagiu ao mesmo post;
* possuía múltiplos idiomas.

Consulta:

```sql
SELECT DISTINCT p.NomPsso,
                p.SobnomPsso
FROM COMENTARIO c
JOIN REAGEPOST r
    ON r.fk_CONTA = c.fk_CONTA
   AND r.fk_POST = c.fk_POST
JOIN PESSOAL p
    ON p.fk_CONTA = c.fk_CONTA;
```

Resultado:

* Fernanda Rocha

---

Consulta dos idiomas:

```sql
SELECT p.NomPsso,
       i.NomeIdioma
FROM FALAIDIOM f
JOIN IDIOMA i
    ON i.IDIdioma = f.fk_IDIOMA
JOIN PESSOAL p
    ON p.fk_CONTA = f.fk_PESSOAL
WHERE p.fk_CONTA = 6;
```

Resultado:

Fernanda falava:

* Português
* Inglês
* Espanhol
* Alemão

Conclusão:

Fernanda Rocha coordenava os comentários automatizados para aumentar artificialmente o engajamento da vaga.

---

# Etapa 4 — Encontrar a empresa envolvida

Consulta:

```sql
SELECT DISTINCT c.NomComerc
FROM CORPORATIVA c
JOIN VAGAEMPREGO v
    ON v.fk_CORPORATIVA = c.fk_CONTA
JOIN APLICAAVAGA a
    ON a.fk_VAGAEMPREGO = v.IDVagaEmp;
```

Resultado:

* TechLink Solutions

---

# Etapa 5 — Encontrar o mentor final

A última pista dizia que o mentor:

* já trabalhou na empresa;
* encerrou recentemente uma experiência profissional;
* possuía conexões com recrutadores e envolvidos.

Consulta:

```sql
SELECT p.NomPsso,
       p.SobnomPsso,
       e.DtFimExp
FROM EXPERIENCIAPROF e
JOIN PESSOAL p
    ON p.fk_CONTA = e.fk_PESSOAL
WHERE e.DtFimExp IS NOT NULL
ORDER BY e.DtFimExp DESC;
```

Resultado:

* Fernanda Rocha

---

Consulta das conexões:

```sql
SELECT *
FROM CONEXAO
WHERE fk_PESSOAL_1 = 6
   OR fk_PESSOAL_2 = 6;
```

Conclusão:

Fernanda Rocha:

* possuía conexões estratégicas;
* trabalhou anteriormente na empresa;
* coordenava os comentários;
* estava ligada aos recrutadores.

Ela era a mentora intelectual da fraude.

---

# Resposta Final

| Pergunta                        | Resposta                                          |
| ------------------------------- | ------------------------------------------------- |
| Qual vaga estava sendo usada?   | Senior Data Engineer                              |
| Quem eram os perfis falsos?     | Arnaldo Bertoldi, Marlon Alves e Israel Marcelino |
| Quem coordenava os comentários? | Fernanda Rocha                                    |
| Qual empresa estava envolvida?  | TechLink Solutions                                |
| Quem era o mentor final?        | Fernanda Rocha                                    |

---

# Explicação do Esquema

A fraude funcionava da seguinte forma:

1. A empresa publicava uma vaga estratégica.
2. Contas falsas eram criadas rapidamente.
3. Essas contas aplicavam para a vaga.
4. Os perfis comentavam e reagiam para gerar engajamento artificial.
5. Fernanda Rocha coordenava toda a operação utilizando sua rede de conexões internas.