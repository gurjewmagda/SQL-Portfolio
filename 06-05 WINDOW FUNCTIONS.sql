---- ===================================================================================================================
---- Row_number (), Rank (), Dense_Rank ()
---- ===================================================================================================================

select 
	cost_forecast_id
	,cost_forecast
	,cost_year
	,ship
	/* no partition */
	,row_number() over 
		(order by cost_forecast desc) 							as row_number_ranking 
	,rank() over 
		(order by cost_forecast desc) 							as rank_ranking 
	,dense_rank() over 
		(order by cost_forecast desc)    						as dense_rank_ranking 	
	/* partition by year*/
	,row_number() over 
		(partition by cost_year order by cost_forecast desc) 	as row_number_ranking_y 
	,rank() over 
		(partition by cost_year order by cost_forecast desc) 	as rank_ranking_y
	,dense_rank() over 
		(partition by cost_year order by cost_forecast desc)    as dense_rank_ranking_y 
	/* partition by year and shipping unikalne kombinacje są tylko 1 raz w tym przykładzie*/
	,dense_rank() over 
		(partition by cost_year, ship order by cost_forecast desc)    as dense_rank_ranking_s
from cost_forecast

|cost_forecast_id|cost_forecast|cost_year|ship          |row_number_ranking|rank_ranking|dense_rank_ranking|row_number_ranking_y|rank_ranking_y|dense_rank_ranking_y|dense_rank_ranking_s|
|----------------|-------------|---------|--------------|------------------|------------|------------------|--------------------|--------------|--------------------|--------------------|
|1               |70,000       |2,018    |First Class   |10                |10          |10                |2                   |2             |2                   |1                   |
|2               |30,000       |2,018    |Same Day      |13                |13          |11                |4                   |4             |3                   |1                   |
|3               |70,000       |2,018    |Second Class  |11                |10          |10                |3                   |2             |2                   |1                   |
|4               |300,000      |2,018    |Standard Class|4                 |4           |4                 |1                   |1             |1                   |1                   |
|5               |70,000       |2,019    |First Class   |12                |10          |10                |3                   |3             |3                   |1                   |
|6               |30,000       |2,019    |Same Day      |14                |13          |11                |4                   |4             |4                   |1                   |
|7               |110,000      |2,019    |Second Class  |8                 |8           |8                 |2                   |2             |2                   |1                   |
|8               |360,000      |2,019    |Standard Class|3                 |3           |3                 |1                   |1             |1                   |1                   |
|9               |95,000       |2,020    |First Class   |9                 |9           |9                 |3                   |3             |3                   |1                   |
|10              |30,000       |2,020    |Same Day      |15                |13          |11                |4                   |4             |4                   |1                   |
|11              |120,000      |2,020    |Second Class  |7                 |7           |7                 |2                   |2             |2                   |1                   |
|12              |400,000      |2,020    |Standard Class|2                 |2           |2                 |1                   |1             |1                   |1                   |
|13              |150,000      |2,021    |First Class   |5                 |5           |5                 |2                   |2             |2                   |1                   |
|14              |30,000       |2,021    |Same Day      |16                |13          |11                |4                   |4             |4                   |1                   |
|15              |130,000      |2,021    |Second Class  |6                 |6           |6                 |3                   |3             |3                   |1                   |
|16              |480,000      |2,021    |Standard Class|1                 |1           |1                 |1                   |1             |1                   |1                   |
