select pokemon_id
from {{ ref('stg_pokemon_abilities') }}
where pokemon_id <= 0