with spotify_source_data as (
    select * from {{ source("raw_src","SPOTIFY_RAW") }},
    lateral flatten("ITEMS_JSON") json_src

),
final as (
    select * from spotify_source_data
)
select * from final