# Merging track and genre information
SELECT `track`.`TrackId`,
    `track`.`Name` as track_name,
    `track`.`AlbumId`,
    `track`.`MediaTypeId`,
    `track`.`GenreId`,
    `track`.`Composer`,
    `track`.`Milliseconds`,
    `track`.`Bytes`,
    `track`.`UnitPrice`,
    `genre`.`Name` as genre_name
FROM chinook.track
INNER JOIN genre ON track.GenreID = genre.GenreID;

# Merging invoice and invoiceline tables
SELECT `invoice`.`InvoiceId`,
	`invoice`.`CustomerId`,
	`dim_date`.`date_key` AS InvoiceDate,
	`invoice`.`BillingAddress`,
	`invoice`.`BillingCity`,
	`invoice`.`BillingState`,
	`invoice`.`BillingCountry`,
	`invoice`.`BillingPostalCode`,
	`invoice`.`Total`,
	`invoiceline`.`InvoiceLineId`,
	`invoiceline`.`TrackId`,
	`invoiceline`.`UnitPrice`,
	`invoiceline`.`Quantity`
FROM chinook.invoice
INNER JOIN invoiceline ON invoice.InvoiceId = invoiceline.InvoiceId
LEFT JOIN dim_date ON invoice.InvoiceDate = dim_date.full_date
LIMIT 300;

# LIMIT 300,300 and 600,300 to generate streaming files

