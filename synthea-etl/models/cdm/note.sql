-- depends_on: {{ ref('visit_occurrence') }}

{{ config (
    unique_key = 'note_id',
    materialized='incremental',
    enabled=true
) }}

with note as (

    select * from {{ ref('stg_note')}}

)
select
    note_id,
    person_id,
    note_event_id,
    note_event_field_concept_id,
    note_date,
    note_datetime,
    note_type_concept_id,
    note_class_concept_id,
    note_title,
    note_text,
    encoding_concept_id,
    language_concept_id,
    provider_id,
    visit_occurrence_id,
    visit_detail_id,
    note_source_value
from note
