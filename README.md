Proyecto dbt - PokeAPI
Este proyecto transforma datos de Pokémon cargados vía Airbyte en MotherDuck.

Capas del Proyecto:
Staging: Limpieza de JSONs de habilidades y formas (stg_pokemon_abilities, stg_pokemon_forms).

Intermediate: Unión de datos base y habilidades (int_pokemon_joined).

Marts: Tabla final enriquecida para análisis (fct_pokemon_details).