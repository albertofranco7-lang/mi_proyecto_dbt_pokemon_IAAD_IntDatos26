{{ config(materialized='table') }}

with abilities as (
    select * from {{ ref('stg_pokemon_abilities') }}
),

forms as (
    select * from {{ ref('stg_pokemon_forms') }}
)

select
    a.pokemon_id,
    a.pokemon_name,
    a.ability_name,
    a.is_hidden_ability,
    f.form_name,
    f.form_url
from abilities a
left join forms f 
    on a.pokemon_id = f.pokemon_id