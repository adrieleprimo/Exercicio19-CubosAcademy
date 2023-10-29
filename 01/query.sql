
CREATE TABLE produtos(
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  descricao TEXT NOT NULL,
  preco INTEGER NOT NULL,
  quantidade_em_estoque INTEGER NOT NULL,
  categoria_id INTEGER REFERENCES categorias(id)
  );

CREATE TABLE categorias (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(50) NOT NULL
  );


CREATE TABLE clientes (
  cpf CHAR(11) PRIMARY KEY,
  nome VARCHAR(150)
  );
  
  CREATE TABLE vendedores (
    cpf CHAR(11) PRIMARY KEY,
    nome VARCHAR(150)
    );

CREATE TABLE pedidos (
  id SERIAL PRIMARY KEY,
  valor INTEGER NOT NULL,
  cliente_cpf CHAR(11) REFERENCES clientes(cpf),
  vendedor_cpf CHAR(11) REFERENCES vendedores(cpf)
  );

CREATE TABLE itens_do_pedido(
  id SERIAL PRIMARY KEY,
  pedido_id INTEGER REFERENCES pedidos(id),
  quantidade INTEGER NOT NULL,
  produtos_id INTEGER REFERENCES produtos(id)
  );

ALTER TABLE vendedores ADD CONSTRAINT cpf_vendedor UNIQUE (cpf);

INSERT INTO categorias
(nome)
VALUES
('frutas'),
('verduras'),
('massas'),
('bebidas'),
('utilidades');

INSERT INTO produtos
(nome, descricao, preco, quantidade_em_estoque, categoria_id)
VALUES
('Mamão','Rico em vitamina A, potássio e vitamina C.', 300, 123, 1),
('Maçã', 'Fonte de potássio e fibras.', 90, 34, 1),
('Cebola', 'Rico em quercetina, antocianinas, vitaminas do complexo B, C.', 50, 76, 2),
('Abacate', 'Não contém glúten.', 150, 64, 1),
('Tomate', 'Rico em vitaminas A, B e C.', 125, 88, 1),
('Acelga', 'Não contém glúten.', 235, 18, 2),
('Macarrão parafuso', 'Sêmola de trigo enriquecida com ferro e ácido fólico, ovos e corantes naturais', 690, 5, 3),
('Massa para lasanha', 'Uma reunião de família precisa ter comida boa e muita alegria.', 875, 19, 3),
('Refrigerante coca cola lata', 'Sabor original.', 350, 189, 4),
('Refrigerante Pepsi 2l', 'Não contém glúten. Não alcoólico', 700, 12, 4),
('Cerveja Heineken 600ml', 'Heineken é uma cerveja lager Puro Malte, refrescante e de cor amarelo-dourado', 1200, 500, 4),
('Água mineral sem gás', 'Smartwater é água adicionado de sais mineirais (cálcio, potássio e magnésio) livre de sódio e com pH neutro.', 130, 478, 4),
('Vassoura', 'Pigmento, matéria sintética e metal.', 2350, 30, 5),
('Saco para lixo', 'Reforçado para garantir mais segurança.', 1340, 90, 5),
('Escova dental', 'Faça uma limpeza profunda com a tecnologia inovadora.', 1000, 44, 5),
('Balde para lixo 50l', 'Possui tampa e fabricado com material reciclado.', 2290, 55, 5),
('Manga', 'Rico em Vitamina A, potássio e vitamina C.', 198, 176, 1),
('Uva', 'Não contém glúten', 420, 90, 1);

INSERT INTO clientes
(cpf, nome)
VALUES 
('80371350042', 'José Augusto Silva'),
('67642869061', 'Antonio Oliveira'),
('63193310034', 'Ana Rodrigues'),
('75670505018', 'Maria da Conceição');

INSERT INTO vendedores
(cpf, nome)
VALUES 
('82539841031', 'Rodrigo Sampaio'),
('23262546003', 'Beatriz Souza Santos'),
('28007155023', 'Carlos Eduardo');

INSERT INTO pedidos
(valor, cliente_cpf, vendedor_cpf)
VALUES 
(3650, '80371350042', '28007155023'),
(6460, '63193310034', '23262546003'),
(4120, '75670505018', '23262546003'),
(9370, '75670505018', '82539841031'),
(8229, '67642869061', '82539841031');