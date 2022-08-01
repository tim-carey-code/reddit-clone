# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can [:create, :read], Subreddit

    return unless user.present?
    can [:update, :destroy], Subreddit, user_id: user.id
  end
end
