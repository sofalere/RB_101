--STRING FUNCTIONS
--get a certain part of the string based off substr location
SELECT substr(email, strpos(email, '@') + 1) AS domain, COUNT(id)
    FROM people
    GROUP BY domain
  ORDER BY count DESC;



--MATH FUNCTIONS
--age of something
SELECT title, extract("year" from current_date) - "year" AS age
  FROM films
  ORDER BY age ASC;

--round down decimals
SELECT round(avg(wingspan), 1), min(wingspan), max(wingspan) FROM birds;



--join 3 tables
SELECT * FROM items i
  FULL JOIN bids b
    ON i.id = b.item_id
  FULL JOIN bidders bd
    ON b.bidder_id = bd.id;
    
--SUBQUERIES
--if an item id is in the bids column, return that name
SELECT name FROM items
  WHERE id IN
  (SELECT DISTINCT item_id FROM bids);
  
--subquery with EXIST expression
SELECT bs.name FROM bidders bs
  WHERE EXISTS 
    (SELECT * FROM bids b
      WHERE b.bidder_id = bs.id); --note how we can access the outer query data

  --same as above but with join
  SELECT DISTINCT bs.name FROM bidders bs
      JOIN bids b
        ON b.bidder_id = bs.id;
      
  
--subquery to create a virtual table
SELECT max(bid_list.bid_num) FROM
  (SELECT count(id) AS bid_num FROM bids GROUP BY bidder_id) AS bid_list;

  --same as above but without subqueries
  SELECT COUNT(bidder_id) AS max_bid FROM bids
    GROUP BY bidder_id
    ORDER BY max_bid DESC
    LIMIT 1;

--scalar subquery
SELECT i.name, (SELECT count(id) FROM bids b
                  WHERE i.id = b.item_id)
  FROM items i;
  
--row constructor for comparison
SELECT id FROM items
  WHERE ROW('Painting', 100.00, 250.00) =
    ROW(name, initial_price, sales_price);
    
