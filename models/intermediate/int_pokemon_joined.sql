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
    a.ability_url,
    f.form_name
from abilities a
left join forms f on a.pokemon_id = f.pokemon_id