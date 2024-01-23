select  * from orders
where shipping_mode like 'F%';

|order_id|customer_id|order_date|shipping_date|shipping_mode|delivery_country|delivery_city   |delivery_state|delivery_zip_code|order_return|
|--------|-----------|----------|-------------|-------------|----------------|----------------|--------------|-----------------|------------|
|344     |323        |2021-01-03|2021-01-05   |First Class  |United States   |Richardson      |Texas         |75,080           |47          |
|349     |602        |2020-04-06|2020-04-08   |First Class  |United States   |Eagan           |Minnesota     |55,122           |25          |
|354     |754        |2020-07-13|2020-07-14   |First Class  |United States   |Troy            |New York      |12,180           |26          |
|358     |445        |2020-06-30|2020-07-02   |First Class  |United States   |Springfield     |Virginia      |22,153           |26          |
|362     |441        |2022-01-04|2022-01-06   |First Class  |United States   |Houston         |Texas         |77,041           |28          |
|364     |702        |2020-07-08|2020-07-11   |First Class  |United States   |Decatur         |Alabama       |35,601           |6           |
|367     |201        |2021-12-09|2021-12-12   |First Class  |United States   |Chicago         |Illinois      |60,623           |1           |
|375     |446        |2021-07-13|2021-07-16   |First Class  |United States   |San Francisco   |California    |94,122           |10          |
|387     |701        |2020-07-08|2020-07-11   |First Class  |United States   |Wilmington      |Delaware      |19,805           |8           |
|392     |267        |2021-02-28|2021-03-03   |First Class  |United States   |Columbus        |Ohio          |43,229           |46          |
|400     |796        |2020-04-08|2020-04-11   |First Class  |United States   |Scottsdale      |Arizona       |85,254           |29          |
|401     |731        |2019-06-26|2019-06-28   |First Class  |United States   |San Jose        |California    |95,123           |40          |
|405     |792        |2020-06-06|2020-06-07   |First Class  |United States   |Los Angeles     |California    |90,045           |7           |
|420     |555        |2019-11-07|2019-11-09   |First Class  |United States   |New York City   |New York      |10,035           |22          |
|426     |131        |2018-08-29|2018-08-31   |First Class  |United States   |Denver          |Colorado      |80,219           |3           |
|434     |364        |2020-01-19|2020-01-22   |First Class  |United States   |Dublin          |Ohio          |43,017           |19          |
|444     |242        |2021-01-05|2021-01-08   |First Class  |United States   |New York City   |New York      |10,024           |3           |
|455     |340        |2019-08-25|2019-08-26   |First Class  |United States   |San Francisco   |California    |94,109           |1           |
|456     |87         |2021-10-12|2021-10-13   |First Class  |United States   |Inglewood       |California    |90,301           |22          |
|463     |456        |2019-01-21|2019-01-23   |First Class  |United States   |Colorado Springs|Colorado      |80,906           |15          |


select  * from orders
where delivery_city  like '%i%' ;

|order_id|customer_id|order_date|shipping_date|shipping_mode |delivery_country|delivery_city|delivery_state|delivery_zip_code|order_return|
|--------|-----------|----------|-------------|--------------|----------------|-------------|--------------|-----------------|------------|
|335     |620        |2018-12-07|2018-12-14   |Standard Class|United States   |Madison      |Wisconsin     |53,711           |18          |
|337     |815        |2018-09-22|2018-09-27   |Second Class  |United States   |San Francisco|California    |94,109           |13          |
|339     |707        |2021-08-11|2021-08-13   |Second Class  |United States   |Philadelphia |Pennsylvania  |19,140           |34          |
|342     |761        |2019-10-13|2019-10-17   |Standard Class|United States   |Philadelphia |Pennsylvania  |19,140           |45          |
|344     |323        |2021-01-03|2021-01-05   |First Class   |United States   |Richardson   |Texas         |75,080           |47          |
|346     |475        |2021-10-06|2021-10-11   |Standard Class|United States   |Naperville   |Illinois      |60,540           |41          |
|353     |413        |2021-01-06|2021-01-12   |Standard Class|United States   |New York City|New York      |10,024           |21          |
|356     |632        |2019-05-26|2019-05-31   |Standard Class|United States   |Chicago      |Illinois      |60,610           |27          |
|357     |129        |2018-12-31|2019-01-05   |Standard Class|United States   |Gilbert      |Arizona       |85,234           |21          |
|358     |445        |2020-06-30|2020-07-02   |First Class   |United States   |Springfield  |Virginia      |22,153           |26          |
|359     |352        |2020-10-14|2020-10-19   |Standard Class|United States   |New York City|New York      |10,009           |1           |
|361     |379        |2019-05-22|2019-05-28   |Standard Class|United States   |Memphis      |Tennessee     |38,109           |47          |
|365     |250        |2018-11-07|2018-11-11   |Standard Class|United States   |San Francisco|California    |94,122           |29          |
|367     |201        |2021-12-09|2021-12-12   |First Class   |United States   |Chicago      |Illinois      |60,623           |1           |
|368     |626        |2021-06-23|2021-06-25   |Second Class  |United States   |Columbia     |South Carolina|29,203           |9           |
|372     |438        |2019-02-26|2019-03-03   |Second Class  |United States   |Minneapolis  |Minnesota     |55,407           |34          |
|374     |624        |2021-12-05|2021-12-07   |Second Class  |United States   |New York City|New York      |10,009           |1           |
|375     |446        |2021-07-13|2021-07-16   |First Class   |United States   |San Francisco|California    |94,122           |10          |
|376     |299        |2020-10-02|2020-10-07   |Standard Class|United States   |Saint Paul   |Minnesota     |55,106           |42          |
|377     |646        |2020-09-24|2020-09-28   |Standard Class|United States   |Chicago      |Illinois      |60,610           |9           |




