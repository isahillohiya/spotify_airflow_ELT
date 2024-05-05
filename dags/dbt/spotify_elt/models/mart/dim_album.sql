SELECT
    DISTINCT src.value:track:album:id::string AS album_id,
    src.value:track:album:name::string AS album_name,
    TO_DATE(src.value:track:album:release_date) AS release_date,
    src.value:track:album:total_tracks::int AS total_tracks,
    src.value:track:album:external_urls:spotify::string AS url
FROM
    {{ ref("stg_spotify") }} as json_data,
    LATERAL FLATTEN(input => json_data.items_json:items) src 





