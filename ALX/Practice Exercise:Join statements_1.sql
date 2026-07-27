
/*Exercise 1: Albums with a Title Track
Sometimes artists add a title track to their albums, meaning a track that has the same title as the album.
 Write a query that returns albums that have a title track.
 Return: AlbumId from Album, Title from Album, Name from Track. Match rows where Album.Title = Track.Name.
 */
 SELECT A.AlbumId,A.Title,T.Name
 FROM Album AS A
 INNER JOIN 
 Track AS T
 ON  A.Title=T.Name;

/*Exercise 2: Albums with a Title Track and the Artist Name
Using your result from Exercise 1, extend the query to include the artist of each album.
Return: AlbumId from Album, Title from Album, Name from Track, Name from Artist. Match on Album.Title = Track.Name and Artist.ArtistId = Album.ArtistId.
*/
SELECT A.Title,Ar.Name
FROM Album as A
INNER JOIN 
  Artist as Ar
ON A.ArtistId = Ar.ArtistId ;
/*Exercise 3: Tracks Not Yet Bought (Missing Invoice Lines)
A useful case for LEFT JOIN is checking for missing related records. 
Write a query that lists all tracks and shows whether they appear in any invoice line (indicating a purchase).
Return: TrackId from Track, InvoiceId from InvoiceLine (if it exists). Use a LEFT JOIN from Track to InvoiceLine on TrackId.


*/
/*Exercise 4: Only the Unpurchased Tracks
Using the query from Exercise 3, filter the results to show only tracks that have not been purchased. 
Only include rows where InvoiceLine.InvoiceId IS NULL.


*/


/*Exercise 5: All Possible Product Category Combinations
Chinook wants to define potential product categories based on genre and media type. 
Write a query that lists all possible combinations of Genre.Name and MediaType.Name. Use a CROSS JOIN.
*/




