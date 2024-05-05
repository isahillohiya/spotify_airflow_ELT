select 
    
    distinct(src.value:track:id::string) as song_id,
    src.INDEX + 1 as weekly,
    src.value:track:name::string as song_name,
    src.value:track:duration_ms::int as duration_ms,
    src.value:track:external_urls:spotify::string as url,
    src.value:track:popularity::int as popularity,
    to_date(src.value:added_at) as song_added,
    src.value:track:album:id::string as album_id,
    get(src.value:track:artists,0):id::string as artist_id,
    
from 
    {{ ref("stg_spotify") }} as json_data,
    LATERAL FLATTEN(input => json_data.items_json:items) src 