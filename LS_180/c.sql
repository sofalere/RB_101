SELECT a.name AS "Author", count(ab.book_id) AS "Number of Books",
       trunc(avg(b.page_count)) AS "Average Page Count"
  FROM authors a
    LEFT OUTER JOIN authors_books ab ON a.id = ab.author_id
    LEFT OUTER JOIN books b on ab.book_id = b.id
  GROUP BY a.name
  ORDER BY "Number of Books" DESC, "Average Page Count" DESC;