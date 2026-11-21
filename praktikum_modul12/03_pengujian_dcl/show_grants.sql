SELECT u.id, r.`role`, r.bucket_name, r.scope_name, r.collection_name
FROM system:user_info AS u
UNNEST u.`roles` AS r
WHERE u.id = "report_user";
