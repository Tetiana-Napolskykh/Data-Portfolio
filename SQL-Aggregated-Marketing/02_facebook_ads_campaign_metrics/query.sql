select 
ad_date , 
campaign_id,
sum (spend) as all_spend,
count (impressions)as all_impr,
count(clicks) as all_clicks,
sum (value)as all_value,
round( sum (spend)::numeric  / avg (impressions)::numeric , 2) as CPM,
round( avg (clicks):: numeric / avg(impressions):: numeric ,2) as CTR,
round( sum (spend):: numeric / avg(clicks):: numeric , 2) as CPC,
round( cast (sum (value)as numeric)/ cast (sum(spend)as numeric),2)  as ROMI
from public.facebook_ads_basic_daily fabd 
where impressions >0 and clicks >0
group by ad_date , campaign_id
;