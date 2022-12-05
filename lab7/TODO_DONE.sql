-- TODO: find max books count (21)
-- Variant 1:
SELECT COUNT(*) as max_book
FROM books
GROUP BY author_id
ORDER BY max_book DESC
LIMIT 1;


