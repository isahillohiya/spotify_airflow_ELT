with artists as (
    select 
        src.value:track:artists as artists_array
        
    from 
    {{ ref("stg_spotify") }} as json_data,
    LATERAL FLATTEN(input => json_data.items_json:items) src 
)
select distinct(art_src.value:id::string )as artist_id,
        art_src.value:name::string as artist_name,
        art_src.value:external_urls:spotify::string as external_url,
from artists,
lateral flatten(input => artists.artists_array) art_src
