select locality, count (*) from dim_store_details group by locality	ORDER BY COUNT(*) DESC;
