# frozen_string_literal: true

ActiveAdmin.register Fmpage do
  menu priority: 4
  permit_params :title
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :is_published, :en, :es, :pt, :cr
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :is_published, :en, :es, :pt, :cr]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
