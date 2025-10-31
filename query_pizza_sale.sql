
-- CONSULTAS ANALISE PERFOMANCE DO NEGÓCIO NAS VENDAS POR PERÍODO --

-- 1- HORÁRIO DO DIA COM MAIOR VOLUME DE PEDIDOS

--identificar horários e dias mais movimentados

-- volume de pedidos por hora

                
SELECT
	 RIGHT('0' + CAST(DATEPART(HOUR, order_time) AS VARCHAR(2)), 2) + ':00' AS hora_formatada,
	COUNT(DISTINCT order_id) AS total_pedido,
	SUM(quantity) AS total_ízzas
FROM dbo.[pizza_sales_excel_file.xlsx - pizza_sales]
group by DATEPART(HOUR, order_time)
ORDER BY total_pedido Desc;

--Resposta: entre 18h e 21h


-- volume de pedido por dia da semana

SELECT
	DATENAME(WEEKDAY, order_date) AS dia_semana,
	COUNT(DISTINCT order_id) AS total_pedidos,
	SUM(quantity) As total_pizzas
FROM dbo.[pizza_sales_excel_file.xlsx - pizza_sales]
GROUP BY DATENAME(WEEKDAY, order_date)
ORDER BY total_pedidos DESC;

-- Resposta: sexta e Quinta, entre 18h e 21h, concentram o maior volume.



-- 2- Top 5 Pizzas Mais Vendidas (Receita e Quantidade)

-- identificar produtos mais relevantes

-- top 5 por Receita Total

SELECT TOP 5
	pizza_name,
	SUM(total_price) AS receita_total
FROM dbo.[pizza_sales_excel_file.xlsx - pizza_sales]
group by pizza_name
order by receita_total desc;

-- Resposta: “The Thai Chicken Pizza” lidera em receita


--Top 5 por quantidade vendida

SELECT TOP 5
	pizza_name,
	SUM(quantity) AS qtd_vendida
FROM dbo.[pizza_sales_excel_file.xlsx - pizza_sales]
group by pizza_name
order by qtd_vendida desc;

-- Resposta: “Classic Deluxe” e “Pepperoni” lideram em volume


-- 3- COMPARAR TAMANHO X VALOR MÉDIO

-- Entender a variação de preço por tamanho

SELECT
	pizza_size,
	ROUND(SUM(total_price / 10) / SUM(quantity), 2) AS preco_medio
FROM dbo.[pizza_sales_excel_file.xlsx - pizza_sales]
GROUP BY pizza_size
ORDER BY preco_medio;


-- Tendência Mensala de vendas (SAZONALIDADE)

-- VISUALIZAR COMPORTAMENTO MENSAL DAS VENDAS.

SELECT
	YEAR(order_date) AS ano,
	MONTH(order_date) AS mes,
	DATENAME(MONTH, order_date) AS nome_mes,
	SUM(total_price) AS receita_total
FROM dbo.[pizza_sales_excel_file.xlsx - pizza_sales]
Group by YEAR(order_date), MONTH(order_date), DATENAME(MONTH,order_date)
order by ano, mes;

-- Resposta: Mês de MArço, Maio e Novembro


-- CORRELAÇÃO CATEGORIA E TICKET MÉDIO

-- identificar o ticket médio por tipo de pizza

Select 
	pizza_category,
	ROUND(AVG(total_price), 2) AS ticket_medio,
	SUM(total_price) AS receita_total
FROM DBO.[pizza_sales_excel_file.xlsx - pizza_sales]
group by pizza_category
order by ticket_medio;


-- Resposta: maior ticket médio é a pizza  CHICKEN E A SUPREME


SELECT 
    COUNT(DISTINCT order_id) AS total_pedidos,
    SUM(quantity) AS total_pizzas,
    ROUND(SUM(total_price), 2) AS receita_total,
    ROUND(SUM(total_price) / COUNT(DISTINCT order_id), 2) AS ticket_medio,
    ROUND(SUM(total_price) / SUM(quantity), 2) AS preco_medio
FROM dbo.[pizza_sales_excel_file.xlsx - pizza_sales]


-- KPIS PRINCIPAIS

-- TOTAL E PEDIDOS = 21350
-- TOTAL DE PIZZAS = 49574
-- RECEITA TOTAL = 45721718
-- TICKET MÉDIO = 2141,53
-- PRECO MÉDIO = 922,29




















