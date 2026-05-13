-- =========================
-- PAÍSES / ESTADOS / CIDADES
-- =========================

INSERT INTO PAIS (NomPais)
VALUES ('Brasil');

INSERT INTO ESTADO (NomEstado, fk_PAIS)
VALUES
('Santa Catarina', 1),
('São Paulo', 1);

INSERT INTO CIDADE (NomCidade, fk_ESTADO)
VALUES
('Florianópolis', 1),
('Joinville', 1),
('São Paulo', 2);

-- =========================
-- CONTAS
-- =========================

INSERT INTO CONTA (EmailConta, SenhaConta, DtCrcaoConta, fk_CIDADE)
VALUES
('ana@techlink.com', '123', '2025-01-10', 3),
('bruno@gmail.com', '123', '2026-03-10', 1),
('carla@gmail.com', '123', '2026-03-11', 1),
('diego@gmail.com', '123', '2026-03-11', 1),
('eduardo@gmail.com', '123', '2024-08-01', 2),
('fernanda@gmail.com', '123', '2023-04-20', 3),
('arnaldobertoldi@gmail.com', '123', '2026-03-13', 1),
('marlonalves@gmail.com', '123', '2026-03-13', 1),
('israelmarcelino@gmail.com', '123', '2026-03-13', 1),
('recruiter@techlink.com', '123', '2024-02-10', 3);

-- =========================
-- PESSOAIS
-- =========================

INSERT INTO PESSOAL (fk_CONTA, NomPsso, SobnomPsso, TtloProfPsso)
VALUES
(2, 'Bruno', 'Silva', 'Data Engineer'),
(3, 'Carla', 'Mendes', 'Backend Developer'),
(4, 'Diego', 'Souza', 'DevOps Engineer'),
(5, 'Eduardo', 'Lima', 'Senior Recruiter'),
(6, 'Fernanda', 'Rocha', 'Software Architect'),
(7, 'Arnaldo', 'Bertoldi', 'Data Engineer'),
(8, 'Marlon', 'Alves', 'Data Engineer'),
(9, 'Israel', 'Marcelino', 'Data Engineer'),
(10, 'Patricia', 'Almeida', 'Tech Recruiter');

-- =========================
-- CORPORATIVAS
-- =========================

INSERT INTO CORPORATIVA (fk_CONTA, NomComerc, NumFuncEmp, DescriEmp)
VALUES
(1, 'TechLink Solutions', 500, 'Empresa de tecnologia especializada em dados');

INSERT INTO CORPORATIVA_SETOREMP (SetorEmp, fk_CORPORATIVA)
VALUES
('Tecnologia', 1);

-- =========================
-- COMPETÊNCIAS
-- =========================

INSERT INTO COMPETENCIA (NomeComp)
VALUES
('Python'),
('SQL'),
('Docker'),
('Kubernetes'),
('Machine Learning');

-- =========================
-- IDIOMAS
-- =========================

INSERT INTO IDIOMA (NomeIdioma)
VALUES
('Português'),
('Inglês'),
('Espanhol'),
('Alemão');

-- =========================
-- COMPETÊNCIAS DOS PERFIS FALSOS
-- =========================

INSERT INTO POSSCOMP (fk_COMPETENCIA, fk_PESSOAL)
VALUES
(1,7), (2,7), (3,7),
(1,8), (2,8), (3,8),
(1,9), (2,9), (3,9);

-- =========================
-- COMPETÊNCIAS REAIS
-- =========================

INSERT INTO POSSCOMP (fk_COMPETENCIA, fk_PESSOAL)
VALUES
(1,2), (2,2), (3,2),
(1,3), (2,3),
(2,4), (3,4), (4,4),
(1,6), (2,6), (5,6);

-- =========================
-- IDIOMAS
-- =========================

INSERT INTO FALAIDIOM (NvlProfic, fk_IDIOMA, fk_PESSOAL)
VALUES
('Nativo', 1, 6),
('Avançado', 2, 6),
('Intermediário', 3, 6),
('Básico', 4, 6),

('Nativo', 1, 2),
('Avançado', 2, 2),

('Nativo', 1, 5),
('Avançado', 2, 5);

-- =========================
-- EXPERIÊNCIAS PROFISSIONAIS
-- =========================

INSERT INTO EXPERIENCIAPROF
(TituloExp, TipoEmpregoExp, DtInicioExp, DtFimExp, DescAtv, fk_PESSOAL, fk_CORPORATIVA)
VALUES
('Recruiter', 'CLT', '2024-01-01', NULL,
'Recrutamento técnico', 5, 1),

('Software Architect', 'CLT', '2023-01-01', '2026-02-20',
'Arquitetura de sistemas distribuídos', 6, 1),

('Data Engineer', 'CLT', '2025-01-01', NULL,
'Pipelines de dados', 2, 1);

-- =========================
-- VAGA SUSPEITA
-- =========================

INSERT INTO VAGAEMPREGO
(TtloVaga, DescriVaga, FormatoTrabVaga, DtCrcaoVaga, fk_CORPORATIVA)
VALUES
('Senior Data Engineer',
'Vaga estratégica para engenharia de dados',
'REMOTO',
'2026-03-14',
1);

-- =========================
-- CANDIDATURAS
-- =========================

INSERT INTO APLICAAVAGA
(DtAplccao, SttusAplccao, fk_VAGAEMPREGO, fk_PESSOAL)
VALUES
('2026-03-14 10:00:00', 'EM_ANALISE', 1, 2),
('2026-03-14 10:01:00', 'EM_ANALISE', 1, 3),
('2026-03-14 10:02:00', 'EM_ANALISE', 1, 4),
('2026-03-14 10:03:00', 'EM_ANALISE', 1, 7),
('2026-03-14 10:04:00', 'EM_ANALISE', 1, 8),
('2026-03-14 10:05:00', 'EM_ANALISE', 1, 9);

-- =========================
-- POSTS
-- =========================

INSERT INTO POST
(DtPubliPost, ConteudoPost, NivelVisib, fk_CONTA)
VALUES
('2026-03-14 09:00:00',
'Estamos contratando Senior Data Engineers!',
'PUBLICO',
1);

-- =========================
-- COMENTÁRIOS COORDENADOS
-- =========================

INSERT INTO COMENTARIO
(ConteudoTxtCom, DtPubliCom, fk_POST, fk_CONTA)
VALUES
('Excelente oportunidade!', '2026-03-14 09:05:00', 1, 6),
('Empresa incrível!', '2026-03-14 09:06:00', 1, 7),
('Quero muito participar!', '2026-03-14 09:06:30', 1, 8),
('Processo seletivo top!', '2026-03-14 09:07:00', 1, 9);

-- =========================
-- REAÇÕES
-- =========================

INSERT INTO REAGEPOST
(DtReacao, TipoReacao, fk_CONTA, fk_POST)
VALUES
('2026-03-14 09:05:00', 'LIKE', 6, 1),
('2026-03-14 09:05:10', 'LIKE', 7, 1),
('2026-03-14 09:05:20', 'LIKE', 8, 1),
('2026-03-14 09:05:30', 'LIKE', 9, 1);

-- =========================
-- CONEXÕES
-- =========================

INSERT INTO CONEXAO
(DtEnvConv, DtAceitConv, StatusConexao, fk_PESSOAL_1, fk_PESSOAL_2)
VALUES
('2026-03-13 08:00:00', '2026-03-13 08:01:00', 'ACEITA', 7, 8),
('2026-03-13 08:02:00', '2026-03-13 08:03:00', 'ACEITA', 8, 9),
('2026-03-13 08:04:00', '2026-03-13 08:05:00', 'ACEITA', 7, 9),

('2025-06-01 10:00:00', '2025-06-01 10:01:00', 'ACEITA', 5, 6),
('2025-06-02 10:00:00', '2025-06-02 10:01:00', 'ACEITA', 2, 6),
('2025-06-03 10:00:00', '2025-06-03 10:01:00', 'ACEITA', 5, 2);

-- =========================
-- FORMAÇÕES
-- =========================

INSERT INTO FORMACAOACAD
(NomInstitForm, GrauForm, AreaForm, DtInicioForm, DtFimForm, fk_PESSOAL)
VALUES
('UFSC', 'Bacharelado', 'Ciência da Computação',
'2018-01-01', '2022-12-01', 2),

('USP', 'Mestrado', 'Engenharia de Software',
'2017-01-01', '2019-12-01', 6);
