# == Schema Information
#
# Table name: subreddits
#
#  id              :bigint           not null, primary key
#  name            :string
#  sub_description :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  slug            :string
#  user_id         :integer
#
require "test_helper"

class SubredditTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
