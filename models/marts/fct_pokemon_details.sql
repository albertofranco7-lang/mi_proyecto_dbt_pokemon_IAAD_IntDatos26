{{ config(materialized='table') }}

with pokemon_data as (
    select * from {{ ref('int_pokemon_joined') }}
)

select
    pokemon_id,
    pokemon_name,
    ability_name,
    form_name,
    -- Añadimos una lógica simple de Mart:
    upper(pokemon_name) as pokemon_display_name
from pokemon_data