USE Loja;

INSERT INTO Usuario (login, senha)
VALUES ('op1', 'op1'),
('op2', 'op2'),
('op3', 'op3'),
('op4', 'op4');

INSERT INTO Produto (idProduto, nome, quantidade, precoVenda)
VALUES ('1', 'Banana', '100', '5.00'),
('3', 'Laranja', '500', '2.00'),
('4', 'Manga', '800', '4.00');

INSERT INTO Pessoa (idPessoa, nome, logradouro, cidade, estado, telefone, email)
VALUES 
(NEXT VALUE FOR ordemPessoaId, 'Gisele', 'Rua X, 10', 'Rio De Janeiro', 'RJ', '1111-1111', 'gisele@gmail.com'),
(NEXT VALUE FOR ordemPessoaId, 'Stevão', 'Rua Y, 20', 'Porto Alegre', 'RS', '2222-2222', 'Stevão@gmail.com'),
(NEXT VALUE FOR ordemPessoaId, 'Talisson', 'Rua Z, 30', 'São Paulo', 'SP', '3333-3333', 'talisson@gmail.com'),
(NEXT VALUE FOR ordemPessoaId, 'Distribuidora Ouro', 'Avenida A, 40', 'Santa Catarina', 'SC', '4444-4444', 'ouro@gmail.com'),
(NEXT VALUE FOR ordemPessoaId, 'Empresa Luz', 'Avenida B, 50', 'Recife', 'PE', '5555-5555', 'luz@gmail.com'); 

INSERT INTO PessoaFisica (idPessoa, cpf)
VALUES (1, '11111111111'),
(2, '22222222222'),
(3, '33333333333');

INSERT INTO PessoaJuridica (idPessoa, cnpj)
VALUES (4, '44444444444444'),
(5, '55555555555555');

INSERT INTO Movimento (idMovimento, idUsuario, idPessoa, idProduto, quantidade, tipo, valorUnitario)
VALUES (1, 1, 5, 1, 40,'E', 5.00),
(3, 2, 3, 3, 20,'S', 2.00),
(5, 1, 4, 4, 60,'E', 4.00),
(6, 2, 1, 1, 15,'S', 5.00),
(7, 4, 2, 4, 25,'S', 4.00),
(9, 3, 5, 3, 50,'E', 2.00);
