-- Este modelo extrae las habilidades de la columna JSON 'abilities'
with raw_data as (
    select 
        id as pokemon_id,
        name as pokemon_name,
        unnest(from_json(abilities, '["JSON"]')) as ability_entry 
    from {{ source('main', 'pokemon') }}
)

select
    pokemon_id,
    pokemon_name,
    ability_entry->>'$.ability.name' as ability_name,
    -- AÑADIMOS ESTA LÍNEA PARA LA URL:
    ability_entry->>'$.ability.url' as ability_url, 
    (ability_entry->>'$.is_hidden')::boolean as is_hidden_ability,
    (ability_entry->>'$.slot')::int as slot_number
from raw_data