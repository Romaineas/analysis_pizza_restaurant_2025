# analysis_pizza_restaurant_2025           

🍕 Análise de Vendas — Pizza Sales Dashboard

 Objetivo: entender quando os clientes mais compram.

 - Visual:

Gráfico de colunas → Eixo: Hora (da tabela de tempo criada no Power Query)

Gráfico de barras horizontais → Eixo: Dia da Semana

# Top 5 Pizzas Mais Vendidas por Receita e Quantidade

Objetivo: identificar os produtos campeões e o mix de vendas.

Tabela ou gráfico de barras com:

Valores: Receita Total e Qtd Pizzas Vendidas

Filtro: Top 5 por Receita ou Quantidade

# Comparar Tamanho (Size) × Valor Médio

Objetivo: medir como o tamanho impacta o preço médio por pedido.

- Gráfico de colunas agrupadas

Eixo: pizza_size

Valores: Preço Médio

# Tendência Mensal de Vendas (Sazonalidade)

Objetivo: entender o comportamento de vendas ao longo do tempo.

- Gráfico de linhas com:

Eixo: Mês/Ano (DimDate → “Ano-Mês”)

Valores: Total Vendas

Correlação entre Categorias e Ticket Médio

Objetivo: descobrir qual tipo de pizza gera maior retorno por pedido.

- Gráfico de colunas:

Eixo: pizza_category

Valores: Ticket Médio e/ou Receita Total


# 🧠 Resumo de Insights Estratégicos

| Área         | Insight                       | Ação Recomendada                           |
| ------------ | ----------------------------- | ------------------------------------------ |
| Tempo        | Pico às 18–21h (sexta/sábado) | Promoções noturnas                         |
| Produto      | “Chicken” domina receita      | Criar combos premium                       |
| Tamanho      | Linearidade no preço          | Descontos progressivos em tamanhos grandes |
| Sazonalidade | Alta em férias/feriados       | Campanhas sazonais                         |
| Ticket Médio | Chicken & Supreme lideram     | Focar em marketing dessas categorias       |
| Outliers     | Pedidos corporativos          | Programa fidelidade B2B                    |


