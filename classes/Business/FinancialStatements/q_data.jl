quarters = ["Q1","Q2", "Q3", "Q4", "Q5", "Q6", "Q7", "Q8", "Q9"]
# total_revenue = [1149, 10080, 23940, 33152, 51576, 79212, 18684, 16606]
total_cogs         = [0, 441+0, 371+485, 301+813, 740+738, 5228+1904, 7712+0, 6560+1091, 20508+10589]
total_gross_margin = [0, 1149,    4078,    6454,    6702,     10872,  11008,     18684,       23288]

# gross_profit = [2160, 7680, 19140, 31680, 48991, 75241, 110242, 153994]
gross_profit = total_gross_margin

opex = [0, 500, 1000, 2000, 2479, 3072, 3807, 4719, 4719]
net_income = [-1374, -1022, 639, 2101, 2576, 4778, 4636, 7598, 10176]; # net_earnings

total_revenue = [
    (margin + cogs) for (margin, cogs) in zip(total_gross_margin, total_cogs)
];

