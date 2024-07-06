-- Q1. Which employee has highest seniority level according to post?
-- select * from employee order by levels desc limit 1;


-- Q2. top customers according to invoices?
-- select customer_id,count(invoice_id) from invoice
-- group by customer_id
-- order by customer_id
-- limit 3;


-- Q3. Which country has highest number of invoices?
-- select count(*) as invoices, billing_country from invoice group by billing_country order by count(*) desc limit 1;


 -- Q4. Top 3 values of invoices?
 -- select * from invoice order by total desc limit 3;
 
 
 -- Q5. City with the best customers, list all cities with their total bills?
 -- select billing_city as city, sum(total) as total from invoice group by billing_city order by sum(total) desc;
 
 
 -- Q6. Who is the best customer?
--  select customer.customer_id, customer.first_name, customer.last_name,sum(invoice.total) as total from customer 
--  inner join invoice on customer.customer_id=invoice.customer_id 
--  group by customer.customer_id,customer.first_name, customer.last_name 
--  order by total desc limit 1;


-- Q7. which sales support agent has the most number of customers?
-- select employee.first_name,employee.last_name,title,count(customer_id) from employee
-- inner join customer on employee.employee_id=customer.support_rep_id
-- group by employee.last_name,employee.first_name,title
-- having title='Sales Support Agent';


-- Q8. artists who make rock music?
-- select distinct artist.name from artist 
-- inner join album on artist.artist_id=album.artist_id
-- inner join track on album.album_id=track.album_id
-- where track.genre_id=(select genre_id from genre where name='Rock'); 


-- Q9. artist that has earned the most?
-- select artist.name, sum(invoice_line.unit_price*quantity) as earnings from artist
-- inner join album on artist.artist_id=album.artist_id
-- inner join track on album.album_id=track.album_id
-- inner join invoice_line on track.track_id=invoice_line.track_id
-- group by artist.name
-- order by earnings desc
-- limit 1;


-- Q10. return the email, first & last name, and genre of all rock music listenersin alphabetical order according to email
-- select distinct email, first_name, last_name from customer
-- inner join invoice on customer.customer_id=invoice.customer_id
-- inner join invoice_line on invoice.invoice_id=invoice_line.invoice_id
-- where track_id in 
-- (select track_id from track
-- inner join genre on track.genre_id=genre.genre_id
-- where genre.name='Rock')
-- order by email;


-- Q11. return the artist name and total track count of top 10 bands in rock music
-- select artist.name, count(track.track_id) as tracks from artist
-- inner join album on artist.artist_id=album.artist_id
-- inner join track on album.album_id=track.album_id
-- where track.genre_id=(select genre_id from genre where name='Rock')
-- order by tracks 
-- desc limit 10;


-- Q12. customer who cpent the most on AC/DC?
-- select customer.customer_id,customer.first_name,customer.last_name, sum(invoice_line.unit_price*quantity) as spent from customer
-- inner join invoice on customer.customer_id=invoice.customer_id
-- inner join invoice_line on invoice.invoice_id=invoice_line.invoice_id
-- inner join track on invoice_line.track_id=track.track_id
-- inner join album on album.album_id=track.album_id
-- where album.artist_id=(select artist_id from artist where name='AC/DC')
-- group by customer.customer_id,customer.first_name,customer.last_name
-- order by spent desc
-- limit 1;


-- Q13. return all track names, lengths that have a track length greater than the average length in descending order of length
-- select name,milliseconds from track 
-- where milliseconds>(select avg(milliseconds) from track) 
-- order by milliseconds desc, name;















-- WITH bsa AS (
--     SELECT 
--         artist.artist_id, 
--         artist.name, 
--         SUM(invoice_line.unit_price * invoice_line.quantity) AS total_sales
--     FROM invoice_line
--     JOIN track ON track.track_id = invoice_line.track_id
--     JOIN album ON album.album_id = track.album_id
--     JOIN artist ON artist.artist_id = album.artist_id
--     GROUP BY artist.artist_id, artist.name
--     ORDER BY total_sales DESC
--     LIMIT 1
-- )
-- SELECT 
--     customer.first_name, 
--     customer.last_name, 
--     bsa.name AS artist_name, 
--     SUM(invoice_line.unit_price * invoice_line.quantity) AS total_spent
-- FROM invoice
-- JOIN customer ON customer.customer_id = invoice.customer_id
-- JOIN invoice_line ON invoice_line.invoice_id = invoice.invoice_id
-- JOIN track ON track.track_id = invoice_line.track_id
-- JOIN album ON album.album_id = track.album_id
-- JOIN bsa ON bsa.artist_id = album.artist_id
-- GROUP BY 
--     customer.customer_id, 
--     customer.first_name, 
--     customer.last_name, 
--     bsa.name
-- ORDER BY total_spent DESC;



 
 
