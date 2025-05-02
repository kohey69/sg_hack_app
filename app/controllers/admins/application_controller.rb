class Admins::ApplicationController < ApplicationController
  before_action :authenticate_administrator!
end
