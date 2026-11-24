select 
  count(DISTINCT owner_id) as non_read_owner_count
FROM api_tokens
where scope not like 'read%'
