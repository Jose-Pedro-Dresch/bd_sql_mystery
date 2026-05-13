# LinkedIn SQL Mystery

Um desafio investigativo de SQL inspirado no clássico SQL Murder Mystery.

---

# Contexto

No dia **14 de março de 2026**, a plataforma profissional fictícia **TechLink Solutions** registrou uma atividade extremamente suspeita.

Uma vaga de emprego recém-publicada começou a receber dezenas de candidaturas em poucos minutos.

Inicialmente, isso parecia apenas uma vaga popular.

Mas os moderadores perceberam algo estranho:

* várias contas haviam sido criadas recentemente;
* os candidatos possuíam competências quase idênticas;
* diversos comentários no post da vaga pareciam coordenados;
* alguns usuários estavam fortemente conectados entre si;
* e uma pessoa específica parecia estar manipulando toda a operação.

A equipe de segurança decidiu abrir uma investigação.

Sua missão é descobrir:

1. Qual vaga estava sendo usada na fraude.
2. Quem eram os perfis falsos.
3. Quem coordenou os comentários suspeitos.
4. Qual empresa estava envolvida.
5. Quem era o mentor intelectual por trás de toda a operação.

---

# Objetivo

Resolver o mistério usando apenas consultas SQL.

---

# Regras

* Você pode usar apenas comandos SQL.
* Não altere os dados.
* Não modifique a estrutura do banco.
* O mistério deve ser resolvido usando consultas investigativas.
* Você pode criar VIEWs e CTEs temporárias.

---

# Banco de Dados

O banco simula uma versão simplificada do LinkedIn.

Ele possui tabelas relacionadas a:

* usuários pessoais;
* empresas;
* vagas de emprego;
* candidaturas;
* competências;
* experiências profissionais;
* conexões;
* posts;
* comentários;
* reações;
* idiomas.

---

# Arquivos do Projeto

```text
.
├── README.md
├── schema.sql
├── inserts.sql
├── mystery_description.md
├── hints/
│   ├── hint1.md
│   ├── hint2.md
│   ├── hint3.md
│   └── hint4.md
└── solution/
    ├── solution.sql
    └── explanation.md
```

---

# Como Executar

## 1. Criar o banco

```bash
createdb linkedin_mystery
```

---

## 2. Criar as tabelas

```bash
psql -d linkedin_mystery -f schema.sql
```

---

## 3. Inserir os dados

```bash
psql -d linkedin_mystery -f inserts.sql
```

---

## 4. Entrar no PostgreSQL

```bash
psql -d linkedin_mystery
```

---

# Primeiras Pistas

## Pista 1

A vaga suspeita:

* foi criada no mesmo dia do incidente;
* recebeu múltiplas candidaturas em sequência;
* pertence a uma empresa de tecnologia.

---

## Pista 2

Os perfis falsos:

* foram criados recentemente;
* possuem as mesmas competências;
* possuem conexões entre si;
* comentaram no mesmo post.

---

## Pista 3

O coordenador dos comentários:

* comentou no post da vaga;
* reagiu ao mesmo post;
* possui muitas conexões;
* possui múltiplos idiomas cadastrados.

---

## Pista 4

O mentor final:

* já trabalhou na empresa investigada;
* possui conexões estratégicas;
* encerrou recentemente uma experiência profissional;
* parece estar ligado tanto ao recrutador quanto aos perfis falsos.

---

# Perguntas da Investigação

Ao final, você deve responder:

| Pergunta                                | Resposta |
| --------------------------------------- | -------- |
| Qual vaga estava sendo usada na fraude? | ???      |
| Quem eram os perfis falsos?             | ???      |
| Quem coordenou os comentários?          | ???      |
| Qual empresa estava envolvida?          | ???      |
| Quem era o mentor final?                | ???      |

---

# Dicas

Provavelmente você precisará usar:

```sql
JOIN
GROUP BY
HAVING
COUNT
ORDER BY
subqueries
CTEs
```

---

# Exemplos de Consultas Úteis

## Encontrar vagas com muitas candidaturas

```sql
SELECT v.TtloVaga, COUNT(*)
FROM VAGAEMPREGO v
JOIN APLICAAVAGA a
    ON v.IDVagaEmp = a.fk_VAGAEMPREGO
GROUP BY v.TtloVaga;
```

---

## Encontrar contas criadas recentemente

```sql
SELECT *
FROM CONTA
WHERE DtCrcaoConta >= '2026-03-10';
```

---

## Encontrar usuários com competências iguais

```sql
SELECT p.NomPsso, c.NomeComp
FROM POSSCOMP pc
JOIN PESSOAL p
    ON p.fk_CONTA = pc.fk_PESSOAL
JOIN COMPETENCIA c
    ON c.IDComp = pc.fk_COMPETENCIA;
```

---

## Encontrar usuários que comentaram e reagiram ao mesmo post

```sql
SELECT DISTINCT c.fk_CONTA
FROM COMENTARIO c
JOIN REAGEPOST r
    ON c.fk_CONTA = r.fk_CONTA
   AND c.fk_POST = r.fk_POST;
```

---

# Conceitos Trabalhados

O desafio envolve:

* modelagem relacional;
* relacionamentos N:N;
* auto JOIN;
* análise temporal;
* agregações;
* investigação baseada em dados;
* raciocínio lógico com SQL.

---

# Inspirações

* SQL Murder Mystery
* Knight Lab
* desafios investigativos em banco de dados
* LinkedIn

---

# Boa sorte, investigador.
