with tab1 as(
select event_type,
       case 
          when DAYOFWEEKISO(event_timestamp) in (6,7) then 'Weekend'
          else 'Weekday'
       end as day_type
from event_data
)
select 
  event_type,
  sum(case when day_type = 'Weekend' then 1 else 0 end) as weekend_count,
  sum(case when day_type = 'Weekday' then 1 else 0 end) as weekday_count
from tab1
group by event_type
order by weekend_count desc
