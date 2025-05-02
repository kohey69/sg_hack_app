class User::PlansController < ApplicationController
  def show
    @plan = current_user.plan
  end
end
