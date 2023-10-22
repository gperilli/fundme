ActiveAdmin.register TextBlock do
  menu priority: 5
  config.sort_order = 'order_asc'


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :text_block, :en, :es, :pt, :order, :fmpage_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :language, :text_block, :order, :ddpage_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    column :title
    column :order
    column :fmpage

    column :en do |text_block|
      truncate(text_block.en, omision: "...", length: 100)
    end
    column :es do |text_block|
      truncate(text_block.es, omision: "...", length: 100)
    end
    column :pt do |text_block|
      truncate(text_block.pt, omision: "...", length: 100)
    end
    #column :cr do |text_block|
    #  truncate(text_block.cr, omision: "...", length: 100)
    #end
    actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :title
      f.input :fmpage, :label => "FundMe Page"
      #f.input :language, as: :radio
      f.input :order, :label => "Order"
      f.input :en, as: :html_editor, :label => "English"
      f.input :es, as: :html_editor, :label => "Spanish"
      f.input :pt, as: :html_editor, :label => "Portuguese"
      #f.input :text_block, as: :html_editor, :label => "Text Block"
      f.actions
    end
  end

end
