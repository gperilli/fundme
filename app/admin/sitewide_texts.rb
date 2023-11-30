# frozen_string_literal: true

ActiveAdmin.register SitewideText do
  menu priority: 6
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :en, :es, :pt, :cr
  actions :all, except: [:destroy]
  ###
  # or
  #
  # permit_params do
  #   permitted = [:name, :english, :spanish, :portuguese, :creole]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    column :name
    column :en do |text_item|
      truncate(text_item.en, omision: '...', length: 100)
    end
    column :es do |text_item|
      truncate(text_item.es, omision: '...', length: 100)
    end
    column :pt do |text_item|
      truncate(text_item.pt, omision: '...', length: 100)
    end

    actions
  end

  form do |f|
    f.inputs 'details' do
      # f.inputs do
      #  :title
      # end

      f.input :name # , input_html: #{ readonly: true}

      f.input :en, as: :html_editor, label: 'English'
      f.input :es, as: :html_editor, label: 'Spanish'
      f.input :pt, as: :html_editor, label: 'Portuguese'

      f.actions
    end
  end
end
