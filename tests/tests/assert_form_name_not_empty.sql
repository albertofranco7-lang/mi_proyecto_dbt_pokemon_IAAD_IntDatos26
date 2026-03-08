select form_name
from {{ ref('stg_pokemon_forms') }}
where form_name = '' or form_name is null