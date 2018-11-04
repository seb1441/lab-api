class Types::MutationType < Types::BaseObject
  field :sign_in_user, Types::AuthenticateType, null: true do
    argument :email, String, required: true
    argument :password, String, required: true
  end
  def sign_in_user(email:, password:)
    user = User.find_by(email: email)
    unless user && user.authenticate(password)
      raise GraphQL::ExecutionError, 'The email address or password you entered was incorrect.'
    end

    {
      token: AuthToken.token(user),
      user: user
    }
  end

  field :create_level, mutation: Mutations::Level::CreateLevel
  field :update_levels, mutation: Mutations::Level::UpdateLevels
  field :destroy_level, mutation: Mutations::Level::DestroyLevel

  field :create_category, mutation: Mutations::Category::CreateCategory
  field :update_categories, mutation: Mutations::Category::UpdateCategories
  field :destroy_category, mutation: Mutations::Category::DestroyCategory

  field :create_chapter, mutation: Mutations::Chapter::CreateChapter
  field :update_chapters, mutation: Mutations::Chapter::UpdateChapters
  field :destroy_chapter, mutation: Mutations::Chapter::DestroyChapter

  field :create_lesson, mutation: Mutations::Lesson::CreateLesson
  field :update_lesson, mutation: Mutations::Lesson::UpdateLesson
  field :destroy_lesson, mutation: Mutations::Lesson::DestroyLesson
end
