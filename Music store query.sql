/* Q1: Who is the senior most employee based on job title? */
SELECT *
FROM employee
ORDER BY levels DESC
LIMIT 1;

/* Q2: Which countries have the most Invoices? */
select billing_country,count(*) as No_of_invoices from invoice
group by billing_country
order by No_of_invoices desc;

/* Q3: What are top 3 values of total invoice? */
select total from invoice
order  by total desc
limit 3;

/* Q4: Which city has the best customers? 
Write a query that returns one city that has the highest sum of invoice totals. 
Return both the city name & sum of all invoice totals */

select billing_city , sum(total) as Total_invoices
from invoice
group by billing_city
order by Total_invoices desc;

/* Q5: Who is the best customer? The customer who has spent the most money will be declared the best customer. 
Write a query that returns the person who has spent the most money.*/

select customer.customer_id, first_name, last_name,sum(total) as "Total spending" from customer
join invoice
on customer.customer_id = invoice.customer_id
group by customer.customer_id
order by "Total spending" DESC
limit 1;
	
/* Q6: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
Return your list ordered alphabetically by email starting with A. */

SELECT distinct email, first_name, last_name, genre.name from customer 
join invoice on customer.customer_id = invoice.invoice_id
join invoice_line on invoice.invoice_id = invoice_line.invoice_id
join track on invoice_line.track_id = track.track_id
join genre on track.genre_id = genre.genre_id
where genre.name = "Rock"
ORDER BY EMAIL;

/* Q7: Let's invite the artists who have written the most rock music in our dataset. 
Write a query that returns the Artist name and total track count of the top 10 rock bands. */

select artist.name, count(track_id) as No_of_tracks from artist 
join album on artist.artist_id = album.artist_id
join track on album.album_id = track.album_id 
join genre on track.genre_id = genre.genre_id
where genre.name like 'Rock'
group by artist.name
order by No_of_tracks DESC
limit 10;

/* Q8: Return all the track names that have a song length longer than the average song length. 
Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first. */

SELECT name,milliseconds
FROM track
WHERE milliseconds > (
	SELECT AVG(milliseconds) AS avg_track_length
	FROM track )
ORDER BY milliseconds DESC;


