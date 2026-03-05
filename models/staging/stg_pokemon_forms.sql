with raw_data as (
    select 
        id as pokemon_id,
        name as pokemon_name,
        -- Extraemos la lista de formas del JSON
        unnest(from_json(forms, '["JSON"]')) as form_entry 
    from {{ source('main', 'pokemon') }}
)

select
    pokemon_id,
    pokemon_name,
    -- Extraemos el nombre y la url de la forma
    form_entry->>'$.name' as form_name,
    form_entry->>'$.url' as form_url
from raw_data