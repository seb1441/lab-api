class LabApiSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
end
