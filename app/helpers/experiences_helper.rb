module ExperiencesHelper
    def concert_id_field(experience)
        if experience.concert.nil?
            select_tag "post[concert_id]", options_from_collection_for_select(Concert.all, :id, :date)
        else
            hidden_field_tag "post[concert_id]", experience.concert_id
        end
    end
end
