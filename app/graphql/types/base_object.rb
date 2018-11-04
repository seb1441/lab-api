class Types::BaseObject < GraphQL::Schema::Object
  # def self.authorized?(object, context)
  #   selections = context.query&.selected_operation&.selections
  #   if selections && selections.size == 1 && selections.first.name == "currentUser"
  #     true
  #   else
  #     Utils::General.authorized_yuki(context[:current_user])
  #   end
  # end
end
