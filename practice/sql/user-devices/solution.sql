select distinct
      u.username,
      d.device_type
 from user_sessions t left join users u on t.user_id = u.user_id
 left join devices d on d.device_id = t.device_id
 where d.device_type is not null
