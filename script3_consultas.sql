/* Dados completos de pessoas físicas. */
SELECT * 
FROM PessoaFisica 
INNER JOIN Pessoa ON PessoaFisica.idPessoa = Pessoa.idPessoa

/* Dados completos de pessoas juridícas. */
SELECT * 
FROM PessoaJuridica 
INNER JOIN Pessoa ON PessoaJuridica.idPessoa = Pessoa.idPessoa

/* Movimentações de entrada, com produto, fornecedor, quantidade, preço unitário e
valor total. */
SELECT 
Produto.nome AS 'produto', Pessoa.nome AS 'fornecedor', 
Movimento.quantidade, Movimento.valorUnitario,
Movimento.quantidade * Movimento.valorUnitario AS 'valorTotal'
FROM Movimento
INNER JOIN Produto ON Movimento.idProduto = Produto.idProduto
INNER JOIN Pessoa ON Movimento.idPessoa = Pessoa.idPessoa
WHERE Movimento.tipo = 'E';


/* Movimentações de saída, com produto, comprador, quantidade,
preço unitário e valor total. */
SELECT 
Produto.nome AS 'produto', Pessoa.nome AS 'comprador', 
Movimento.quantidade, Movimento.valorUnitario,
Movimento.quantidade * Movimento.valorUnitario AS 'valorTotal'
FROM Movimento
INNER JOIN Produto ON Movimento.idProduto = Produto.idProduto
INNER JOIN Pessoa ON Movimento.idPessoa = Pessoa.idPessoa
WHERE Movimento.tipo = 'S';

/* Valor total das entradas agrupadas por produto. */
SELECT 
Produto.nome AS 'produto',
SUM(Movimento.quantidade * Movimento.valorUnitario) AS 'valorTotalEntrada'
FROM Movimento
JOIN Produto ON Movimento.idProduto = Produto.idProduto
WHERE Movimento.tipo = 'E'
GROUP BY Produto.nome;

/* Valor total das saídas agrupadas por produto. */
SELECT 
Produto.nome AS 'produto',
SUM(Movimento.quantidade * Movimento.valorUnitario) AS 'valorTotalSaida'
FROM Movimento
JOIN Produto ON Movimento.idProduto = Produto.idProduto
WHERE Movimento.tipo = 'S'
GROUP BY Produto.nome;

/* Operadores que não efetuaram movimentações de entrada
(compra). */
SELECT DISTINCT 
Usuario.idUsuario, Usuario.login, Movimento.idMovimento
FROM Usuario
LEFT JOIN Movimento ON Usuario.idUsuario = Movimento.idUsuario AND Movimento.tipo = 'E'
WHERE idMovimento IS NULL;

/* Valor total de entrada, agrupado por operador. */
SELECT 
Usuario.login AS 'operador',
SUM(Movimento.quantidade * Movimento.valorUnitario) AS 'valorTotalEntrada'
FROM Movimento
JOIN Usuario ON Movimento.idUsuario = Usuario.idUsuario
WHERE Movimento.tipo = 'E'
GROUP BY Usuario.login;

/* Valor total de saída, agrupado por operador. */
SELECT 
Usuario.login AS 'operador',
SUM(Movimento.quantidade * Movimento.valorUnitario) AS 'valorTotalSaida'
FROM Movimento
JOIN Usuario ON Movimento.idUsuario = Usuario.idUsuario
WHERE Movimento.tipo = 'S'
GROUP BY Usuario.login;

/* Valor médio de venda por produto, utilizando média ponderada. */
SELECT 
SUM(Movimento.valorUnitario * Movimento.quantidade) / SUM(Movimento.quantidade) AS 'médiaPonderada'
FROM Movimento
WHERE Movimento.tipo = 'S';
